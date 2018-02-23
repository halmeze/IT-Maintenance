<?php
use app\components\ExcelGrid;

ExcelGrid::widget([  
//\bsource\gridview\ExcelGrid::widget([
        'dataProvider' => $dataProvider,
        //'filterModel' => $searchModel,
		'extension'=>'xlsx',
		'filename'=>'export_device_report',
		'properties' =>[
			//'name'	=>'',
			'title' 	=> 'รายงานทะเบียนอุปกรณ์',
			//'subject' 	=> '',
			//'category'	=> '',
			//'keywords' 	=> '',
			//'manager' 	=> '',
			//'description'=>'BSOURCECODE',
			//'company'	=>'BSOURCE',
		],
          
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'date_use',
			'device_id',
			'deviceType.device_type',
			'device_name',
			'department.department_name',
			[
				'attribute'=>'device_price',
				'value'=>function($model){
					return number_format($model->device_price);
				}
			],
            [
			'attribute'=>'device_status',
				'value'=>function($model){
					return $model->device_status == 'disable' ?' เลิกใช้งาน ' : 'ใช้งานปกติ';
				}
			],
			'other_detail',
        ],
         
    ]);
?>

