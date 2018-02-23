<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Employee */

$this->title = 'เพิ่มชื่อพนักงาน/ชื่อผู้แจ้ง';
//$this->params['breadcrumbs'][] = ['label' => 'Employees', 'url' => ['index']];
//$this->params['breadcrumbs'][] = $this->title;
?>
<div class="employee-create">

    <h4>ตั้งค่าชื่อพนักงาน/ชื่อผู้แจ้ง</h4>
	<hr>
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
