<?php
use yii\helpers\Html;
use yii\grid\GridView;
use kartik\growl\Growl;

$this->title = 'นำเข้า - ส่งออก ข้อมูลไฟล์ Excel';

if(Yii::$app->session->hasFlash('import_success')):
    echo Growl::widget([
        'type' => Growl::TYPE_SUCCESS,
        'icon' => 'glyphicon glyphicon-ok-sign',
        'title' => 'สำเร็จ',
        'showSeparator' => true,
        'body' => 'นำเข้าข้อมูลของคุณเรียบร้อยแล้ว <br> โปรดตรวจสอบความถูกต้องของข้อมูลอีกครั้ง'
    ]);
endif;
?>

<div class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading"><i class="glyphicon glyphicon-import"></i> นำเข้า ข้อมูลไฟล์ Excel</div>
    
    <div class="panel-body">
	
		<div class="well">
			<p><b>คุณสามารถนำเข้า ข้อมูล ในรูปแบบไฟล์ Excel ได้ โดยรองรับรูปแบบไฟล์ .xlsx</b></p>
			<p><u>การนำเข้าข้อมูล</u></p>
				<ul>
					<li>เปิดไฟล์ และบันทึกข้อมูล  ตามไฟล์  Excel ตัวอย่าง 
					<li>คลิกเมนู นำเข้า Excel ตามข้อมูลที่ต้องการนำเข้า
					<li>เลือกไฟล์  Excel ที่คุณได้เตรียมข้อมูลไว้
					<li>คลิกปุ่มยืนยันการนำเข้าข้อมูล
					<li>เมื่อนำเข้าข้อมูลเรียบร้อยแล้ว โปรดตรวจสอบความถูกต้องของข้อมูลในระบบอีกครั้ง
				</ul>
		</div>


        <table class="table table-bordered">
			<thead>
				<tr>
					<th width="5%" >ลำดับ</th>
					<th width="55%">ชื่อเมนู</th>
					<th width="20%" >รูปแบบไฟล์ตัวอย่าง</th>
					<th width="20%" style="text-align:center">นำเข้าข้อมูล Excel</th>
				</tr>
			</thead>
			<tr>
				<td align="center">1</td>
				<td>หมวดหมู่อุปกรณ์</td>
				<td><?=Html::a('device_type.xlsx','example/device_type.xlsx');?></td>
				<td align="center"><?=Html::a('<i class="glyphicon glyphicon-import"></i> นำเข้า Excel',['device-type'],['class'=>'btn btn-info btn-xs']);?></td>
			</tr>
			<tr>
				<td align="center">2</td>
				<td>หน่วยงาน/แผนก</td>
				<td><?=Html::a('department.xlsx','example/department.xlsx');?></td>
				<td align="center"><?=Html::a('<i class="glyphicon glyphicon-import"></i> นำเข้า Excel',['department'],['class'=>'btn btn-info btn-xs']);?></td>
			</tr>
			<tr>
				<td align="center">3</td>
				<td>พนักงาน/ผู้แจ้ง</td>
				<td><?=Html::a('employee.xlsx','example/employee.xlsx');?></td>
				<td align="center"><?=Html::a('<i class="glyphicon glyphicon-import"></i> นำเข้า Excel',['employee'],['class'=>'btn btn-info btn-xs']);?></td>
			</tr>
			<tr>
				<td align="center">4</td>
				<td>ทะเบียนอุปกรณ์</td>
				<td><?=Html::a('device.xlsx','example/device.xlsx');?></td>
				<td align="center"><?=Html::a('<i class="glyphicon glyphicon-import"></i>นำเข้า Excel',['device'],['class'=>'btn btn-info btn-xs']);?></td>
			</tr>
		</table>

        
   	 </div>

</div>

