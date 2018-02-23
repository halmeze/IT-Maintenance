<?php
use yii\helpers\Html;
use yii\grid\GridView;
use app\models\Department;
use app\models\Job;

$this->title = "รายงานสรุปงานซ่อม/ค่าซ่อมบำรุง ";

$department = Department::findOne(Yii::$app->request->get('department_id'));

$date = Job::dateThai(Yii::$app->request->get('year')."-".Yii::$app->request->get('month')."- ");

?>
<h4><?= Html::encode($this->title) ?> เดือน <?=$date?> หน่วยงาน/แผนก <?=$department->department_name?></h4>


     <div class="pull-right margin-print" id="non-printable">
	 
		<?= Html::a('<i class="glyphicon glyphicon-save"></i> Export Excel',[
			'cost-export',
			'month'=>Yii::$app->request->get('month'),
			'year'=>Yii::$app->request->get('year'),
			'department_id'=>Yii::$app->request->get('department_id')
		],['class'=>'btn btn-default btn-sm',])?>
				
        <button class="btn btn-info btn-sm" onclick="return window.print();">พิมพ์รายงาน</button>
        <button class="btn btn-default btn-sm" onclick="return window.close();">ปิด</button>
        
    </div>
 
<?= GridView::widget([
    'dataProvider' => $dataProvider,
    //'filterModel' => $searchModel,
    'columns' => [
        ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute'=>'job_date',
                'options' => ['style' => 'width:10%'],
				'format' => 'html',
                'value' => function($model) {
					$day = explode(" ", $model->job_date);
					return Job::dateShortThai($day['0'])."<br> เวลา : ".substr($day['1'],0,-3);
				}	
            ],
            [
                'attribute'=>'employee.user_fullname',
                'options' => ['style' => 'width:15%'],
            ],
            [
                'attribute'=>'job_detail',
                'options' => ['style' => 'width:25%'],
            ],
            [
                'attribute'=>'job_how_to_fix',
                'options' => ['style' => 'width:25%'],
            ],
             [
                'attribute'=>'ผู้ดำเนินการ',
                'options' => ['style' => 'width:10%'],
                'value'=>'user.fullname',
             ],
            [
                'attribute'=>'price',
                'contentOptions' => ['style' => 'text-align:right'],
                'options' => ['style' => 'width:5%'],
                'value'=>function($model){
                    return number_format($model->price);
                },
             ],
            [
                'attribute'=>'สถานะ',
                'options' => ['style' => 'width:10%'],
                'format'=>'html',
                'contentOptions' => ['style' => 'text-align:left'],
                'value'=>function($model){
                    return Job::getStatus($model->job_status);
                },
            ],
    ],
    'layout'=>'{items}',                    
]); ?>

        <p class="pull-right">สรุปค่าซ่อมบำรุง รวมทั้งสิ้น <?php echo number_format($sum);?> บาท</p>
