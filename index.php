<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>TP Noticias</title>
</head>
<body>
<div class="container p-4 col-md-5">
    
    <?php
    $hostname = "localhost";
    $database = "noticias";
    $username = "root";
    $password = '';

        try{
            $conexion = new PDO ('mysql:host=' . $hostname . ';dbname=' . $database, $username, $password);
            
        }
        catch(PDOException $e){
            print "ERROR: ".$e->getMessage();
            die();
        }
    ?>
<h2>Listado de Escritores</h2>

<?php
  $sqlUno = "SELECT * FROM `escritores`;";
    $resultado = $conexion->query($sqlUno);
?>
<table border="2">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Edad</th>
                <th>Fecha de ultima Publicacion</th>
                <th>Cantidad Noticias</th>
            </tr>
        </thead>
        <tbody>
                            <tr>
                              <?php foreach ( $resultado as $filas){?>
                                <td><?=$filas['id']?></td>
                                <td><?=$filas['nombre']?></td>
                                <td><?=$filas['edad']?></td>
                                <?php
                                  $test = $filas['id'];
                                  $sqlDos = "SELECT COUNT(*) FROM `noticias` WHERE id_escritor = '".$test."';";
                                  $resultadoDOs = $conexion->query($sqlDos);

                                  $sqlTres ="SELECT fecha FROM `noticias` WHERE id_escritor = '".$test."' ORDER BY fecha DESC LIMIT 1;";
                                  $resultadoTres = $conexion->query($sqlTres);
                                ?>

                                <td>
                                  <?php while($f = $resultadoTres->fetch(PDO::FETCH_ASSOC) ){?>
                                  <?php  echo $f['fecha']." "; ?>
                                  <?php  } ?>
                                </td>
                                <td>
                                  <?php while($f = $resultadoDOs->fetch(PDO::FETCH_ASSOC) ){?>
                                  <?php  echo $f['COUNT(*)']." "; ?>
                                  <?php  } ?>
                                </td>
                            </tr>
                        <?php } ?>
                </tbody>
        </table>

<h2>Agregar Noticias</h2>
        <div class="container">
        			<form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="POST">

        				<p>Titulo</p>
        				<input type="text" name="titulo" placeholder="titulo" required>

        				<p>Fecha</p>
        				<input type="date" name="fecha" required>

        				<p>Descripcion</p>
        				<textarea name="descripcion" placeholder="descripcion" required></textarea>

              </br>
              <p>Seleccione su escritor</p>
                <?php
                $sqlCuatro = "SELECT * FROM escritores;";
                $resultadoCuatro = $conexion->query($sqlCuatro);
                ?>
                <select name="escritor">
                  <?php foreach ($resultadoCuatro as $escritor) { ?>
                    <option value="<?= $escritor['id']; ?>">
                      <?= $escritor['nombre']; ?>
                    </option>
                  <?php  } ?>
                </br>
                </select>

        				<input type="submit" value="Enviar" name="submit">
              </form>
        </div>
<?php
if (isset($_POST['submit'])){
  $titulo = $_POST['titulo'];
  $fecha = $_POST['fecha'];
  $descripcion = $_POST['descripcion'];
  $escritor = $_POST['escritor'];
    $sqlCinco = "INSERT INTO noticias (id, titulo, fecha, descripcion, id_escritor) VALUES (NULL, '$titulo', '$fecha', '$descripcion', '$escritor');";
    $contador = $conexion->exec($sqlCinco);
    print($contador." Filas afectadas");
}
?>
</div>
</body>
</html>