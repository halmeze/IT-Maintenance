<?php
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\GridView;
use yii\bootstrap\ActiveForm;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
use yii\bootstrap\Modal;  
use app\models\Employee;
use app\models\Job;

/* @var $this yii\web\View */
/* @var $searchModel app\models\SearchJob */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'รายการที่แจ้ง ';
//$this->params['breadcrumbs'][] = $this->title;

$employee = ArrayHelper::map(Employee::find()->all(),'id','user_fullname','department.department_name');

?>
    <?php if (Yii::$app->session->hasFlash('contactFormSubmitted')): ?>

		<div class="alert alert-success alert-dismissible" role="alert">
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		  <strong>สำเร็จ!</strong> บันทึกข้อมูล การแจ้งปัญหา/งานซ่อม ของคุณเรียบร้อยแล้ว 
		</div>

    <?php endif; ?>
	
	<div class="job-index">

    <h4><i class="glyphicon glyphicon-tasks"></i> <?= Html::encode($this->title); ?>  </h4>
	<hr>
	
			<div class="row">

				<?php $form = ActiveForm::begin();?>
		   
				<div class="form-group">
					<div class="col-md-4">

							<?=
							$form->field($model, 'job_employee_id')->widget(Select2::classname(), [
								'data' => $employee,
								'language' => 'th',
								'options' => ['class' => 'form-control input-sm', 'placeholder' => 'ค้นหาจากชื่อผู้แจ้ง'],
								'pluginOptions' => [
									'allowClear' => true
								],
								'addon' => [
									'prepend' => [
										'content' => '<i class="glyphicon glyphicon-search"></i>',
									],
								]
								
							])->label(false);
							?>  
										
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-md-2">
						<?= Html::submitButton('<i class="glyphicon glyphicon-search"></i> ค้นหา', ['class' => 'btn btn-info input-sm']) ?>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-md-6">
						<?= Html::a('<i class="glyphicon glyphicon-plus"></i> แจ้งใหม่', ['form-request'], ['class' => 'btn btn-primary btn-sm pull-right']) ?>
					
					</div>
				</div>

				<?php ActiveForm::end(); ?>

			</div>
			
<br>
    <?=
    GridView::widget([
        'dataProvider' => $dataProvider,
        // 'filterModel' => $searchModel,
        'tableOptions' => ['class' => 'table table-hover table-bordered job-request'],
        'rowOptions' => ['class' => 'job'],
        'columns' => [

            ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute' => 'job_date',
                'options' => ['style' => 'width:10%'],
				'format' => 'html',
                'value' => function($model) {
					$day = explode(" ", $model->job_date);
					return Job::dateShortThai($day['0'])."<br> เวลา : ".substr($day['1'],0,-3);
				}	
            ],
            [
                'attribute' => 'employee.user_fullname',
                'options' => ['style' => 'width:15%'],
            ],
            [
                'attribute' => 'job_detail',
                'options' => ['style' => 'width:20%'],
            ],
            [
                'attribute' => 'job_how_to_fix',
                'options' => ['style' => 'width:20%'],
            ],
            [
                'attribute' => 'UserName',
                'options' => ['style' => 'width:15%'],
                'value' => 'user.fullname',
            ],
            [
                'attribute' => 'job_status',
                'options' => ['style' => 'width:10%'],
				'format'=>'html',
                'value' => function($model) {
							
					return Job::getStatus($model->job_status);
				
					
				},
            ],
			[
				'attribute'=>'รายละเอียด',
				'headerOptions' => ['style'=>'text-align:center'],
				'format'=>'raw',
				'value'=> function($model){
					
				    return Html::button('<i class="glyphicon glyphicon-file"></i> รายละเอียด', [
                            'value' => Url::to('index.php?r=request/view&id='.$model->id),
                            'class' => 'btn btn-default btn-xs  view_detail'
                        ]);
                      
				}
			]

                ],
            //'layout' => '{items}'
            ]);
            ?>

</div>
<?php
//show modal
    Modal::begin([
        'header' => '<h4>รายละเอียดการแจ้งซ่อมคอมพิวเตอร์</h4>',
        'id' => 'modal',
        'size' => 'modal-lg',
    ]);
        echo "<div id='content'></div>";
    Modal::end();
	
	
$this->registerJs("

//show modal for view detail
$('.view_detail').click(function() {
	$('#modal').modal('show')
		.find('#content')
		.load($(this).attr('value'));
});


//set for emply data
$('.not-set').text('');


//check submit search btn
	$('#search_btn').click(function(){
		
		var search1 = $('#w1').val();
		var search2 = $('#w2').val();
		
		if(search1 = '' || search2 == ''){
			alert('กรุณาเลือก วันที่เริ่มต้น และ วันที่สิ้นสุด');
			return false;
		}

	});

");



?>

