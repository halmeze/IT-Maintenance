<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\Employee;
use dektrium\user\models\User;
use app\models\JobType;
use app\models\Device;
use yii\helpers\ArrayHelper;
use janisto\timepicker\TimePicker;
use kartik\select2\Select2;

/* @var $this yii\web\View */
/* @var $model app\models\Job */
/* @var $form yii\widgets\ActiveForm */

$employee = ArrayHelper::map(Employee::find()->all(),'id','user_fullname','department.department_name');

$job_type = ArrayHelper::map(JobType::find()->all(),'id','job_type_name');

$device = ArrayHelper::map(Device::find()->select(['id,CONCAT(device_id," - ",device_name) AS device_name,device_type_id'])->all(),'id','device_name','deviceType.device_type');

$select_user = ArrayHelper::map(User::find()->all(),'id','fullname');


?>

<div class="row">

<?php $form = ActiveForm::begin(['options'=>['class'=>'']]); ?>

    <div class="col-md-12">

        <div class="col-md-6">
            <p class="well well-sm"><i class="glyphicon glyphicon-pencil"></i> ข้อมูลผู้แจ้ง</p>
                <div class="form-group" >
                     <div class="col-md-12">
                        <label  class="col-md-3">วันที่แจ้ง</label>
                        <div class="col-md-8" >
                            <?=
                            $form->field($model, 'job_date')->widget(TimePicker::className(), [
                                'language' => 'th',
                                'mode' => 'datetime',
                                'options' => ['class' => 'form-control input-sm'],
                                'clientOptions' => [
                                    'dateFormat' => 'yy-mm-dd',
                                    'timeFormat' => 'HH:mm',
                                ],
                            ])->label(false);
                            ?>
                        </div>
                    </div>
                </div>
                <div class="form-group" >
                    <div class="col-md-12">
                        <label  class="col-md-3">ชื่อผู้แจ้ง</label>
                            <div class="col-md-8" >
                                <?=
                                $form->field($model, 'job_employee_id')->widget(Select2::classname(), [
                                    'data' => $employee,
                                    'language' => 'th',
                                    'options' => ['class' => 'form-control input-sm', 'placeholder' => 'เลือกชื่อผู้แจ้ง'],
                                    'pluginOptions' => [
                                        'allowClear' => true
                                    ],
                                ])->label(false);
                                ?>
                            </div>
                    </div>
                </div>  
                
        </div>
        <div class="col-md-6">
            <p class="well well-sm"><i class="glyphicon glyphicon-user"></i>  ข้อมูลผู้ดำเนินการ</p>
                <div class="form-group" >
                    <div class="col-md-12">
                        <label  class="col-md-3 ">วันที่ซ่อม</label>
                        <div class="col-md-8" >
                            <?=
                            $form->field($model, 'job_start_date')->widget(TimePicker::className(), [
                                'language' => 'th',
                                'mode' => 'datetime',
                                'options' => ['class' => 'form-control input-sm'],
                                'clientOptions' => [
                                    'dateFormat' => 'yy-mm-dd',
                                    'timeFormat' => 'HH:mm',
                                ]
                            ])->label(false);
                            ?>
                        </div>
                     </div>
                </div>
            <div class="form-group" >
                <div class="col-md-12">
                    <label  class="col-md-3">ผู้ดำเนินการ</label>
                    <div class="col-md-8" >

                        <?php
							if(!empty($model->user_id)){
							
								$user =  User::findOne($model->user_id);
								
							}else{
							
								$user =  User::findOne(Yii::$app->user->identity->id);
							}
							
						if(Yii::$app->user->identity->role == 1){
						
							$model->user_id = $user->id;
							
							echo $form->field($model, 'user_id')->widget(Select2::classname(), [
									'data' => $select_user,
									'hideSearch' => 'true',
									'language' => 'th',
									'options' => ['placeholder' => 'เลือกประเภทงาน'],
									'pluginOptions' => [
										'allowClear' => true
									],
								])->label(false);

						}else{
							echo $user->fullname;
							echo $form->field($model,'user_id')->hiddenInput(['value'=>$user->id])->label(false);
							
						}
							
                        ?>

                    </div>
                </div>
            </div>
            
        </div>              
    </div>
    <div class="col-md-12">
        <div class="col-md-6" >
            
            <p class="well well-sm"><i class="glyphicon glyphicon-list-alt"></i>  ข้อมูลปัญหา/อุปกรณ์</p>
            <div class="form-group" >
                <div class="col-md-12">
                    <label  class="col-md-3">ประเภทงาน</label>
                    <div class="col-md-8" >
                        <?=
                        $form->field($model, 'job_type_id')->widget(Select2::classname(), [
                            'data' => $job_type,
                            'hideSearch' => 'true',
                            'language' => 'th',
                            'options' => ['placeholder' => 'เลือกประเภทงาน'],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                        ])->label(false);
                        ?>
                    </div>
                </div>
            </div>

            <div class="form-group" >
                <div class="col-md-12">
                    <label  class="col-md-3">ชื่ออุปกรณ์</label>
                    <div class="col-md-8" >
                        <?=
                        $form->field($model, 'device_id')->widget(Select2::classname(), [
                            'data' => $device,
                            'language' => 'th',
                            'options' => ['placeholder' => 'เลือกชื่ออุปกรณ์'],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                        ])->label(false);
                        ?>
                    </div>
                </div>
            </div>
            <div class="form-group" >
                <div class="col-md-12">
                    <label  class="col-md-3">ปัญหา</label>
                    <div class="col-md-8"  >
                        <?= $form->field($model, 'job_detail')->textArea(['rows'=>'5','class'=>'form-control input-sm'])->label(false) ?>
                    </div>
                </div>
            </div>
            
        </div>
        <div class="col-md-6">
            <div class="well well-sm"><i class="glyphicon glyphicon-ok"></i> ผลการแก้ไข</div>

                <div class="form-group" >
                     <div class="col-md-12">
                        <label  class="col-md-3">วันที่เสร็จ</label>
                        <div class="col-md-8" >
                            <?=
                            $form->field($model, 'job_success_date')->widget(TimePicker::className(), [
                                'language' => 'th',
                                'mode' => 'datetime',
                                'options' => ['class' => 'form-control input-sm'],
                                'clientOptions' => [
                                    'dateFormat' => 'yy-mm-dd',
                                    'timeFormat' => 'HH:mm',
                                ]
                            ])->label(false);
                            ?>
                        </div>
                    </div>
                </div>

            <div class="form-group" >
                <div class="col-md-12">
                    <label  class="col-md-3">สาเหตุ/วิธีแก้ไข</label>
                    <div class="col-md-8"  >
                        <?= $form->field($model, 'job_how_to_fix')->textArea(['rows'=>'4','class'=>'form-control input-sm'])->label(false) ?>
                    </div>
                </div>
            </div>
            
                <div class="form-group" >
                     <div class="col-md-12">
                        <label  class="col-md-3">ค่าใช้จ่าย</label>
                            <div class="col-md-4" >
                                <?= $form->field($model, 'price')->textInput(['value'=>($model->price) == NULL ? '0': $model->price ,'class'=>'form-control input-sm'])->label(false) ?>
                            </div>

                    </div>
                </div>
            
                <div class="form-group" >
                     <div class="col-md-12">
                        <label  class="col-md-3">สถานะ</label>
                            <div class="col-md-5" >
                               
                                <?= $form->field($model, 'job_status')->dropDownList([ 'wait'=>'รอตรวจสอบ','process' => 'กำลังดำเนินการ','success'=>'สำเร็จ' ])->label(false) ?>
                            </div>
                    </div>
                </div>
        </div>

        <div class="form-group">

            <div class="col-md-12">
                <hr>
                <?php
                if (!$model->isNewRecord) {

                    echo Html::a('<i class="glyphicon glyphicon-trash"></i> ลบข้อมูล', ['delete', 'id' => $model->id, 'start_search' => Yii::$app->request->get('start_search'), 'end_search' => Yii::$app->request->get('end_search')], [
                        'title' => Yii::t('yii', 'Delete'),
                        'data-confirm' => Yii::t('yii', 'Are you sure you want to delete this item?'),
                        'data-method' => 'post',
                        'data-pjax' => '0',
                        'class' => 'btn btn-danger'
                    ]);
                    echo "&nbsp;";
                    echo Html::a('<i class="glyphicon glyphicon-print"></i> พิมพ์', ['print', 'id' => $model->id], ['target' => '_blank', 'class' => 'btn btn-info']);
                }
                ?>

                <div class="pull-right">
                    <?= Html::submitButton($model->isNewRecord ? '<i class="glyphicon glyphicon-floppy-disk"></i> บันทึก' : '<i class="glyphicon glyphicon-floppy-disk"></i> บันทึกการเปลี่ยนแปลง', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>

                    <?= Html::a('<i class="glyphicon glyphicon-remove"></i> ยกเลิก', ['index', 'start_search' => Yii::$app->request->get('start_search'), 'end_search' => Yii::$app->request->get('end_search')], ['class' => 'btn btn-default']) ?>
                </div>
            </div>

        </div>
		
    </div>
<?php ActiveForm::end(); ?>
</div>

<?php
$this->registerJs("
	$(function(){
		$('#job').addClass('active');
	});
");
?>