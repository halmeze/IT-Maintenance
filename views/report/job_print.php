<?php
use yii\helpers\Html;
use yii\grid\GridView;
use app\models\Job;

$this->title = "รายงานข้อมูลการทำงาน";
?>

<h4 align="center"><?= Html::encode($this->title) ?> <?=$name->fullname?> <?="&nbsp;วันที่ ".Job::dateThai($start)." ถึง วันที่ ".Job::dateThai($end);?> </h4>

    <div class="pull-right margin-print" id="non-printable">
        
        <button class="btn btn-info btn-sm" onclick="return window.print();">พิมพ์รายงาน</button>
        <button class="btn btn-default btn-sm" onclick="return window.close();">ปิด</button>
        
    </div>

    <?= GridView::widget([
            'dataProvider' => $dataProvider,
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
                            'attribute'=>'UserName',
                            'options' => ['style' => 'width:15%'],
                            'value'=>'user.fullname',
                     ],
                    [
                            'attribute'=>'job_status',
							'format'=>'html',
                            'options' => ['style' => 'width:10%'],
                            'value'=>function($model){
                                    return Job::getStatus($model->job_status);
                            },
                    ],
            ],
            'layout'=>'{items}'
    ]); ?>