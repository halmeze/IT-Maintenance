<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

$this->title = 'นำเข้าข้อมูล ทะบียนอุปกรณ์ จากไฟล์ Excel';

?>
    <h4><?= Html::encode($this->title) ?></h4>
		<hr>
			<div class="row">
				<div class="col-md-offset-3 col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading">เลือกไฟล์ Excel ที่ต้องการนำเข้าข้อมูล</div>
						<div class="panel-body">
						
							<p class="alert alert-warning"><b>โปรดตรวจสอบข้อมูล หมวดหมู่อุปกรณ์ และ หน่วยงาน/แผนก ให้ตรงกับที่ระบุไว้ในระบบ</b></p>
						
							<div class="col-md-12">
								<img src="img/device.png" class="img-responsive">
							</div>
							
							<?php 
							$form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

							<?= $form->field($model, 'file')->fileInput() ?>
							<hr>
							<p>เมื่อนำเข้าข้อมูลเรียบร้อยแล้ว โปรดตรวจสอบความถูกต้องอีกครั้งที่ <br> เมนู ทะเบียนอุปกรณ์</p>
							<div class="form-group">
								<?= Html::submitButton('ยืนยันการนำเข้าข้อมูล', ['class' => 'btn btn-success']) ?>
								<?= Html::a('ยกเลิก',['index'],['class'=>'btn btn-default'])?>
							</div>

							<?php ActiveForm::end(); ?>
							
						</div>
					</div>
				</div>
			</div>
