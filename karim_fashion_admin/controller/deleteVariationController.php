<?php

    include_once "../config/dbconnect.php";
    
    $id=$_POST['record'];
    $query="DELETE FROM stok where id='$id'";

    $data=mysqli_query($conn,$query);

    if($data){
        echo"variation Deleted";
    }
    else{
        echo"Not able to delete";
    }
    
?>