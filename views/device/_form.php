<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\DeviceType;
use app\models\Department;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
/* @var $this yii\web\View */
/* @var $model app\models\Device */
/* @var $form yii\widgets\ActiveForm */

$type = ArrayHelper::map(DeviceType::find()->all(),'id','device_type');

$department = ArrayHelper::map(Department::find()->all(),'id','department_name');

//get device id
$device = Yii::$app->request->get('Device');

?>

<div class="col-sm-offset-2 col-sm-8">

    <div class="panel panel-info">
        <div class="panel-heading"><i class="glyphicon glyphicon-list-alt"></i> รายละเอียดข้อมูลอุปกรณ์</div>
            <div class="panel-body">

                <?php $form = ActiveForm::begin(); ?>

                        <div role="tabpanel">
                        
                          <!-- Nav tabs -->
                          <ul class="nav nav-tabs" role="tablist">
                          
                            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab"><i class="glyphicon glyphicon-folder-open"></i>  ข้อมูลเครื่อง</a></li>
                            <li role="presentation"><a href="#data_device" aria-controls="lan" role="tab" data-toggle="tab"><i class="glyphicon glyphicon-hdd"></i> รายละเอียด</a></li>
                 
                          </ul>
                          <!-- Tab panes -->
                          <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="home"><br>
							
                                 <div class="form-group form-group-sm">

                                    <div class="col-sm-6">
                                        <?= $form->field($model, 'device_id')->textInput(['class' => 'form-control','placeholder'=>'รหัสอุปกรณ์']) ?>
                                    </div>
                                    <div class="col-sm-6">
                                        
                                        <?= $form->field($model, 'serial_no')->textInput(['maxlength' => true]) ?>
                                    </div>

                                </div>                           
                                <div class="form-group form-group-sm">

                                    <div class="col-sm-6">
                                        <?= $form->field($model, 'device_name')->textInput(['class' => 'form-control','placeholder'=>'ชื่อเครื่อง']) ?>
                                    </div>
                                    <div class="col-sm-6">
                                        
                                        <?php $model->date_use == "0000-00-00" ? $model->date_use = NULL : '';?>
                                        
                                        <?=$form->field($model, 'date_use')->widget(\yii\jui\DatePicker::classname(), [
                                            'language' => 'th',
                                            'dateFormat' => 'yyyy-MM-dd',
                                            'options' => ['class' => 'form-control input-sm','placeholder'=>'วันที่ซื้อ หรือ วันที่รับเข้าระบบ'],
                                            ]);
                                        ?>
                                    </div>

                                </div>

                                <div class="form-group form-group-sm">

                                    <div class="col-sm-6">
                                        <?=
                                        $form->field($model, 'device_type_id')->widget(Select2::classname(), [
                                            'data' => $type,
                                            'language' => 'th',
                                            'options' => ['placeholder' => 'เลือกหมวดหมู่อุปกรณ์'],
                                            'pluginOptions' => [
                                                'allowClear' => true
                                            ],
                                        ]);
                                        ?>
                                    </div>
                                    <div class="col-sm-6">
                                        <?=
                                        $form->field($model, 'department_id')->widget(Select2::classname(), [
                                            'data' => $department,
                                            'language' => 'th',
                                            'options' => ['placeholder' => 'เลือกหน่วยงาน'],
                                            'pluginOptions' => [
                                                'allowClear' => true
                                            ],
                                        ]);
                                        ?>
                                    </div>

                                </div>

                                <div class="form-group form-group-sm">
                                    <div class="col-sm-6">
                                        <?php
                                            if(!$model->isNewRecord){

                                                echo  $form->field($model, 'device_status')->radioList([ 'enable' => 'ใช้งาน', 'disable' => 'เลิกใช้งาน' ]);
 
                                                }else{
                                                
                                                echo $form->field($model, 'device_status')->hiddenInput(['value'=>'enable'])->label(false);
                                            }
                                        ?>
                                    </div>
									<div class="col-sm-6" id="date_expire" <?php echo $model->device_status == 'enable' ? 'style="display:none"' : ''?>>
										<?php if(!$model->isNewRecord){?>
											
										<?php $model->date_expire == "0000-00-00" ? $model->date_expire = NULL : '';?>
                                        
                                        <?=$form->field($model, 'date_expire')->widget(\yii\jui\DatePicker::classname(), [
                                            'language' => 'th',
                                            'dateFormat' => 'yyyy-MM-dd',
                                            'options' => ['class' => 'form-control input-sm',],
                                            ]);
                                        ?>
										<?php } ?>
                                    </div>
									
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-12">
                                     
                                        <?= $form->field($model, 'other_detail')->textArea(['rows'=>'4','maxlength' => true]) ?>
                                        
                                    
                                    </div>
                                </div>

                            </div>

                            <div role="tabpanel" class="tab-pane" id="data_device"><br>
                                <div class="form-group form-group-sm">
                                    <div class="col-sm-12">
                                        <div class="col-sm-6">
                                             <?= $form->field($model, 'device_brand')->textInput(['maxlength' => true,'placeholder'=>'ยี่ห้ออุปกรณ์']) ?>
                                        </div>
                                       
                                        <div class="col-sm-6">
                                            <?= $form->field($model, 'cpu')->textInput(['maxlength' => true,'placeholder'=>'CPU']) ?>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group form-group-sm">
                                    <div class="col-sm-12">
                                        <div class="col-sm-6">
                                            <?= $form->field($model, 'device_model')->textInput(['maxlength' => true,'placeholder'=>'รุ่นอุปกรณ์']) ?>
                                        </div>
                                       
                                        <div class="col-sm-6">
                                          
                                            <?= $form->field($model, 'memory')->textInput(['maxlength' => true,'placeholder'=>'Ram']) ?>

                                        </div>
                                    </div>
                                </div>

                                <div class="form-group form-group-sm">
                                    <div class="col-sm-12">                   
                                        <div class="col-sm-6">
                                           <?= $form->field($model, 'vender')->textInput(['maxlength' => true ,'placeholder'=>'ตัวแทนจำหน่าย/ผู้ขาย']) ?>
                                        </div>
                                       
                                        <div class="col-sm-6">
                                          <?= $form->field($model, 'harddisk')->textInput(['maxlength' => true,'placeholder'=>'HDD']) ?>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group form-group-sm">
                                    <div class="col-sm-12">       
                                        <div class="col-sm-6">
                                            <?= $form->field($model, 'warranty')->textInput(['maxlength' => true,'placeholder'=>'ข้อมูลการรับประกัน']) ?>

                                        </div>
                                        <div class="col-sm-6">
                                            <?= $form->field($model, 'monitor')->textInput(['maxlength' => true,'placeholder'=>'จอภาพ']) ?>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-12">      
                                        <div class="col-sm-6">
                                            <?= $form->field($model, 'device_price')->textInput(['placeholder'=>'ราคา']) ?>
                                        </div>
                                        <div class="col-sm-6">
                                            <?= $form->field($model, 'device_ip')->textInput(['maxlength' => true,'placeholder'=>'หมายเลข IP']) ?>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>


                          </div>

                          <div class="form-group">
                              <div class="col-sm-12">
                                  <hr>
                                  <?php
                                  if (!$model->isNewRecord) {

                                      echo Html::a('<i class="glyphicon glyphicon-trash"></i> ลบรายการออกจากระบบ', ['delete', 'id' => $model->id, 'Device[department_id]' => $device['department_id'],
                                          'Device[device_type_id]' => $device['device_type_id']], [
                                          'title' => Yii::t('yii', 'Delete'),
                                          'data-confirm' => Yii::t('yii', 'Are you sure you want to delete this item?'),
                                          'data-method' => 'post',
                                          'data-pjax' => '0',
                                          'class' => 'btn btn-danger'
                                      ]);
                                  }
                                  ?>

                                  <div class="pull-right">

                                      <?= Html::submitButton($model->isNewRecord ? '<i class="glyphicon glyphicon-floppy-disk"></i> บันทึก' : '<i class="glyphicon glyphicon-floppy-disk"></i> บันทึกการเปลี่ยนแปลง', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>

                                      <?php
                                      //back to search device
                                      echo $device != NULL ? Html::a('กลับ', ['search-device', 'Device[department_id]' => $device['department_id'],
                                                  'Device[device_type_id]' => $device['device_type_id']], ['class' => 'btn btn-default']) :
                                              //back to all device
                                              Html::a('<i class="glyphicon glyphicon-remove"></i> ยกเลิก', ['index', 'page' => Yii::$app->request->get('page')], ['class' => 'btn btn-default']);
                                      ?>
                                  </div>
                              </div>
                          </div>


                        </div>

                <?php ActiveForm::end(); ?>
        </div>

    </div>
</div>
<?php
$this->registerJs("
	$(function(){
		$('#device').addClass('active');
		
		$('input[name=\"Device[device_status]\"]').click(function(val){
			setHide($(this).val());
			//alert($(this).val());
		});
		
	function setHide(val){
        if(val == 'disable'){
            $('#date_expire').show();
        }else{

            $('#date_expire').hide();
        }
    }
	
	});
	

");
?>