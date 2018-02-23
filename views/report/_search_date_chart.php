<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\jui\DatePicker;

?>
<div class="row margin-job">
    <div class="col-md-12">
        <div class="pull-right">
            <?php
                $form = ActiveForm::begin([
                    //'method' => 'get',
                    'options' => ['class' => 'form-inline',],
                ]);
            ?>

            <div class="form-group">
                <i class="glyphicon glyphicon-search"></i> วันเริ่มต้น  
                <?=DatePicker::widget([
                    'name' => 'start_date',
                    'language' => 'th',
                    'dateFormat' => 'yyyy-MM-dd',
                    'options' => ['class' => 'form-control input-sm','placeholder' => 'เลือกวันที่เริ่มต้น'],
                    'clientOptions' => [
                        'changeMonth' => true,
                        'changeYear' => true,
                        'showButtonPanel' => true,
                    ],
                    'value' => $start_date
                ]);
                ?>

            </div>

            <div class="form-group">
                ถึง 
                <?=DatePicker::widget([
                    'name' => 'end_date',
                    'language' => 'th',
                    'dateFormat' => 'yyyy-MM-dd',
                    'options' => ['class' => 'form-control input-sm','placeholder' => 'เลือกวันที่สิ้นสุด'],
                    'clientOptions' => [
                        'changeMonth' => true,
                        'changeYear' => true,
                        'showButtonPanel' => true,
                    ],
                    'value' => $end_date
                ]);
                ?>
            </div>
            <div class="form-group">
                <?= Html::submitButton('ค้นหา', ['class' => 'btn btn-success btn-sm','id'=>'check_btn']) ?>
                <?=Html::a('Print',[$link,'start_date'=>$start_date,'end_date'=>$end_date],['class'=>'btn btn-default btn-sm','target'=>'_blank'])?>
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

