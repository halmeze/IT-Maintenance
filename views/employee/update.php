<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Employee */

$this->title = 'แก้ไขชื่อพนักงาน/ชื่อผู้แจ้ง';
//$this->params['breadcrumbs'][] = ['label' => 'Employees', 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
//$this->params['breadcrumbs'][] = 'Update';
?>
<div class="employee-update">

    <h4>ตั้งค่าชื่อพนักงาน/ชื่อผู้แจ้ง</h4>
	<hr>
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
