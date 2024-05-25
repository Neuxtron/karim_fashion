<div id="ordersBtn" >
  <h2>Order Details</h2>
  <table class="table table-striped">
    <thead>
      <tr>
        <th>O.N.</th>
        <th>Customer</th>
        <th>Contact</th>
        <th>OrderDate</th>
        <th>Payment Method</th>
        <th>Order Status</th>
        <th>Payment Status</th>
        <th>More Details</th>
     </tr>
    </thead>
     <?php
      include_once "../config/dbconnect.php";
      $sql="
        SELECT *, orders.createdAt as tanggal, orders.id as idOrder
        from orders LEFT JOIN users ON users.id=orders.idUser";
      $result=$conn-> query($sql);
      
      if ($result-> num_rows > 0){
        while ($row=$result-> fetch_assoc()) {
    ?>
       <tr>
          <td><?=$row["id"]?></td>
          <td><?=$row["alamat"]?></td>
          <td><?=$row["hp"]?></td>
          <td><?=$row["tanggal"]?></td>
          <td><?=$row["metodeBayar"]?></td>
           <?php 
                if($row["status"]=="Pending"){
                            
            ?>
                <td><button class="btn btn-danger" onclick="ChangeOrderStatus('<?=$row['idOrder']?>')">Pending </button></td>
            <?php
                        
                }else if($row["status"]=="Dikirim"){
            ?>
                <td><button class="btn btn-success" onclick="ChangeOrderStatus('<?=$row['idOrder']?>')">Delivered</button></td>
        
            <?php
            } else if($row["status"]=="Selesai"){
              ?>
                  <td><button class="btn btn-success" onclick="ChangeOrderStatus('<?=$row['idOrder']?>')">Recieved</button></td>
          
              <?php
              }
                if($row["status"]=="Pending"){
            ?>
                <td><button class="btn btn-danger"  onclick="">Unpaid</button></td>
            <?php
                        
            }else {
            ?>
                <td><button class="btn btn-success" onclick="">Paid </button></td>
            <?php
                }
            ?>
              
        <td><a class="btn btn-primary openPopup" data-href="./adminView/viewEachOrder.php?orderID=<?=$row['idOrder']?>" href="javascript:void(0);">View</a></td>
        </tr>
    <?php
            
        }
      }
    ?>
     
  </table>
   
</div>
<!-- Modal -->
<div class="modal fade" id="viewModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          
          <h4 class="modal-title">Order Details</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="order-view-modal modal-body">
        
        </div>
      </div><!--/ Modal content-->
    </div><!-- /Modal dialog-->
  </div>
<script>
     //for view order modal  
    $(document).ready(function(){
      $('.openPopup').on('click',function(){
        var dataURL = $(this).attr('data-href');
    
        $('.order-view-modal').load(dataURL,function(){
          $('#viewModal').modal({show:true});
        });
      });
    });
 </script>