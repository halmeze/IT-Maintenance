<?php
use dosamigos\chartjs\ChartJs;
use yii\helpers\Html;
use yii\grid\GridView;
use dektrium\user\models\User;
use app\models\Job;

$this->title = "รายงานสถิติการปฏิบัติงาน";
?>


<h4 align="center"><?= Html::encode($this->title) ?> <?=$name->fullname?> <?="&nbsp;วันที่ ".Job::dateThai($start)." ถึง วันที่ ".Job::dateThai($end);?> </h4>

    <div class="pull-right margin-print" id="non-printable">
        
        <button class="btn btn-info btn-sm" onclick="return window.print();">พิมพ์รายงาน</button>
        <button class="btn btn-default btn-sm" onclick="return window.close();">ปิด</button>
        
    </div>
<div class="row">

	<div class="col-md-12">

    <div class="text-center">
        <?= ChartJs::widget([
            'type' => 'Bar',
            'options' => [
                'height' => 450,
                'width' => 950
            ],
            'data' => [
                'labels' =>$labels,
                'datasets' => [
                    [
                        'fillColor' => "rgba(151,187,205,0.5)",
                        'strokeColor' => "rgba(151,187,205,1)",
                        'pointColor' => "rgba(151,187,205,1)",
                        'pointStrokeColor' => "#fff",
                        'data' => $data,
                    ]
                ]
            ]
        ]);
        ?>
    </div>

		<?= GridView::widget([
		  'dataProvider' => $dataProvider,
		  'columns' => [

			['class' => 'yii\grid\SerialColumn'],

			[
			  'attribute'=>'job_type_name',
			  'options' => ['style' => 'width:95%'],
			],

			[
			  'attribute'=>'จำนวนครั้ง',
			  'options' => ['style' => 'width:5%'],
			  'format'=>'html',
			  'contentOptions' => ['style' => 'text-align:center'],
			  'value'=>function($model){
				return Job::find()->where('DATE(job_date) 
						BETWEEN "'.Yii::$app->request->get('start').'" 
						AND "'.Yii::$app->request->get('end').'"
						AND user_id ="'.Yii::$app->request->get('user_id').'"
						AND job_type_id = '.$model->id.'
						')->count();
			  },
			],

		  ],
		  'layout'=>'{items}'
		]); ?>
	</div>
</div>

