<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use app\models\Job;
/* @var $this yii\web\View */
/* @var $model app\models\Job */
$this->title = 'แบบบันทึกข้อมูลการปฏิบัติงาน';
?>

<div class="container">

   	<div class="col-md-offset-2 col-md-8">
		<h3><?= Html::encode($this->title) ?>
			<div class="pull-right" id="non-printable">
					<button class="btn btn-info btn-sm" onclick="return window.print();"><i class="glyphicon glyphicon-print"></i>  พิมพ์รายงาน</button>
					<button class="btn btn-default btn-sm" onclick="return window.close();"><i class="glyphicon glyphicon-off"></i> ปิด</button>
			</div>
		</h3>
			<hr>
				<h4>ข้อมูลการแจ้ง</h4>
				
				<p>วันที่แจ้ง : <?=Job::getDateTime($model->job_date)?></p>
				<p>ชื่อผู้แจ้ง : <?=$model->employee->user_fullname?></p>
				<p>ตำแหน่ง : <?=$model->employee->user_position?></p>
				<p>หน่วยงาน/แผนก : <?=$model->employee->department->department_name?></p>
				
	
				<p>ปัญหา/อาการเสีย : <?=$model->job_detail?></p>
				<hr>
				<h4>ข้อมูลการแก้ไข</h4>
				<p>ประเภทงาน : <?=!empty($model->jobType->job_type_name) ? $model->jobType->job_type_name : ' '?></p>
				<p>หมวดหมู่อุปกรณ์ : <?=!empty($model->device->deviceType->device_type) ? $model->device->deviceType->device_type : '  '?></p>
				<p>ชื่ออุปกรณ์ : <?=!empty($model->device->device_name) ? $model->device->device_name : '  '?></p>
				<p>ชื่อผู้ดำเนินการ : <?=!empty($model->user->fullname) ? $model->user->fullname : ''?></p>
				<p>วันที่แก้ไข : <?=Job::getDateTime($model->job_start_date)?></p>
				<p>วันที่เสร็จ : <?=Job::getDateTime($model->job_success_date)?></p>
				<p>วิธีแก้ไข/สาเหตุ : <?= $model->job_how_to_fix?></p>
				<p>ค่าใช้จ่าย : <?=number_format($model->price)?></p>
				<p>ผลการแก้ไข : <?= Job::getStatus($model->job_status)?></p>
			<hr>	
			<table style="font-size:16px;">
				<tr>
						<td style="width:10%"></td>
						<td style="width:30%">ลงชื่อ...............................................</td>
						<td style="width:10%"></td>
						<td style="width:10%"></td>
						<td style="width:10%"></td>
						<td style="width:30%">ลงชื่อ...............................................</td>
				</tr>
				<tr>
						<td style="width:10%"></td>
						<td style="width:30%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(...............................................)</td>
						<td style="width:10%"></td>
						<td style="width:10%"></td>
						<td style="width:10%"></td>
						<td style="width:30%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(...............................................)</td>
				</tr>
				<tr>
						<td style="width:10%"></td>
						<td style="width:30%;text-align:center;">ผู้แจ้ง</td>
						<td style="width:10%"></td>
						<td style="width:10%"></td>
						<td style="width:10%"></td>
						<td style="width:30%;text-align:center;">ผู้ดำเนินการ</td>
				</tr>

			</table>	
		</div>	
				

					

</div>






