<?php
namespace app\controllers;

use Yii;
use app\models\Job;
use app\models\JobType;
use app\models\Device;
use app\models\DeviceType;
use dektrium\user\models\User;
use yii\data\ActiveDataProvider;
use yii\filters\AccessControl;

class ReportController extends \yii\web\Controller{
    
    public function behaviors(){
			
        return [
			'acess'=>[
				'class'=>AccessControl::className(),
				'only' =>['index'],
				'rules'=>[
					[
						'actions'=>['index',],
						'allow'=>true,
						'roles'=>['@'],
					],
				]
			]
        ];
    }

    public function actionIndex() {
        
        return $this->render('index');
    }


	//show job report
    public function actionJobReport() {

        $query = Job::find()->where('DATE(job_date) BETWEEN "' . Yii::$app->request->get('start') . '" AND "' . Yii::$app->request->get('end') . '" AND user_id ="' . Yii::$app->request->get('user_id') . '"')->orderBy('job_date ASC');

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => false,
            'sort' => false,
        ]);
        
        //return $this->renderPartial('index', [
        return $this->render('job_report', [
            'dataProvider' => $dataProvider,
            'user_id'=>Yii::$app->request->get('user_id'),
            'start'=>Yii::$app->request->get('start'),
            'end'=>Yii::$app->request->get('end'),
            'name'=>User::findOne(Yii::$app->request->get('user_id'))
        ]);
    }


    //print job report
    public function actionJobPrint() {
        
        $this->layout = "print";
        
        $query = Job::find()->where('DATE(job_date) BETWEEN "' . Yii::$app->request->get('start') . '" AND "' . Yii::$app->request->get('end') . '" AND user_id ="' . Yii::$app->request->get('user_id') . '"');

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => false,
            'sort' => false,
        ]);

        return $this->render('job_print', [
            'dataProvider' => $dataProvider,
            'user_id'=>Yii::$app->request->get('user_id'),
            'start'=>Yii::$app->request->get('start'),
            'end'=>Yii::$app->request->get('end'),
            'name'=>User::findOne(Yii::$app->request->get('user_id'))
        ]);
    }
    

	//show job chart report
    public function actionChartReport() {

        $query = JobType::find();

        $job_type_name = array();

        foreach ($query->all() as $data) {

            $count = Job::find()->where('DATE(job_date) 
                BETWEEN "' . Yii::$app->request->get('start') . '" AND "' . Yii::$app->request->get('end') . '"
                AND user_id ="' . Yii::$app->request->get('user_id') . '"AND job_type_id = ' . $data['id'] . '')->count();

            $labels[] = $data['job_type_name'];

            $data2[] = $count;
        }

        $dataProvider = new ActiveDataProvider([
            'query' => JobType::find(),
            'pagination' => false,
			'sort'=>false,
        ]);

        return $this->render('chart', ['labels' => $labels,
            'dataProvider' => $dataProvider,
            'data' => $data2,
            'user_id'=>Yii::$app->request->get('user_id'),
            'start'=>Yii::$app->request->get('start'),
            'end'=>Yii::$app->request->get('end'),
            'name'=>User::findOne(Yii::$app->request->get('user_id'))
        ]);
    }
	
	//print job chart report
	public function actionPrintChart() {
		
		$this->layout = "print";

        $query = JobType::find();

        foreach ($query->all() as $data) {

            $count = Job::find()->where('DATE(job_date) 
                BETWEEN "' . Yii::$app->request->get('start') . '" AND "' . Yii::$app->request->get('end') . '"
                AND user_id ="' . Yii::$app->request->get('user_id') . '"AND job_type_id = ' . $data['id'] . '')->count();

            $labels[] = $data['job_type_name'];

            $data2[] = $count;
        }

        $dataProvider = new ActiveDataProvider([
            'query' => JobType::find(),
            'pagination' => false,
			'sort'=>false,
        ]);

        return $this->render('job_chart_print', ['labels' => $labels,
            'data'=> $data2,
            'dataProvider' => $dataProvider,
            'user_id'=>Yii::$app->request->get('user_id'),
            'start'=>Yii::$app->request->get('start'),
            'end'=>Yii::$app->request->get('end'),
            'name'=>User::findOne(Yii::$app->request->get('user_id'))
        ]);
    }
    

	//export job data to excel
	public function actionJobExport() {
        
        $this->layout = "print";
        
        $query = Job::find()->where('DATE(job_date) BETWEEN "' . Yii::$app->request->get('start') . '" AND "' . Yii::$app->request->get('end') . '" AND user_id ="' . Yii::$app->request->get('user_id') . '"');

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => false,
            'sort' => false,
        ]);

        return $this->render('job_export', [
            'dataProvider' => $dataProvider,
        ]);
    }
	
	
    public function actionDeviceRepair($department_id = null) {
      
        $query = Device::find()->where(['department_id' => $department_id])->orderBy('device_type_id,department_id');

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => false,
        ]);
        return $this->render('device_repair', [
            'dataProvider' => $dataProvider,
            'department_id'=>$department_id
        ]);
    }

    public function actionRepairReport($id) {
        $this->layout = "print";
        $query = Job::find()->where(['device_id' => $id]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => false,
            'sort'=>false,
        ]);

        return $this->render('device_repair_report', [
            'device' => Device::findOne($id),
            'dataProvider' => $dataProvider,
        ]);
    }
	
	public function actionRepairExport($id) {
        $this->layout = "print";
        $query = Job::find()->where(['device_id' => $id]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => false,
            'sort'=>false,
        ]);

        return $this->render('device_repair_export', [
            'device' => Device::findOne($id),
            'dataProvider' => $dataProvider,
        ]);
    }


    public function actionDeviceList(){

        $device_type_id = Yii::$app->request->get('device_type_id',0);

        $department_id = Yii::$app->request->get('department_id',0);

            if($device_type_id == 0 && $department_id == 0){
                //all device type
                $query = Device::find()
                ->orderBy('department_id,device_type_id ASC');

            }else if($device_type_id == 0){

                $query = Device::find()
                ->where(['department_id'=>$department_id])
               ->orderBy('department_id,device_type_id ASC');

            }else if($department_id == 0){

                $query = Device::find()
                ->where(['device_type_id'=>$device_type_id])
                ->orderBy('department_id,device_type_id ASC');

            }else{

                $query = Device::find()
                ->where(['department_id'=>$department_id,'device_type_id'=>$device_type_id])
               ->orderBy('department_id,device_type_id ASC');
            }

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            //'pagination'=>false,
        ]);

        return $this->render('device_list',[
            'model'=> new Device(),
            'dataProvider' => $dataProvider,
            'device_type_id' => $device_type_id,
            'department_id'=>$department_id,
        ]);
    }


    public function actionShowList($device_type_id = null,$department_id = null){
        
        $this->layout = "print";
        
            if($device_type_id == 0 && $department_id == 0){
                //all device type
                $query = Device::find()
                ->orderBy('department_id,device_type_id ASC');

            }else if($device_type_id == 0){

                $query = Device::find()
                ->where(['department_id'=>$department_id])
               ->orderBy('department_id,device_type_id ASC');

            }else if($department_id == 0){

                $query = Device::find()
                ->where(['device_type_id'=>$device_type_id])
                ->orderBy('department_id,device_type_id ASC');

            }else{

                $query = Device::find()
                ->where(['department_id'=>$department_id,'device_type_id'=>$device_type_id])
               ->orderBy('department_id,device_type_id ASC');
            }

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination'=>false,
            'sort'=>false,
        ]);

        return $this->render('device_list_show', [
            'device_type_id'=>$device_type_id,
            'department_id' =>$department_id,
            'dataProvider' => $dataProvider,
        ]);
    }
	
	public function actionDeviceExport($device_type_id = null,$department_id = null){
        
        $this->layout = "print";
        
              if($device_type_id == 0 && $department_id == 0){
                //all device type
                $query = Device::find();

            }else if($device_type_id == 0){

                $query = Device::find()->where(['department_id'=>$department_id]);

            }else if($department_id == 0){

                $query = Device::find()->where(['device_type_id'=>$device_type_id]);

            }else{

                $query = Device::find()->where(['department_id'=>$department_id,'device_type_id'=>$device_type_id]);
            }

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination'=>false,
            'sort'=>false,
        ]);

        return $this->render('device_export', [
            'dataProvider' => $dataProvider,
        ]);
    }


    public function actionCostDepartment($month = null,$year = null){

        if($month == null && $year == null){

            $data = NULL;

        }else{

             $sql = "SELECT device.department_id,department_name,SUM(price) AS price FROM job 
                INNER JOIN device ON device.id = job.device_id 
                INNER JOIN department ON department.id = device.department_id
                WHERE MONTH(job_date) = ".$month." AND YEAR(job_date) = ".$year." 
                GROUP BY department_name";

            $data = Yii::$app->db->createCommand($sql)->queryAll();
        }

            return $this->render('cost_department',[
                'data'=>$data,
                'month'=>$month,
                'year' =>$year
            ]);
        }

        
    public function actionDetailCost($month,$year,$department_id){
        
        $this->layout = "print";
        
        $query = Job::find()
                ->innerJoinWith('device','device.id = job.device_id')
                ->where(['MONTH(job_date)'=>$month,'YEAR(job_date)'=>$year])
                ->andWhere(['device.department_id'=>$department_id]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => false,
            'sort' => false,
        ]);
        
        //sum price
        $sum = $query->sum('price');

        return $this->render('cost_detail_department',[
            'dataProvider'=>$dataProvider,
            'sum'=>$sum
        ]);

    }
	
	
	public function actionCostExport($month,$year,$department_id){
        
        $this->layout = "print";
        
        $query = Job::find()
                ->innerJoinWith('device','device.id = job.device_id')
                ->where(['MONTH(job_date)'=>$month,'YEAR(job_date)'=>$year])
                ->andWhere(['device.department_id'=>$department_id]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => false,
            'sort' => false,
        ]);
        
        return $this->render('cost_detail_export',[
            'dataProvider'=>$dataProvider,
        ]);

    }
	

	public function actionChartType(){

        $start_date = Yii::$app->request->post('start_date',date("Y-m-01"));

        $end_date = Yii::$app->request->post('end_date',date('Y-m-t',strtotime('today')));

        $sql = "SELECT device_type as show_text, ( SELECT COUNT(*) FROM device 
            INNER JOIN job ON device.id = job.device_id 
            WHERE device.device_type_id = device_type.id 
            AND job.job_start_date BETWEEN '".$start_date."' AND '".$end_date."' ) 
            AS count_type 
            FROM device_type";

        $chart_type = Yii::$app->db->createCommand($sql)->queryAll();

        foreach($chart_type as $data){

            $labels[] = $data['show_text'];
            $count_type[] = $data['count_type'];
        }
		
		//no type data
		if(empty($labels)){
			$labels = null;
			$count_type = null;
		}

        return $this->render('chart_type',[
            'labels'=>$labels,
            'data'=>$count_type,
            'chart_data'=>$chart_type,
            'start_date' => $start_date,
            'end_date' => $end_date
        ]);

	}

    public function actionChartDepartment(){

        $start_date = Yii::$app->request->post('start_date',date("Y-m-01"));

        $end_date = Yii::$app->request->post('end_date',date('Y-m-t',strtotime('today')));


        $sql = "SELECT department_name AS show_text, ( SELECT COUNT(device.department_id) FROM device 
            INNER JOIN job ON job.device_id = device.id 
            WHERE device.department_id = department.id 
            AND job.job_start_date BETWEEN '".$start_date."' AND '".$end_date."' ) as count_department
            FROM department";

        $chart_department = Yii::$app->db->createCommand($sql)->queryAll();
	

        foreach($chart_department as $data){

            $labels[] = $data['show_text'];
            $count_department[] = $data['count_department'];

        }
		
		//no department data
		if(empty($labels)){
			$labels = null;
			$count_department = null;
		}

        return $this->render('chart_department',[
            'labels'=>$labels,
            'data'=>$count_department,
            'chart_data'=>$chart_department,
            'start_date' => $start_date,
            'end_date' => $end_date
        ]);

    }

    public function actionChartJobType(){

        $start_date = Yii::$app->request->post('start_date',date("Y-m-01"));

        $end_date = Yii::$app->request->post('end_date',date('Y-m-t',strtotime('today')));

        $sql = "SELECT job_type_name AS show_text ,( SELECT COUNT(*) FROM job 
            WHERE job.job_type_id = job_type.id AND job.job_start_date 
            BETWEEN '".$start_date."' AND '".$end_date."' ) as count_job_type 
            FROM `job_type`";

        $chart_job_type = Yii::$app->db->createCommand($sql)->queryAll();

        foreach($chart_job_type as $data){

            $labels[] = $data['show_text'];
            $count_job_type[] = $data['count_job_type'];
        }

        return $this->render('chart_job_type',[
            'labels'=>$labels,
            'data'=>$count_job_type,
            'chart_data'=>$chart_job_type,
            'start_date' => $start_date,
            'end_date' => $end_date
        ]);

    }

    public function actionPrintChartJobType(){

        $this->layout = "print";

        $start_date = Yii::$app->request->get('start_date',date("Y-m-01"));

        $end_date = Yii::$app->request->get('end_date',date('Y-m-t',strtotime('today')));

        $sql = "SELECT job_type_name AS show_text ,( SELECT COUNT(*) FROM job 
            WHERE job.job_type_id = job_type.id AND job.job_start_date 
            BETWEEN '".$start_date."' AND '".$end_date."' ) as count_data 
            FROM `job_type`";

        $chart_job_type = Yii::$app->db->createCommand($sql)->queryAll();

        foreach($chart_job_type as $data){

            $labels[] = $data['show_text'];
            $count_job_type[] = $data['count_data'];
        }

        return $this->render('chart_print',[
            'labels'=>$labels,
            'data'=>$count_job_type,
            'chart_data'=>$chart_job_type,
            'start_date' => $start_date,
            'end_date' => $end_date,
            'title'=>'ประเภทงานซ่อม'
        ]);

    }


    public function actionPrintChartDepartment(){

        $this->layout = "print";

        $start_date = Yii::$app->request->get('start_date',date("Y-m-01"));

        $end_date = Yii::$app->request->get('end_date',date('Y-m-t',strtotime('today')));


        $sql = "SELECT department_name AS show_text, ( SELECT COUNT(device.department_id) FROM device 
            INNER JOIN job ON job.device_id = device.id 
            WHERE device.department_id = department.id 
            AND job.job_start_date BETWEEN '".$start_date."' AND '".$end_date."' ) as count_data
            FROM department";

        $chart_department = Yii::$app->db->createCommand($sql)->queryAll();

        foreach($chart_department as $data){

            $labels[] = $data['show_text'];
            $count_department[] = $data['count_data'];

        }
		
		//no department data
		if(empty($labels)){
			$labels = null;
			$count_department = null;
		}

        return $this->render('chart_print',[
            'labels'=>$labels,
            'data'=>$count_department,
            'chart_data'=>$chart_department,
            'start_date' => $start_date,
            'end_date' => $end_date,
            'title' => 'หน่วยงาน / แผนก'
        ]);

    }

    public function actionPrintChartType(){

        $this->layout = "print";

        $start_date = Yii::$app->request->get('start_date',date("Y-m-01"));

        $end_date = Yii::$app->request->get('end_date',date('Y-m-t',strtotime('today')));

        $sql = "SELECT device_type as show_text, ( SELECT COUNT(*) FROM device 
            INNER JOIN job ON device.id = job.device_id 
            WHERE device.device_type_id = device_type.id 
            AND job.job_start_date BETWEEN '".$start_date."' AND '".$end_date."' ) 
            AS count_data 
            FROM device_type";

        $chart_type = Yii::$app->db->createCommand($sql)->queryAll();

        foreach($chart_type as $data){

            $labels[] = $data['show_text'];
            $count_type[] = $data['count_data'];
        }
		
		//no type data
		if(empty($labels)){
			$labels = null;
			$count_type = null;
		}

        return $this->render('chart_print',[
            'labels'=>$labels,
            'data'=>$count_type,
            'chart_data'=>$chart_type,
            'start_date' => $start_date,
            'end_date' => $end_date,
            'title' => 'หมวดหมู่อุปกรณ์'
        ]);

    }
	
}
