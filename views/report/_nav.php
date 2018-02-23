<?php
use yii\helpers\Html;
?>

<?= Html::a('<i class="glyphicon glyphicon-th-list"></i> รายงานข้อมูลการทำงาน',[
        'job-report',
	        'user_id'=>$user_id,
	        'start'=>$start,
	        'end'=>$end,
],['class'=>'btn btn-default btn-xs'])?>

<?= Html::a('<i class="glyphicon glyphicon-stats"></i> รายงานสถิติการปฏิบัติงาน',[
                'chart-report',
	                'user_id'=>$user_id,
	                'start'=>$start,
	                'end'=>$end,
],['class'=>'btn btn-default btn-xs'])?>

