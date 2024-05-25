<?php

    include_once "../config/dbconnect.php";
   
    $order_id=$_POST['record'];
    //echo $order_id;
    $sql = "SELECT status from orders where id='$order_id'"; 
    $result=$conn-> query($sql);
  //  echo $result;

    $row=$result-> fetch_assoc();
    
   // echo $row["pay_status"];
    
    if($row["status"]=="Pending"){
         $update = mysqli_query($conn,"UPDATE orders SET status='Dikirim' where id='$order_id'");
    }
    else if($row["status"]=="Dikirim"){
         $update = mysqli_query($conn,"UPDATE orders SET status='Selesai' where id='$order_id'");
    }
    else if($row["status"]=="Selesai"){
         $update = mysqli_query($conn,"UPDATE orders SET status='Pending' where id='$order_id'");
    }
    
        
 
    // if($update){
    //     echo"success";
    // }
    // else{
    //     echo"error";
    // }
    
?>