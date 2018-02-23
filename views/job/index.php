<?php
use yii\helpers\Html;
use yii\grid\GridView;
use app\models\Job;
use kartik\growl\Growl;

/* @var $this yii\web\View */
/* @var $searchModel app\models\SearchJob */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'ข้อมูลการทำงาน ';
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

<div class="job-index">

    <h4><i class="glyphicon glyphicon-tasks"></i> <?= Html::encode($this->title); ?> : <?= $title ?></h4>

    <?php echo $this->render('_search', ['start_search' => Yii::$app->request->get('start_search'), 'end_search' => Yii::$app->request->get('end_search')]); ?>

    <div class="row status">

        <div class="col-md-12">

            <?= Html::a('รอตรวจสอบ', ['search-status', 'status' => 'wait']) ?> <span class="badge"><?= Job::CountStatus('wait'); ?></span> 

            <?= Html::a('กำลังดำเนินการ', ['search-status', 'status' => 'process']) ?> <span class="badge"><?= Job::CountStatus('process'); ?></span>
		
			<?= Html::a('ทั้งหมด  <span class="badge">'.$countAll.'</span>', '#',['class'=>'pull-right']) ?> 

        </div>

    </div>

    <?=
    GridView::widget([
        'dataProvider' => $dataProvider,
        // 'filterModel' => $searchModel,
        'tableOptions' => ['class' => 'table table-hover job-table'],
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
					return ($model->job_status == 'success') ? "<i class='glyphicon glyphicon-ok'></i>  ".Job::getStatus($model->job_status) : Job::getStatus($model->job_status);
				},
            ],
            [
                //'header'=>'แก้ไข/ลบ',
                'class' => 'yii\grid\ActionColumn',
                'options' => ['style' => 'width:5%;'],
                'template' => '{update}',
                'buttons' => [

                    'update' => function($url, $model, $key) {
					
						
						//admin allow edit all data
						if(Yii::$app->user->identity->role == 1){
							
							return Html::a('<i class="glyphicon glyphicon-pencil"></i>', ['update', 'id' => $model->id, 
							'start_search' => Yii::$app->request->get('start_search'), 
							'end_search' => Yii::$app->request->get('end_search')], 
							['class' => 'btn btn-warning btn-xs']);
							
						}else{
						
							if($model->job_status == 'wait'){
								return Html::a('<i class="glyphicon glyphicon-pencil"></i>', ['update', 'id' => $model->id, 
								'start_search' => Yii::$app->request->get('start_search'), 
								'end_search' => Yii::$app->request->get('end_search')], 
								['class' => 'btn btn-warning btn-xs']);
								
							}else{
							
								return Yii::$app->user->identity->id == $model->user_id ?
								
								Html::a('<i class="glyphicon glyphicon-pencil"></i>', ['update', 'id' => $model->id, 
								'start_search' => Yii::$app->request->get('start_search'), 
								'end_search' => Yii::$app->request->get('end_search')], 
								['class' => 'btn btn-warning btn-xs']) : 
								
								Html::a('<i class="glyphicon glyphicon-user"></i>', NULL, 
								['class' => 'btn btn-default btn-xs', 
								 'disabled' => 'disabled']);
							 
							
							}
							

						}

                    },
                        ]
                    ],
                ],
                'layout' => '{items}'
            ]);
            ?>

</div>
<?php
$this->registerJs("

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

