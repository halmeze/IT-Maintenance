<?php
use dosamigos\chartjs\ChartJs;
use yii\helpers\Html;
use yii\grid\GridView;
use dektrium\user\models\User;
use app\models\Job;

$this->title = "รายงานสถิติการปฏิบัติงาน";

?>

<h4><i class="glyphicon glyphicon-stats"></i> <?= Html::encode($this->title) ?></h4>

  <?=$this->render('_menu',['active'=>'job']);?>
    <br>
      <h4 class="text-center"><?= Html::encode($this->title) ?> <?=$name->fullname?> <?="&nbsp;วันที่ ".Job::dateThai($start)." ถึง วันที่ ".Job::dateThai($end);?> </h4>


    <?=$this->render('_search_job',[
      'user_id'=>$user_id,
      'start'=>$start,
      'end'=>$end
    ]);?>

    <?=$this->render('_nav',[
        'user_id'=>$user_id,
        'start'=>$start,
        'end'=>$end
    ]);?>
    
    <div class="pull-right">
    
        <?= Html::a('<i class="glyphicon glyphicon-print"></i> พิมพ์',[
                'print-chart',
        'user_id'=>$user_id,
        'start'=>$start,
        'end'=>$end
        ],['class'=>'btn btn-default btn-sm','target'=>'_blank'])?>
    </div>


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

    <div class="col-md-offset-2 col-md-8">
      <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'tableOptions'=>['class'=>'table report-table'],
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
