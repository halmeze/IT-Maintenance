<?php
use app\models\Job;
use app\components\ExcelGrid;

ExcelGrid::widget([  
//\bsource\gridview\ExcelGrid::widget([
        'dataProvider' => $dataProvider,
        //'filterModel' => $searchModel,
		'extension'=>'xlsx',
		'filename'=>'export_job_report',
		'properties' =>[
			//'name'	=>'',
			'title' 	=> 'รายงานข้อมูลการทำงาน',
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
			[
				'attribute'=>'UserName',
				'value'=>function($model){
					return $model->user->fullname;
				}
			],
			'job_how_to_fix',
			[
				'attribute'=>'job_status',
				'format'=>'html',
				'options' => ['style' => 'width:10%'],
				'value'=>function($model){
					return Job::getStatus($model->job_status);
				},
			],

        ],
         
    ]);
?>

<?php
/*
    echo ExportMenu::widget(
    ['dataProvider'=>$dataExport]);?>
<p></p>
    <?=GridView::widget([
            'dataProvider' => $dataExport,
            'layout'=>'{items}',

    ]);*/
?>
