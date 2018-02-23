<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\jui\DatePicker;
use dektrium\user\models\User;
use yii\helpers\ArrayHelper;

$user = ArrayHelper::map(User::find()->all(),'id','fullname');
?>
<div class="row margin-job">
    <div class="col-md-12">
        <div class="pull-right">
            <?php
            $form = ActiveForm::begin([
                        'action' => ['job-report'],
                        'method' => 'get',
                        'options' => ['class' => 'form-inline',],
            ]);
            ?>
            <div class="form-group">
                <label><i class="glyphicon glyphicon-search"></i> ค้นหาข้อมูล </label>
                    <?= Html::dropDownList('user_id', $user_id, $user, ['class' => 'form-control input-sm']); ?>
            </div>

            <div class="form-group">
                <?=
                DatePicker::widget([
                    'name' => 'start',
                    'language' => 'th',
                    'dateFormat' => 'yyyy-MM-dd',
                    'options' => ['class' => 'form-control input-sm','placeholder' => 'เลือกวันที่เริ่มต้น'],
                    'clientOptions' => [
                        'changeMonth' => true,
                        'changeYear' => true,
                        'showButtonPanel' => true,
                    ],
                    'value' => $start
                ]);
                ?>
            </div>

            <div class="form-group">
                <?=
                DatePicker::widget([
                    'name' => 'end',
                    'language' => 'th',
                    'dateFormat' => 'yyyy-MM-dd',
                    'options' => ['class' => 'form-control input-sm','placeholder' => 'เลือกวันที่สิ้นสุด'],
                    'clientOptions' => [
                        'changeMonth' => true,
                        'changeYear' => true,
                        'showButtonPanel' => true,
                    ],
                    'value' => $end
                ]);
                ?>
            </div>
            <div class="form-group">
                <?= Html::submitButton('ค้นหา', ['class' => 'btn btn-success btn-sm','id'=>'check_btn']) ?>
            </div>

            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div>

<?php
$this->registerJs("

//check submit search btn

	$('#check_btn').click(function(){
		
		var search1 = $('#w1').val();
		var search2 = $('#w2').val();
		
		if(search1 = '' || search2 == ''){
			alert('กรุณาเลือก วันที่เริ่มต้น และ วันที่สิ้นสุด');
			return false;
		}

	});

");
?>

