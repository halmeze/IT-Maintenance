<?php
use yii\helpers\Html;
?>

<ul class="nav nav-pills" style="margin-top:15px;border-bottom: 1px solid #ccc;">
  <li <?= $active == "job" ? 'class="active"' : ''?>><?= Html::a('<i class="glyphicon glyphicon-tasks"></i> ข้อมูลการทำงาน',['index'])?></li>
  <li <?= $active == "device_list" ? 'class="active"' : ''?>><?= Html::a('<i class="glyphicon glyphicon-list-alt"></i> ทะเบียนอุปกรณ์',['device-list'])?></li>
  <li <?= $active == "device" ? 'class="active"' : ''?>><?= Html::a('<i class="glyphicon glyphicon-wrench"></i> ประวัติการซ่อมบำรุง',['device-repair'])?></li>
  <li <?= $active == "cost" ? 'class="active"' : ''?>><?= Html::a('<i class="glyphicon glyphicon-file"></i>สรุปงานซ่อม/ค่าซ่อมบำรุง',['cost-department'])?></li>
  <li <?= $active == "chart_type" ? 'class="active"' : ''?> role="presentation" class="dropdown">
        <a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown" aria-controls="myTabDrop1-contents"><i class="glyphicon glyphicon-file"></i>สถิติการซ่อม <span class="caret"></span></a>
        <ul class="dropdown-menu" aria-labelledby="myTabDrop1" id="myTabDrop1-contents">
          <li><?= Html::a('<i class="glyphicon glyphicon-file"></i> สถิติการซ่อมแยกตามประเภทงานซ่อม',['chart-job-type'])?></li>
          <li><?= Html::a('<i class="glyphicon glyphicon-file"></i> สถิติการซ่อมแยกตามหมวดหมู่อุปกรณ์',['chart-type'])?></li>
          <li><?= Html::a('<i class="glyphicon glyphicon-file"></i> สถิติการซ่อมแยกตามแผนก / หน่วยงาน',['chart-department'])?></li>
		</ul>
   </li>

</ul>

<?php
$this->registerJs("
	$(function(){
		$('#report').addClass('active');
	});
");
?>


	
