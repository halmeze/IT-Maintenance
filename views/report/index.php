<?php
use yii\helpers\Html;

$this->title = "รายงานข้อมูลการทำงาน";
?>

<h4><i class="glyphicon glyphicon-file"></i> <?= Html::encode($this->title) ?></h4>

    <?=$this->render('_menu',['active'=>'job']);?>

    <?=$this->render('_search_job',[
            'user_id'=>NULL,
            'start'=>NULL,
            'end'=>NULL
    ]);?>

<p class="well">กรุณาเลือกรายงานที่ต้องการ</p>
