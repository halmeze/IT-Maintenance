<?php
use yii\helpers\Html;
use yii\grid\GridView;

use app\models\Job;

$this->title = "รายงานข้อมูลการทำงาน";
?>

<h4><i class="glyphicon glyphicon-file"></i>  <?= Html::encode($this->title) ?></h4>

    <?=$this->render('_menu',['active'=>'job']);?>
    <br>

    <h4 class="text-center"><?= Html::encode($this->title) ?> <?=$name->fullname?> <?="&nbsp;วันที่ ".Job::dateThai($start)." ถึง วันที่ ".Job::dateThai($end);?> </h4>

    <?=$this->render('_search_job',[
        'user_id'=>$user_id,
        'start'=>$start,
        'end'=>$end,
    ]);?>

    <div class="row margin-job">

        <div class="col-md-12">

            <?=$this->render('_nav',[
                'user_id'=>$user_id,
                'start'=>$start,
                'end'=>$end,
            ]);?>

            <div class="pull-right">
			
				<?= Html::a('<i class="glyphicon glyphicon-save"></i> Export Excel',[
                        'job-export',
                        'user_id'=>$user_id,
                        'start'=>$start,
                        'end'=>$end,
                ],['class'=>'btn btn-default btn-xs',])?>
				
                <?= Html::a('<i class="glyphicon glyphicon-print"></i> พิมพ์',[
                        'job-print',
                         'user_id'=>$user_id,
                        'start'=>$start,
                        'end'=>$end,
                ],['class'=>'btn btn-default btn-xs','target'=>'_blank'])?>

            </div>
        </div>
    </div>

    <?= GridView::widget([
            'dataProvider' => $dataProvider,
            'tableOptions'=>['class'=>'table report-table'],
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





	
	