<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Department */

$this->title = 'เพิ่มหน่วยงาน/แผนก';
//$this->params['breadcrumbs'][] = ['label' => 'Departments', 'url' => ['index']];
//$this->params['breadcrumbs'][] = $this->title;
?>
<div class="department-create">

    <h4>ตั้งค่าหน่วยงาน/แผนก</h4>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
