<?php
    include_once "../config/dbconnect.php";

    $v_id=$_POST['v_id'];
    $product= $_POST['product'];
    $size= $_POST['size'];
    $qty= $_POST['qty'];
   
    $updateItem = mysqli_query($conn,"UPDATE stok SET 
        idProduk=$product, 
        idVariasi=$size,
        stok=$qty 
        WHERE id=$v_id");


    if($updateItem)
    {
        echo "true";
    }
?>