<?php
use yii\helpers\Html;
use yii\grid\GridView;
use app\models\Job;
use yii\helpers\Url;
?>
<?=GridView::widget([
    'dataProvider' => $dataProvider,
    'tableOptions'=>['class'=>'table table-hover device-table',],
    'columns' => [
        ['class' => 'yii\grid\SerialColumn'],
		['class' => 'yii\grid\CheckboxColumn'],
        'device_id',
        'deviceType.device_type',
        [
            'attribute'=>'DeviceName',
            'format'=>'html'
        ],
        'department.department_name',
        [
            'attribute' => 'DeviceRepair',
            'format' => 'raw',
            'value' => function($model) {
			
				$count = Job::find()->where(['device_id'=>$model->id])->count();
				
                return Html::a('ประวัติการซ่อม ('.$count.')',['report/repair-report', 'id' => $model->id], ['target' => '_blank']);
            }
        ],
        [
            'header' => 'รายละเอียด',
            'class' => 'yii\grid\ActionColumn',
            'options' => ['style' => 'width:10%;'],
            'template' => '{update}',
            'visible' => Yii::$app->user->identity->role == 1 ? true : false, //show for admin
            'buttons' => [

                'update' => function($url, $model, $key) {

            return Html::a('รายละเอียด', ['update', 'id' => $model->id,
                        'Device[department_id]' => $model->department_id,
                        'Device[device_type_id]' => $model->device_type_id,
            ]);
        },
            ]
        ],
    ],
    ]);
?>

<?= Yii::$app->user->identity->role == 1 ? Html::button(Yii::t('app', 'Delete All Selected'), ['class' => 'btn btn-warning btn-xs','id'=>'btn-delete']) : null ?>

<?php
$this->registerJs('

	  jQuery("#btn-delete").click(function(){
	  
			if(confirm("คุณต้องการลบรายการที่เลือกทั้งหมดหรือไม่")){
			
				var keys = $(".grid-view").yiiGridView("getSelectedRows");
				
				//console.log(keys);
				
				if(keys.length > 0){
				
				  jQuery.post("'.Url::to(['delete-all']).'",{ids:keys.join()},function(){

				  });
				}
			}
	  });
');
?>