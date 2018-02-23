<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Job */

$this->title = 'แก้ไขข้อมูลการซ่อม';
/*
$this->params['breadcrumbs'][] = ['label' => 'Jobs', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';*/
?>
<div class="job-update">

    <h4><i class="glyphicon glyphicon-tasks"></i> <?= Html::encode($this->title) ?></h4>
    <hr>
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
