<?php

use yii\helpers\Html;
use app\models\Device;
use kartik\growl\Growl;
/* @var $this yii\web\View */
/* @var $searchModel app\models\DeviceSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

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

<div class="device-index">

    <?php  echo $this->render('_search', ['model' => $model,'get_select'=>$get_select,'active'=>$active]); ?>
    
	<?php echo $this->render('_status')?>
    
    <?php
    
        if(isset($get_select)){
            
            echo $this->render('search_device', ['dataProvider' => $dataProvider]);
            
        }else{
            
            echo $this->render('device_all', ['dataProvider' => $dataProvider]);
        }
    ?>

</div>
