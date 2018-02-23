<?php
use yii\helpers\Html;

$this->title = 'ไม่สามารถ  Update Version '.$version;

?>
    <h4><?= Html::encode($this->title) ?></h4>
    <hr>
<div class="col-sm-offset-3 col-sm-6">

    <div class="panel">
         <div class="panel-heading"></div>
            <div class="panel-body">
			
				<p class='alert alert-danger'>ไม่สามารถดาวน์โหลดไฟล์  Update ระบบ version <?= $version?>ได้ <br>โปรดทำการติดตั้งด้วยตนเอง </p>
				
				<?=Html::a('Download File Update version '.$version,$link)?>
				
			
			</div>
	</div>
</div>