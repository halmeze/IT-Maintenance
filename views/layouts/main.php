<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;
use app\models\Version;

AppAsset::register($this);

//@$version = @Version::find()->select('version')->where(['id'=>1])->One();

?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="http://monkeywebstudio.com/">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
    <?php
    NavBar::begin([
        'brandLabel' => '<i class="glyphicon glyphicon-hdd"></i> ระบบบริหารงานสารสนเทศพัสดุ งานเทคโนโลยีสารสนเทศ  ',
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar-inverse navbar-fixed-top',
        ],
    ]);

    if(Yii::$app->user->isGuest){
       
        $menu = [
			['label' => '<i class="glyphicon glyphicon-tasks"></i> แจ้งใหม่/รายการที่แจ้ง', 'url' => ['/request/index']], 
            ['label' => '<i class="glyphicon glyphicon-lock"></i>  Administrator', 'url' => ['/user/security/login']], 
			
        ];

    }else{
        //admin
        Yii::$app->user->identity->role == 1 ?
            $menu = [
                ['label' => '<i class="glyphicon glyphicon-tasks"></i> ข้อมูลการทำงาน', 'url' => ['/job/index'],'options'=>['id'=>'job']],
                ['label' => '<i class="glyphicon glyphicon-list-alt"></i> ทะเบียนอุปกรณ์', 'url' => ['/device/index'],'options'=>['id'=>'device']],
                ['label' => '<i class="glyphicon glyphicon-file"></i> รายงาน', 'url' => ['/report/index'],'options'=>['id'=>'report']],
                ['label' => '<i class="glyphicon glyphicon-cog"></i> ตั้งค่าระบบ',
                    'items' => [
                        ['label' => '<i class="glyphicon glyphicon-flag"></i> ตั้งค่าหมวดหมู่อุปกรณ์', 'url' => ['/device-type/index']],
                        ['label' => '<i class="glyphicon glyphicon-wrench"></i> ตั้งค่าประเภทงานซ่อม', 'url' => ['/job-type/index']],
                        ['label' => '<i class="glyphicon glyphicon-map-marker"></i> ตั้งค่าหน่วยงาน/แผนก', 'url' => ['/department/index']],
                        ['label' => '<i class="glyphicon glyphicon-user"></i> ตั้งค่าพนักงาน/ผู้แจ้ง', 'url' => ['/employee/index']],
                        ['label' => '<i class="glyphicon glyphicon-lock"></i> ตั้งค่าบัญชีผู้ดูแลระบบ', 'url' => ['/user/admin/index']], 
						['label' => '<i class="glyphicon glyphicon-import"></i> นำเข้าข้อมูลจากไฟล์ Excel', 'url' => ['/import/index']], 
						['label' => '<i class="glyphicon glyphicon-import"></i> Backup Database', 'url' => ['/default/index']], 
						/*['label' => '<i class="glyphicon glyphicon-import"></i> Check Update New Version', 'url' => ['/update/index']],*/
                    ],
					'options'=>['id'=>'setting'],
                ],
                 ['label' => '<i class="glyphicon glyphicon-user"></i> Admin (' . Yii::$app->user->identity->fullname . ')', 

                    'items' => [
                        ['label' => '<i class="glyphicon glyphicon-pencil"></i> ข้อมูลส่วนตัว', 'url' => ['/user/settings/account']],

                        ['label' => '<i class="glyphicon glyphicon-off"></i> ออกจากระบบ', 'url' => ['/user/security/logout'],
                            'linkOptions' => ['data-method' => 'post','data-confirm'=>'คุณต้องการออกจากระบบใช่หรือไม่'],
                        ], 

                    ],
                ],
            ] : 
            //user
            $menu = [
                ['label' => '<i class="glyphicon glyphicon-tasks"></i> ข้อมูลการทำงาน', 'url' => ['/job/index']],
                ['label' => '<i class="glyphicon glyphicon-list-alt"></i> ทะเบียนอุปกรณ์', 'url' => ['/device/index']],
                ['label' => '<i class="glyphicon glyphicon-file"></i> รายงาน', 'url' => ['/report/index']],
                ['label' => '<i class="glyphicon glyphicon-user"></i> User (' . Yii::$app->user->identity->fullname . ')',
                    'items' => [
                        ['label' => '<i class="glyphicon glyphicon-pencil"></i> แก้ไขข้อมูลส่วนตัว', 'url' => ['/user/settings/account']],
                        ['label' => '<i class="glyphicon glyphicon-off"></i>  ออกจากระบบ', 
                            'url' => ['/user/security/logout'],
                            'linkOptions' => ['data-method' => 'post','data-confirm'=>'คุณต้องการออกจากระบบใช่หรือไม่']
                        ],
                    ],
                ]
            ];

    }

    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => $menu,
        'encodeLabels'=>false,
    ]);
    
    NavBar::end();
    ?>

    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= $content ?>
    </div>
</div>

<footer class="footer">
    <div class="container">
	
		<i class="glyphicon glyphicon-hdd"></i> ระบบบริหารงานสารสนเทศพัสดุ IT Web Application    <span class="pull-right"><small>© www.bcnyala.ac.th งานเทคโนโลยีสารสนเทศ</small></span>

    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
