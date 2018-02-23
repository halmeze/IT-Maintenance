<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\JobType */

$this->title = 'เพิ่มประเภทงาน';
//$this->params['breadcrumbs'][] = ['label' => 'Job Types', 'url' => ['index']];
//$this->params['breadcrumbs'][] = $this->title;
?>
<div class="job-type-create">

    <h4>ตั้งค่าประเภทงานซ่อม</h4>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
