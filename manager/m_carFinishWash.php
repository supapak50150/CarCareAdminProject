<?php
$menu = "m_carFinishWash";
include("../header_m.php");
?>

<!-- Content Header (Page header) -->
<section class="content-header">
  <div class="container-fluid">
    <h1><i class="nav-icon fas fa-car p-2"></i>การรับบริการ</h1>
  </div>
</section>
<!-- /.container-fluid -->

<!-- Main content -->
<section class="content">
  <div class="card">
    <div class="card-header card-primary card-outline bg-primary">
      <h5>สถานะการรับบริการ</h5>
      <?php include("m_tabStatus.php"); ?>
    </div>
  </div>

  <!-- Stat card-body -->
  <div class="card-body bg-whith">

        <!-- Stat col -->
        <div class="col-md-10">
          <p class="h2"><strong>รายการที่..รอชำระเงิน</strong></p>
          <hr>
          <!-- Stat table-->
          <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
            <thead>
            <tr role="row" class="h6 text-center">
                <th tabindex="0" rowspan="1" colspan="1" style="width: 15%;">รหัสออเดอร์</th>
                <th tabindex="0" rowspan="1" colspan="1" >ข้อมูลลูกค้า/บริการ</th>
                <th tabindex="0" rowspan="1" colspan="1" style="width: 15%;">ประเภทรถ</th>
                <th tabindex="0" rowspan="1" colspan="1" style="width: 10%;">ยี่ห้อ</th>
                <th tabindex="0" rowspan="1" colspan="1" style="width: 10%;">รุ่น</th>
                <th tabindex="0" rowspan="1" colspan="1" style="width: 10%;">เลขทะเบียน</th>
                <th tabindex="0" rowspan="1" colspan="1" style="width: 10%;">ค่าบริการ</th>
                <th tabindex="0" rowspan="1" colspan="1" style="width: 10%;">เวลา</th>
                 </tr>
            </thead>
            <tbody>
              <?php

              $stmt = $conn->prepare("SELECT * FROM order_main natural join customer natural join main_service where status = 'waitPayment' ");
              $stmt->execute();
              $result = $stmt->fetchAll();

              foreach ($result as $row) {
              ?>
                <tr>
                  <th scope="row" class="text-center"><?= $row['order_id']; ?></th>
                  <td class="text">
                    <div><b>ชื่อ-นามสกุล :</b><?= $row['cus_fname'] . ' ' . $row['cus_lname']; ?></div>
                    <p><b>เบอร์โทรศัพท์ :</b><?= $row['cus_tel']; ?></p>
                    <p><b>บริการเริ่มต้น :</b><?= $row['service']; ?></p>

                    <?php
                    $order_id = $row['order_id'];
                    $stmt = $conn->prepare("SELECT * FROM order_add_on natural join add_on_service where order_id = $order_id");
                    $stmt->execute();
                    $result2 = $stmt->fetchAll();
                    $num = 1;
                    foreach ($result2 as $row2) {
                    ?>
                      <div><b>บริการเสริม <?= $num++; ?> :</b> <?= $row2['add_service']; ?></div>
                      

                    <?php } ?>
                  </td>
                  <td class="text-center"><?= $row['car_type']; ?></td>
                  <td class="text-center"><?= $row['car_brand']; ?></td>
                  <td class="text-center"><?= $row['car_series']; ?></td>
                  <td class="text-center"><?= $row['car_id']; ?></td>
                  <td class="text-center"><b>฿</b> <?= $row['total']; ?></td>
                  <td class="text-center"><?= $row['date']; ?></td>
                </tr>
              <?php } ?>
            </tbody>
          </table>
          <!-- /.table-->
        </div>
        <!-- /. col -->
    </div>
  </div>
  <!-- /.card-body -->
  </div>
  <!--/.card -->
</section>
<!-- /.content -->

<!-- footer -->
<?php include('../footer.php'); ?>
<script>
  $(function() {
    $(".datatable").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
    });
  });
</script>
</body>

</html>