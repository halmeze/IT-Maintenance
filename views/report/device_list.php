<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\Department;
use yii\helpers\ArrayHelper;
use yii\grid\GridView;
use kartik\select2\Select2;

use app\models\DeviceType;
use app\models\Device;

$device_type = ArrayHelper::map(DeviceType::find()->all(),'id','device_type');

$department = ArrayHelper::map(Department::find()->all(),'id','department_name');

$model->department_id = $department_id;

$model->device_type_id = $device_type_id;

$device_type[0] = 'หมวดหมู่ทั้งหมด';

$department[0] = 'หน่วยงาน ทั้งหมด';

$this->title = "รายงานทะเบียนอุปกรณ์";


?>

<h4><i class="glyphicon glyphicon-list-alt"></i> <?= Html::encode($this->title) ?></h4>

<?=$this->render('_menu',['active'=>'device_list']);?>


	<div class="row">
	   <?php $form = ActiveForm::begin(['action'=>['device-list'],'method'=>'get']); ?>
	   
	   	<div class="form-group" >
			<div class="col-md-3">
			   <?=$form->field($model, 'device_type_id')->widget(Select2::classname(), [
				   'data' => $device_type,
				   'language' => 'th',
				   'options' => ['placeholder' => 'เลือกหมวดหมู่','name'=>'device_type_id'],
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
			<div class="col-md-3">
			   <?=$form->field($model, 'department_id')->widget(Select2::classname(), [
				   'data' => $department,
				   'language' => 'th',
				   'options' => ['placeholder' => 'เลือกชื่อหน่วยงาน','name'=>'department_id'],
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
		   <div class="col-md-6">
			   
				<?=Html::submitButton('<i class="glyphicon glyphicon-search"></i> ค้นหา', ['class' => 'btn btn-primary btn-sm'])?>
	
				<div class="pull-right">

					<?=Html::a('<i class="glyphicon glyphicon-print"></i> พิมพ์',['show-list','device_type_id'=>$device_type_id,'department_id'=>$department_id] ,['class' => 'btn btn-default btn-sm','target'=>'_blank'])?>
				
				</div>

		   </div>
	   </div>
	   <?php ActiveForm::end(); ?>
	</div>

<br>
	<?= GridView::widget([
	'dataProvider' => $dataProvider,
	'tableOptions'=>['class'=>'table report-table'],
	'columns' => [
		['class' => 'yii\grid\SerialColumn'],
        [
            'attribute'=>'device_id',
            'options' => ['style' => 'width:15%'],
            'format'=>'html'
        ],
        [
            'attribute'=>'DeviceName',
            'options' => ['style' => 'width:35%'],
            'format'=>'html'
        ],
        [
            'attribute'=>'deviceType.device_type',
            'options' => ['style' => 'width:15%'],
            'format'=>'html'
        ],

        [
            'attribute'=>'department.department_name',
            'options' => ['style' => 'width:15%'],
            'format'=>'html'
        ],
        [
            'attribute'=>'device_price',
            'options' => ['style' =>'width:5%;'],
            'contentOptions' => ['style' => 'text-align:right'],
            'format'=>'html',
            'value'=>function($model){
                return number_format($model->device_price);
            },
        ],
        
         [
			'attribute'=>'device_status',
			'options' => ['style' => 'width:10%'],
            'value'=>function($model){
                return $model->device_status == 'disable' ?' เลิกใช้งาน ' : 'ใช้งานปกติ';
           }
		],

	],
	//'layout'=>'{items}'
]); ?>
