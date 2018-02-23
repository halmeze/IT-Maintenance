<?php
use yii\helpers\Html;
use app\models\Device;
?>
    <div class="row">
        <div class="col-md-12">
            <div class="pull-right">
                <?= Html::a('<i class="glyphicon glyphicon-ok-sign"></i> ใช้งานปกติ <span class="badge">'.Device::countStatus('enable').'</span>',['device-status','status'=>'enable'])?>
                <?= Html::a('<i class="glyphicon glyphicon-remove-sign"></i> เลิกใช้งาน <span class="badge">'.Device::countStatus('disable').'</span>',['device-status','status'=>'disable'])?>
                <?= Html::a('<i class="glyphicon glyphicon-info-sign"></i> ทั้งหมด <span class="badge">'.Device::find()->count().'</span>',['index'])?>
            </div>
        </div>
    </div>
<?php
$this->registerCss("
        a{
            color:#000;
        }
");
?>
