<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\DeviceType */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="col-sm-offset-2 col-sm-8">

    <div class="panel panel-info">
         <div class="panel-heading"> <?= Html::encode($this->title) ?></div>
            <div class="panel-body">

			    <?php $form = ActiveForm::begin(); ?>

			    <?= $form->field($model, 'device_type')->textInput(['maxlength' => true]) ?>

			    <div class="form-group">
			        <?= Html::submitButton($model->isNewRecord ? 'บันทึก' : 'บันทึกการเปลี่ยนแปลง', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
			    	<?= Html::a('กลับ',['index'],['class'=>'btn btn-default'])?>
			    </div>

			    <?php ActiveForm::end(); ?>
			</div>
	</div>
</div>
<?php
$this->registerJs("
	$(function(){
		$('#setting').addClass('active');
	});
");
?>