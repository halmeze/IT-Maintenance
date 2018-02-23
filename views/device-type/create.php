<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\DeviceType */

$this->title = 'เพิ่มหมวดหมู่อุปกรณ์';
//$this->params['breadcrumbs'][] = ['label' => 'Device Types', 'url' => ['index']];
//$this->params['breadcrumbs'][] = $this->title;
?>
<div class="device-type-create">

    <h4>ตั้งค่าหมวดหมู่อุปกรณ์</h4>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
