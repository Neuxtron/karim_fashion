<?php include_once "./config/dbconnect.php"; ?>

<!-- nav -->
<nav class="navbar navbar-expand-lg navbar-light px-5" style="background-color: #002147;">
    <a class="navbar-brand ml-5" href="./index.php">
        <img src="./assets/images/DALL·E-2024-03-25-21.49.png" width="80" height="80" alt="Swiss Collection" style="border-radius: 50%; object-fit: cover;">
    </a>
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0"></ul>
    
    <div class="user-cart d-flex align-items-center">  
        <?php if(isset($_SESSION['user_id'])): ?>
            <a href="" style="text-decoration:none;">
                <i class="fa fa-user mr-5" style="font-size:30px; color:#fff;" aria-hidden="true"></i>
            </a>
        <?php else: ?>
            <a href="" style="text-decoration:none;">
                <i class="fa fa-sign-in mr-5" style="font-size:30px; color:#fff;" aria-hidden="true"></i>
            </a>
        <?php endif; ?>
        
        <!-- Admin Header -->
        <a href="logout.php" class="logout-btn ml-3" style="text-decoration:none; font-size:20px; color:#fff;">Logout</a>
    </div>  
</nav>
