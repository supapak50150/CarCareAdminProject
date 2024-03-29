<?php
session_start();
require_once 'config/db.php';
if (!isset($_SESSION['manager_login'])) {
  header("location:../login.php");
}
?>

<!-- Main Sidebar Container -->
<!-- http://fordev22.com/ -->
<aside class="main-sidebar sidebar-light-navy elevation-4">
  <!-- Brand Logo -->
  <a href="" class="brand-link bg-navy">
    <img src="../assets/dist/img/Logo.png" alt="..." class="brand-image" style="opacity: .8">
    <span class="brand-text font-weight-light">Car Care</span>
  </a>

  <!-- Sidebar -->
  <div class="sidebar">
    <!-- Sidebar user (optional) -->
    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
      <div class="image">
        <?php
        if (isset($_SESSION['manager_login'])) {
          $user_id = $_SESSION['manager_login'];
          $stmt = $conn->query("SELECT * FROM user WHERE user_id = $user_id");
          $stmt->execute();
          $result = $stmt->fetch(PDO::FETCH_ASSOC);

        ?>
          <img src="../pic_profile/<?php echo $result['img_profile'] ?>" class="img-circle elevation-2">
      </div>
      <div class="info">
        <a class="d-block">
          <p>ผู้จัดการ :
            <?php echo $result['firstname'] . ' ' . $result['lastname'] ?></p>
        </a>
      </div>
    </div>
  <?php } ?>

  <!-- Sidebar Menu -->
  <nav class="mt-2">
    <!-- nav-compact -->
    <ul class="nav nav-pills nav-sidebar nav-child-indent flex-column" data-widget="treeview" role="menu" data-accordion="false">
      <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
      <li class="nav-header">MENU</li>

      <li class="nav-item">
        <a href="m_serve.php" class="nav-link <?php if ($menu == "m_serve") {
                                                echo "active";
                                              } ?> ">
          <i class="nav-icon fas fa-duotone fa-car"></i>
          <p>การรับบริการ</p>
        </a>
      </li>

      <li class="nav-item">

        <a href="m_edit-profile.php" class="nav-link <?php if ($menu == "m_edit-profile") {
                                                        echo "active";
                                                      } ?> ">
          <i class="nav-icon fas fa-user-edit"></i>
          <p>แก้ไขบัญชีผู้ใช้</p>
        </a>
      </li>

      <li class="nav-item">

        <a href="m_edit-img_profile.php?admin_id=<?php echo $user_id;?>" class="nav-link <?php if ($menu == "m_edit-img_profile") {
                                                            echo "active";
                                                          } ?> ">
          <i class="nav-icon fas fa-user-edit"></i>
          <p>เปลี่ยนรูปประจำตัว</p>
        </a>
      </li>

      <li class="nav-item">
        <a href="m_member.php" class="nav-link <?php if ($menu == "m_member") {
                                                  echo "active";
                                                } ?> ">
          <i class="nav-icon fas fa-address-card"></i>
          <p>จัดการข้อมูลพนักงาน</p>
        </a>
      </li>

      <li class="nav-item">
        <a href="m_income.php" class="nav-link <?php if ($menu == "m_income") {
                                                  echo "active";
                                                } ?> ">
          <i class="nav-icon fas fa-chart-line"></i>
          <p>รายได้</p>
        </a>
      </li>

      <div class="user-panel mt-2 pb-3 mb-2 d-flex"></div>
      <li class="nav-item">
        <a href="../logout.php" class="nav-link text-danger">
          <i class="nav-icon fas fa-power-off"></i>
          <p>ออกจากระบบ</p>
        </a>
      </li>
    </ul>
  </nav>

  <!-- /.sidebar-menu -->
  <!-- http://fordev22.com/ -->
  </div>
  <!-- /.sidebar -->
</aside>