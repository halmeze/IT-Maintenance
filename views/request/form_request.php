<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\ContactForm */

//use yii\helpers\Html;
//use yii\bootstrap\ActiveForm;
//use yii\captcha\Captcha;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ActiveForm;
use app\models\Employee;
use dektrium\user\models\User;
use app\models\JobType;
use app\models\Device;
use yii\helpers\ArrayHelper;
use janisto\timepicker\TimePicker;
use kartik\select2\Select2;
use kartik\depdrop\DepDrop;

$this->title = 'แบบบันทึกข้อมูลรายการแจ้ง/งานซ่อมบำรุง คอมพิวเตอร์ งานเทคโนโลยีสารสนเทศ';
//$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-contact">
    <h4><?= Html::encode($this->title) ?></h4>
	
	<hr>
	
</div>

<?php


/* @var $this yii\web\View */
/* @var $model app\models\Job */
/* @var $form yii\widgets\ActiveForm */

$employee = ArrayHelper::map(Employee::find()->all(),'id','user_fullname','department.department_name');

$job_type = ArrayHelper::map(JobType::find()->all(),'id','job_type_name');

//$device = ArrayHelper::map(Device::find()->select(['id,CONCAT(device_id," - ",device_name) AS device_name,device_type_id'])->all(),'id','device_name','deviceType.device_type');

$model->job_date = Yii::$app->formatter->asDateTime(time(), 'php:Y-m-d H:i:s');

?>

<div class="row">

    <div class="col-md-offset-3 col-md-6">
	
	
		<div class="panel panel-default">
		  <div class="panel-heading">
			<h3 class="panel-title">แจ้งซ่อมคอมพิวเตอร์</h3>
		  </div>
		  <div class="panel-body">

		  
  
<?php $form = ActiveForm::begin(['options'=>['class'=>'']]); ?>



        <div class="col-md-12">

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
            

	
        <div class="col-md-12" >
            
            <div class="form-group" >
                <div class="col-md-12">
                    <label  class="col-md-3">ชื่ออุปกรณ์</label>
                    <div class="col-md-8" >

					<?php
                          // Dependent Dropdown
							echo $form->field($model, 'device_id')->widget(DepDrop::classname(), [
                                'type'=>DepDrop::TYPE_SELECT2,
                               'pluginOptions'=>[
                                   'depends'=>['request-job_employee_id'],
                                   'placeholder' => 'ชื่ออุปกรณ์',
                                   'url' => Url::to(['/request/get-device'])
                               ],

                           ])->label(false);
                          ?>
                    </div>
                </div>
            </div>
            <div class="form-group" >
                <div class="col-md-12">
                    <label  class="col-md-3">รายการแจ้ง/ปัญหา</label>
                    <div class="col-md-8"  >
                        <?= $form->field($model, 'job_detail')->textArea(['rows'=>'5','class'=>'form-control input-sm'])->label(false) ?>
                    </div>
                </div>
            </div>
            
        </div>

		
		<?=$form->field($model,'job_status')->hiddenInput(['value'=>'wait'])->label(false)?>
		
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
                    <?= Html::submitButton($model->isNewRecord ? '<i class="glyphicon glyphicon-floppy-disk"></i> บันทึก' : '<i class="glyphicon glyphicon-floppy-disk"></i> บันทึกการเปลี่ยนแปลง', ['class' => $model->isNewRecord ? 'btn btn-primary' : 'btn btn-primary']) ?>

                    <?= Html::a('<i class="glyphicon glyphicon-remove"></i> ยกเลิก', ['index', 'start_search' => Yii::$app->request->get('start_search'), 'end_search' => Yii::$app->request->get('end_search')], ['class' => 'btn btn-default']) ?>
                </div>
            </div>

        </div>
		
 
<?php ActiveForm::end(); ?>

    </div>
	
  </div>
</div>

</div>

<?php
$this->registerJs("
	$(function(){
		$('#job').addClass('active');
	});
");
?>
