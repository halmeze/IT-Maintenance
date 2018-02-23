<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\Department;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
/* @var $this yii\web\View */
/* @var $model app\models\Employee */
/* @var $form yii\widgets\ActiveForm */

$department = ArrayHelper::map(Department::find()->all(),'id','department_name');

?>
<div class="col-sm-offset-3 col-sm-6">

    <div class="panel panel-info">
         <div class="panel-heading"> <?= Html::encode($this->title) ?></div>
            <div class="panel-body">

			    <?php $form = ActiveForm::begin(); ?>

			    <?= $form->field($model, 'user_fullname')->textInput(['maxlength' => true]) ?>

			    <?= $form->field($model, 'user_position')->textInput(['maxlength' => true]) ?>

                <?=$form->field($model, 'department_id')->widget(Select2::classname(), [
                    'data' => $department,
                    'language' => 'th',
                    'options' => ['placeholder' => 'เลือกหน่วยงาน'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ]);?>

			    <div class="form-group">
			        <?= Html::submitButton($model->isNewRecord ? 'บันทึก' : 'บันทึกการเปลี่ยนแปลง', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
			    	<?= Html::a('ยกเลิก',['index'],['class'=>'btn btn-default'])?>
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