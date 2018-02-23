<?php
use app\components\ExcelGrid;
use app\models\Job;
ExcelGrid::widget([  
//\bsource\gridview\ExcelGrid::widget([
        'dataProvider' => $dataProvider,
        //'filterModel' => $searchModel,
		'extension'=>'xlsx',
		'filename'=>'device_detail_report',
		'properties' =>[
			//'name'	=>'',
			'title' 	=> 'รายงานสรุปงานซ่อม/ค่าซ่อมบำรุง ',
			//'subject' 	=> '',
			//'category'	=> '',
			//'keywords' 	=> '',
			//'manager' 	=> '',
			//'description'=>'BSOURCECODE',
			//'company'	=>'BSOURCE',
		],
          
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'job_date',
			'employee.user_fullname',
			'job_detail',
			'job_how_to_fix',
             [
                'attribute'=>'ผู้ดำเนินการ',
                'value'=>'user.fullname',
             ],
			[
				'attribute'=>'price',
				'value'=>function($model){
					return number_format($model->price);
				}
			],
            [
                'attribute'=>'สถานะ',
                 'format'=>'html',
                'value'=>function($model){
                    return Job::getStatus($model->job_status);
                },
            ],
        ],
         
    ]);
?>

