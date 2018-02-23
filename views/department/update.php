<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Department */

$this->title = 'แก้ไขชื่อหน่วยงาน/แผนก';
//$this->params['breadcrumbs'][] = ['label' => 'Departments', 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
//$this->params['breadcrumbs'][] = 'Update';
?>
<div class="department-update">

    <h4>ตั้งค่าหน่วยงาน/แผนก</h4>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
