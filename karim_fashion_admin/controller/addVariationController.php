<?php
    include_once "../config/dbconnect.php";
    
    if(isset($_POST['upload']))
    {
       
        $product = $_POST['product'];
        $size= $_POST['size'];
        $qty = $_POST['qty'];

         $insert = mysqli_query($conn,"INSERT INTO stok
         (idProduk,idVariasi,stok) VALUES ('$product','$size','$qty')");
 
         if(!$insert)
         {
             echo mysqli_error($conn);
             header("Location: ../index.php?variation=error");
         }
         else
         {
             echo "Records added successfully.";
             header("Location: ../index.php?variation=success");
         }
     
    }
        
?>