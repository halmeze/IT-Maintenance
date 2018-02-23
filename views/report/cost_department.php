<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\grid\GridView;
use app\models\Job;
use kartik\select2\Select2;

$this->title = "รายงาน สรุปงานซ่อม/ค่าซ่อมบำรุง";
?>

<h4><?= Html::encode($this->title) ?></h4>

<?= $this->render('_menu', ['active' => 'cost']); ?>
<br>
<div class="row">
<?php
    $form = ActiveForm::begin([
                'action' => ['cost-department'],
                'method' => 'get',
                'options' => ['class' => 'form-inline'],
            ]);
    ?>
    <div class="col-md-3">
        <div class="form-group">
              <?php
                    echo Select2::widget([
                    'name' => 'month',
                    'data' => Job::itemsAlias('month'),
                    'value'=>$month,
                      'hideSearch'=>true,
                    'options' => [
                        'placeholder' => 'เลือกเดือน',

                        ],
                    'addon' => [
                        'prepend' => [
                            'content' => '<i class="glyphicon glyphicon-search"></i>',
                        ],
                    ]
                    ]);
                ?>
        </div>
    </div>
    <div class="col-md-3">
        <div class="form-group">
            <?php
                echo Select2::widget([
                    'name' => 'year',
                    'data' => Job::itemsAlias('year'),
                    'value'=>$year,
                    'hideSearch'=>true,
                    'options' => [
                        'placeholder' => 'เลือกปี',

                        ],

                    'addon' => [
                        'prepend' => [
                            'content' => '<i class="glyphicon glyphicon-search"></i>',
                        ],
                    ]
                    ]);
                ?>
        </div>
    </div>
    <div class="form-group">
        <?= Html::submitButton('ค้นหา', ['class' => 'btn btn-success btn-sm']) ?>
    </div>

    <?php ActiveForm::end(); ?>
</div>
<br>
    <table class="table table-bordered report-table">
        <tr class="cost-table">
            <th width="5%" style="text-align:center;">ลำดับ</th>
            <th width="75%" >หน่วยงาน</th>
            <th width="10%" style="text-align:center;">ค่าซ่อมบำรุง</th>
            <th width="15%" style="text-align:center;">รายละเอียด</th>
        </tr>
        <?php
            if (!empty($data)) {
                $i = 1;
                $sum = 0;
                foreach ($data as $cost) {
                    echo "<tr>";
                    echo"<td>" . $i . "</td>";
                    echo "<td>" . $cost['department_name'] . "</td>";
                    echo "<td align='right'>".number_format($cost['price'])."</td>";
                    echo "<td align='center'>" . Html::a('รายละเอียด', [
                        'detail-cost',
                        'month' => $month,
                        'year' => $year,
                        'department_id' => $cost['department_id']
                            ], ['target' => '_blank']) . "</td>";
                    echo "</tr>";
                    $i++;
                    $sum += $cost['price'];
                }
            } else {
                echo "<tr>
                        <td colspan='4'>ไม่พบข้อมูล</td>
                     </tr>";
                $sum = 0;
            }
        ?>
    </table>

<p>รวมทั้งสิ้น  <?php echo number_format($sum,2)?>  บาท</p>
