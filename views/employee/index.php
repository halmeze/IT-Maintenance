<?php

use yii\helpers\Html;
use yii\grid\GridView;
use kartik\growl\Growl;
/* @var $this yii\web\View */
/* @var $searchModel app\models\SearchEmployee */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'ตั้งค่าชื่อพนักงาน/ชื่อผู้แจ้ง';
//$this->params['breadcrumbs'][] = $this->title;
if(Yii::$app->session->hasFlash('save')):
    echo Growl::widget([
        'type' => Growl::TYPE_SUCCESS,
        'icon' => 'glyphicon glyphicon-ok-sign',
        'title' => 'สำเร็จ',
        'showSeparator' => true,
        'body' => 'บันทึกข้อมูลของคุณเรียบร้อยแล้ว'
    ]);
endif;

if(Yii::$app->session->hasFlash('delete')):
    echo Growl::widget([
        'type' => Growl::TYPE_DANGER,
        'icon' => 'glyphicon glyphicon-ok-sign',
        'title' => 'สำเร็จ',
        'showSeparator' => true,
        'body' => 'ลบข้อมูลของคุณเรียบร้อยแล้ว'
    ]);
endif;
?>
<div class="employee-index">

    <h4><?= Html::encode($this->title) ?></h4>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <hr>
    <p>
        <?= Html::a('เพิ่มชื่อพนักงาน/ชื่อผู้แจ้ง', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        //'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'user_fullname',
            'user_position',
            'department.department_name',
                [
                    'header'=>'แก้ไข/ลบ',
                    'class' => 'yii\grid\ActionColumn',
                    'options' => ['style' => 'width:10%;'],
                    'template' => '{update} {delete}',
                    'buttons' => [
                        'update' => function($url, $model, $key) {
 
                            return Html::a('<i class="glyphicon glyphicon-pencil"></i>', ['update','id'=>$model->id], ['class' => 'btn btn-warning btn-xs']);
                        },
                                
                        'delete' => function($url, $model, $key) {

                            return Html::a('<i class="glyphicon glyphicon-trash"></i>',  ['delete','id'=>$model->id], [
                                        'title' => Yii::t('yii', 'Delete'),
                                        'data-confirm' => Yii::t('yii', 'Are you sure you want to delete this item?'),
                                        'data-method' => 'post',
                                        'data-pjax' => '0',
                                        'class' => 'btn btn-danger btn-xs'
                            ]);
                        }
                    ]
                ],
            ],
            'layout'=>'{items}',
 
    ]); ?>

</div>
<?php
$this->registerJs("
	$(function(){
		$('#setting').addClass('active');
	});
");
?>