<?php
use dosamigos\chartjs\ChartJs;
use yii\helpers\Html;
use yii\grid\GridView;
use dektrium\user\models\User;
use app\models\Job;

$this->title = "กราฟสถิติการซ่อม";
?>

<h4><i class="glyphicon glyphicon-stats"></i> <?= Html::encode($this->title) ?></h4>

    <?=$this->render('_menu',['active'=>'chart_type']);?>


 <br>
  <h4 class="text-center">สถิติการซ่อมแยกตาม หน่วยงาน / แผนก <?="&nbsp;วันที่ ".Job::dateThai($start_date)." ถึง วันที่ ".Job::dateThai($end_date);?>  </h4>
    <?=$this->render('_search_date_chart',['start_date'=>$start_date,'end_date'=>$end_date,'link'=>'print-chart-department'])?>
 



    <div class="text-center">
        <?= ChartJs::widget([
            'type' => 'Bar',
            'options' => [
                'height' => 450,
                'width' => 1000
            ],
            'data' => [
                'labels' =>$labels,
                'datasets' => [
                    [
                        'fillColor' => "rgba(151,187,205,0.5)",
                        'strokeColor' => "rgba(151,187,205,1)",
                        'pointColor' => "rgba(151,187,205,1)",
                        'pointStrokeColor' => "#fff",
                        'data' => $data,
                    ]
                ]
            ]
        ]);
        ?>
    </div>

<div class="col-md-offset-2 col-md-8">

    <table class="table report-table">
        <tr>
            <th width="5%">#</th>
            <th width="80%">หน่วยงาน / แผนก</th>
            <th align="center" width="15%">จำนวนครั้ง</th>
        </tr>
    <?php
        $i = 1;
        foreach($chart_data as $type){
            echo"<tr>";
                echo"<td>".$i."</td>";
                echo"<td>".$type['show_text']."</td>";
                echo"<td align='center'>".$type['count_department']."</td>";
            echo"</tr>";
            $i++;
        }
    ?>
    </table>
</div>