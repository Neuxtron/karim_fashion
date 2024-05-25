<?php
include_once "../config/dbconnect.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Earnings</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h3 class="text-center">Monthly Earnings</h3>
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th class="text-center">S.N.</th>
                    <th class="text-center">Month</th>
                    <th class="text-center">Year</th>
                    <th class="text-center">Total Earnings</th>
                    <th class="text-center" colspan="2">Action</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $sql = "SELECT * FROM monthly_earnings";
                $result = $conn->query($sql);
                $count = 1;
                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                ?>
                <tr>
                    <td class="text-center"><?= $count ?></td>
                    <td class="text-center"><?= $row["month"] ?></td>
                    <td class="text-center"><?= $row["year"] ?></td>
                    <td class="text-center">$<?= number_format($row["total_earnings"], 2) ?></td>
                    <td class="text-center"><button class="btn btn-primary" style="height:40px" onclick="editEarnings('<?= $row['id'] ?>')">Edit</button></td>
                    <td class="text-center"><button class="btn btn-danger" style="height:40px" onclick="deleteEarnings('<?= $row['id'] ?>')">Delete</button></td>
                </tr>
                <?php
                        $count = $count + 1;
                    }
                } else {
                    echo "<tr><td colspan='6' class='text-center'>No earnings data found</td></tr>";
                }
                ?>
            </tbody>
        </table>

        <!-- Trigger the modal with a button -->
        <button type="button" class="btn btn-secondary" style="height:40px" data-toggle="modal" data-target="#earningsModal">
            Add Earnings
        </button>

        <!-- Modal -->
        <div class="modal fade" id="earningsModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">New Earnings</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;"></button>
                    </div>
                    <div class="modal-body">
                        <form  enctype='multipart/form-data' action="./controller/addEarningsController.php" method="POST">
                            <div class="form-group">
                                <label for="month">Month:</label>
                                <input type="text" class="form-control" name="month" required>
                            </div>
                            <div class="form-group">
                                <label for="year">Year:</label>
                                <input type="number" class="form-control" name="year" required>
                            </div>
                            <div class="form-group">
                                <label for="total_earnings">Total Earnings:</label>
                                <input type="number" class="form-control" name="total_earnings" required>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-secondary" name="upload" style="height:40px">Add Earnings</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" style="height:40px">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
    <script>
        function addEarnings() {
            // Implement the function to handle adding earnings
        }

        function editEarnings(id) {
            // Implement the function to handle editing earnings
        }

        function deleteEarnings(id) {
            // Implement the function to handle deleting earnings
        }
    </script>
</body>
</html>
