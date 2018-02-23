<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use app\models\Job;
/* @var $this yii\web\View */
/* @var $model common\models\Reserve */

?>
<div class="row">
	<div class="col-md-12">
	<p><b>ข้อมูลการแจ้งปัญหา</b></p>
        <?=
        DetailView::widget([
            'model' => $model,
            'template' => '<tr><th width="15%">{label}</th><td>{value}</td></tr>',
            'attributes' => [
				[
					'label' => 'วันที่แจ้ง',
					'format' => 'raw',
					'value' => Job::getDateTime($model->job_date),
				],
				'employee.user_fullname',
				'employee.user_position',
				'employee.department.department_name',
				'job_detail',

				
            ],
        ])
        ?>
		
    <p><b>ข้อมูลการแก้ไข</b></p>
            <?=
        DetailView::widget([
            'model' => $model,
            'template' => '<tr><th width="15%">{label}</th><td>{value}</td></tr>',
            'attributes' => [
				
				'device.deviceType.device_type',
				'device.device_name',

				'jobType.job_type_name',
				'UserName',
				[
					'label' => 'วันที่ดำเนินการ',
					'format' => 'raw',
					'value' => Job::getDateTime($model->job_start_date),
				],
				[
					'label' => 'วันที่เสร็จ',
					'format' => 'raw',
					'value' => Job::getDateTime($model->job_success_date),
				],
				'job_how_to_fix',
				[
				 'label' => 'สถานะ',
                 'format' => 'raw',
				 'value'=> Job::getStatus($model->job_status),
				],

				
            ],
        ])
        ?>
        <?=Html::a('<i class="glyphicon glyphicon-print"></i> พิมพ์ใบแจ้งซ่อม',['print','id'=>$model->id],['class'=>'btn btn-default','target'=>'_blank'])?>
		<?=Html::a('ปิด',null,['class'=>'btn btn-default pull-right','data-dismiss'=>'modal']);?>
	</div>
</div>
<?php
$this->registerJs("

	//set for emply data
	$('.not-set').text('');

");
?>


