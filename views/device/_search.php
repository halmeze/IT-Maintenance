<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
use app\models\Department;
use app\models\DeviceType;
use app\models\Device;

$department = ArrayHelper::map(Department::find()->all(),'id','department_name');

$device_type = ArrayHelper::map(DeviceType::find()->all(),'id','device_type');

$device_code = ArrayHelper::map(Device::find()->all(),'device_id','device_id');

$device_sn = ArrayHelper::map(Device::find()->all(),'serial_no','serial_no');

$device_name = ArrayHelper::map(Device::find()->all(),'id','device_name');

$model->department_id = $get_select['department_id'];

$model->device_type_id = $get_select['device_type_id'];

$this->title = 'ทะเบียนอุปกรณ์';

$device_type[0] = 'หมวดหมู่ทั้งหมด';

$department[0] = 'หน่วยงานทั้งหมด';
//array_push($department,['5']);
?>

    <h4><i class="glyphicon glyphicon-list-alt"></i> <?= Html::encode($this->title) ?>
	
		<?= Yii::$app->user->identity->role == 1 ?  Html::a('<i class="glyphicon glyphicon-plus"></i> เพิ่มอุปกรณ์', ['create'], ['class' => 'btn btn-success btn-sm pull-right']) :'' ?></h4>
		  
		<div class="row">
			<div class="col-md-12">
				  <!-- Nav tabs -->
				  <ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="<?= $active == 'device_id' ? 'active':''?>"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">ค้นหาจาก รหัสอุปกรณ์</a></li>
					<li role="presentation" class="<?= $active == 'device_type' ? 'active':''?>"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">ค้นหา หมวดหมู่ และ หน่วยงาน</a></li>
					<li role="presentation" class="<?= $active == 'device_name' ? 'active':''?>"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">ค้นหาจาก ชื่อเครื่อง</a></li>
					<li role="presentation" class="<?= $active == 'serial_no' ? 'active':''?>"><a href="#sn" aria-controls="sn" role="tab" data-toggle="tab">ค้นหาจาก Serial Number</a></li>

				  </ul>

				  <!-- Tab panes -->
				  <div class="tab-content">
				  
					<div role="tabpanel" class="tab-pane <?= $active == 'device_id' ? 'active':''?>" id="home">
							<div class="row">
							
								 <?php $form = ActiveForm::begin(['action'=>['search-id'],'method'=>'get']); ?>
						   
								<div class="form-group">
									<div class="col-md-4">

										<?=$form->field($model, 'device_id')->widget(Select2::classname(), [
											   'data' => $device_code,
											   'language' => 'th',
											   'options' => ['placeholder' => 'รหัสอุปกรณ์'],
											   'pluginOptions' => [
												   'allowClear' => true
											   ],
												'addon' => [
													'prepend' => [
														'content' => '<i class="glyphicon glyphicon-search"></i>',
													],
												]
										   ])->label(false);?>
										   
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-md-2">
										<?= Html::submitButton('<i class="glyphicon glyphicon-search"></i> ค้นหา', ['class' => 'btn btn-info input-sm']) ?>
									</div>
								</div>

								<?php ActiveForm::end(); ?>
							</div>
					</div>
					
					<div role="tabpanel" class="tab-pane <?= $active == 'device_type' ? 'active':''?>" id="profile">
					
							<div class="row">
							   <?php $form = ActiveForm::begin(['action'=>['search-device'],'method'=>'get']); ?>
							   
							   	<div class="form-group" >
									<div class="col-md-4">
									   <?=$form->field($model, 'device_type_id')->widget(Select2::classname(), [
										   'data' => $device_type,
										   'language' => 'th',
										   'options' => ['placeholder' => 'เลือกหมวดหมู่'],
										   'pluginOptions' => [
											   'allowClear' => true
										   ],
										   	'addon' => [
												'prepend' => [
													'content' => '<i class="glyphicon glyphicon-search"></i>',
												],
											]
									   ])->label(false);?>

								   </div>
							   </div>
							   
							   <div class="form-group" >
									<div class="col-md-4">
									   <?=$form->field($model, 'department_id')->widget(Select2::classname(), [
										   'data' => $department,
										   'language' => 'th',
										   'options' => ['placeholder' => 'เลือกชื่อหน่วยงาน'],
										   'pluginOptions' => [
											   'allowClear' => true
										   ],
										   
											'addon' => [
												'prepend' => [
													'content' => '<i class="glyphicon glyphicon-search"></i>',
												],
											]
						
									   ])->label(false);?>
								   </div>
							   </div>

							   <div class="form-group">
								   <div class="col-md-4">
									   
										<?=Html::submitButton('<i class="glyphicon glyphicon-search"></i> ค้นหา', ['class' => 'btn btn-primary btn-sm'])?>

								   </div>
							   </div>
							   <?php ActiveForm::end(); ?>
							</div>
					</div>
					<div role="tabpanel" class="tab-pane <?= $active == 'device_name' ? 'active':''?>" id="messages">
					
						<div class="row">
						
							 <?php $form = ActiveForm::begin(['action'=>['device-name'],'method'=>'get']); ?>
					   
							<div class="form-group">
								<div class="col-md-4">

									<?=$form->field($model, 'id')->widget(Select2::classname(), [
										   'data' => $device_name,
										   'language' => 'th',
										   'options' => ['placeholder' => 'ชื่ออุปกรณ์'],
										   'pluginOptions' => [
											   'allowClear' => true
										   ],
											'addon' => [
												'prepend' => [
													'content' => '<i class="glyphicon glyphicon-search"></i>',
												],
											]
									   ])->label(false);?>
									   
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-md-2">
									<?= Html::submitButton('<i class="glyphicon glyphicon-search"></i> ค้นหา', ['class' => 'btn btn-info input-sm']) ?>
								</div>
							</div>

							<?php ActiveForm::end(); ?>
						</div>
					
					</div>
					
					<div role="tabpanel" class="tab-pane <?= $active == 'serial_no' ? 'active':''?>" id="sn">
					
						<div class="row">
						
							 <?php $form = ActiveForm::begin(['action'=>['device-sn'],'method'=>'get']); ?>
					   
							<div class="form-group">
								<div class="col-md-4">

									<?=$form->field($model, 'serial_no')->widget(Select2::classname(), [
										   'data' => $device_sn,
										   'language' => 'th',
										   'options' => ['placeholder' => 'ค้นหาจาก Serial Number'],
										   'pluginOptions' => [
											   'allowClear' => true
										   ],
											'addon' => [
												'prepend' => [
													'content' => '<i class="glyphicon glyphicon-search"></i>',
												],
											]
									   ])->label(false);?>
									   
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-md-2">
									<?= Html::submitButton('<i class="glyphicon glyphicon-search"></i> ค้นหา', ['class' => 'btn btn-info input-sm']) ?>
								</div>
							</div>

							<?php ActiveForm::end(); ?>
						</div>
					
					</div>

				  </div>

			</div>
		</div>



