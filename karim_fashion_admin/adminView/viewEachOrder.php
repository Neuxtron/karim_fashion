<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body style="background-color: #2c3e50; color: white;">
<div class="container mt-5">
    <h2 style="color: #002147;">Order Details</h2>
    <table class="table table-striped table-bordered">
        <thead>
            <tr style="background-color: #002147; color: white; text-align: center;">
                <th>S.N.</th>
                <th>Product Image</th>
                <th>Product Name</th>
                <th>Size</th>
                <th>Quantity</th>
                <th>Unit Price</th>
            </tr>
        </thead>
        <tbody>
            <?php
                include_once "../config/dbconnect.php";
                $ID= $_GET['orderID'];
                $sql="
                    SELECT produk.gambar, produk.nama as namaProduk, produk.harga,
                    variasi.nama as namaVariasi, keranjang.amount
                    FROM keranjang LEFT JOIN produk ON produk.id=keranjang.idProduk
                    LEFT JOIN stok ON stok.id=keranjang.idStok
                    LEFT JOIN variasi ON variasi.id=stok.idVariasi
                    WHERE keranjang.idOrder=$ID
                ";
                $result=$conn-> query($sql);
                $count=1;
                if ($result-> num_rows > 0){
                    while ($row=$result-> fetch_assoc()) {
            ?>
                        <tr style="text-align: center;">
                            <td><?=$count++?></td>
                            <td><img height="80px" src="./images/<?=$row["gambar"]?>"></td>
                            <td><?=$row["namaProduk"] ?></td>
                            <td><?=$row["namaVariasi"] ?></td>
                            <td><?=$row["amount"]?></td>
                            <td><?=$row["harga"]?></td>
                        </tr>
            <?php
                    }
                } else {
                    echo "<tr><td colspan='6' class='text-center' style='color: white;'>No records found</td></tr>";
                }
            ?>
        </tbody>
    </table>
</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
