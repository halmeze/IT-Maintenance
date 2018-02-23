<?php

/*
 * This file is part of the Dektrium project.
 *
 * (c) Dektrium project <http://github.com/dektrium>
 *
 * For the full copyright and license information, please view the LICENSE.md
 * file that was distributed with this source code.
 */

/**
 * @var yii\widgets\ActiveForm 		$form
 * @var dektrium\user\models\User 	$user
 */
?>

<?= $form->field($user, 'fullname')->textInput(['maxlength' => 255]) ?>
<?= $form->field($user, 'position')->textInput(['maxlength' => 255]) ?>
<?= $form->field($user, 'email')->textInput(['maxlength' => 255]) ?>
<?= $form->field($user, 'username')->textInput(['maxlength' => 255]) ?>
<?= $form->field($user, 'password')->passwordInput() ?>
<?= $form->field($user, 'role')->radioList([ '1' => 'ผู้ดูแลระบบ ( IT System Admin )', '0' => 'ผู้ใช้งานระบบ ( IT User )', ])?>
<?php
$this->registerJs("
	$(function(){
		$('#setting').addClass('active');
	});
");
?>