<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Items</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <style>
        .table thead th {
            background-color: #002147;
            color: white;
            border-color: #002147;
        }
        .table tbody td {
            border-color: #002147;
        }
        .btn-secondary {
            background-color: #002147;
            border-color: #002147;
        }
        .modal-header {
            background-color: #002147;
            color: white;
        }
        .modal-header .close {
            color: white;
        }
    </style>
</head>
<body>
<div style="padding: 20px;">
  <h3 style="color: #002147;">Category Items</h3>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th class="text-center">S.N.</th>
        <th class="text-center">Category Name</th>
        <th class="text-center" colspan="2">Action</th>
      </tr>
    </thead>
    <tbody>
      <?php
        include_once "../config/dbconnect.php";
        $sql="SELECT * from kategori";
        $result=$conn-> query($sql);
        $count=1;
        if ($result-> num_rows > 0){
          while ($row=$result-> fetch_assoc()) {
      ?>
      <tr>
        <td class="text-center"><?=$count?></td>
        <td class="text-center"><?=$row["nama"]?></td>
        <td class="text-center"><button class="btn btn-danger" style="height:40px;" onclick="categoryDelete('<?=$row['id']?>')">Delete</button></td>
      </tr>
      <?php
              $count=$count+1;
            }
          }
        ?>
    </tbody>
  </table>

  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-secondary" style="height:40px;" data-toggle="modal" data-target="#myModal">
    Add Category
  </button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">New Category Item</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <form enctype='multipart/form-data' action="./controller/addCatController.php" method="POST">
            <div class="form-group">
              <label for="c_name">Category Name:</label>
              <input type="text" class="form-control" name="c_name" required>
            </div>
            <div class="form-group">
              <button type="submit" class="btn btn-secondary" name="upload" style="height:40px;">Add Category</button>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" style="height:40px;">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
