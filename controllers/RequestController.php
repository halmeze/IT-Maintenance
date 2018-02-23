<?php

namespace app\controllers;

use yii;
use app\models\Request;
use app\models\Job;
use yii\data\ActiveDataProvider;
use yii\helpers\Json;
use app\models\Device;
use app\models\Employee;
use dektrium\user\models\User;
use yii\web\NotFoundHttpException;

class RequestController extends \yii\web\Controller
{

    public function actionIndex(){
		
		$model = new Job();
		
		if ($model->load(Yii::$app->request->post())) {
			
			echo $model->job_employee_id;
			
			$query = Job::find()->where(['job_employee_id'=>$model->job_employee_id])->orderBy(['job_date' => SORT_DESC]);
	
        }else{
		
			$query = Job::find()->orderBy(['job_date' => SORT_DESC]);
		}
		
		$dataProvider = new ActiveDataProvider([
			'query' => $query,
			'sort'=>false,
		]);

		return $this->render('index', [
			'dataProvider' => $dataProvider,
			'model'=>$model
		]);
    }
	
	public function actionSearchStatus($status){
        //show data for search date
        $query = Job::find()->where(['job_status'=>$status])->orderBy('job_date ASC');

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination'=>false,
            'sort' =>false
        ]);

        return $this->render('index', [
            'dataProvider' => $dataProvider,
            'countAll'=> $query->count(),
            'title'=> $status == 'wait' ? 'สถานะ : รอตรวจสอบ'  : 'สถานะ : กำลังดำเนินการ',
        ]);
    }
	
	public function actionFormRequest(){
	
	    $model = new Request();
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
		
		/*if($this->sendMailTo($model)){

			return;

		}else{
			throw new NotFoundHttpException('ไม่พบข้อมูล');
		}*/
			
		$this->sendMailTo($model);

            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->redirect(['index']);
        }
		
        return $this->render('form_request', [
            'model' => $model,
        ]);
	}

		//send email to admin
	public function SendMailTo($model){
	
	$user_email = User::find()->select('email')->All();
		
		if(!empty($user_email)){
		
			foreach($user_email as $user){

				if(!empty($user->email)){
				
					try{
						Yii::$app->mailer->compose('@app/mail/layouts/view',[
							'model'=>$model
						])
						->setFrom(['noreply@monkeywebstudio.com'=>'ระบบแจ้งซ่อมคอมพิวเตอร์ '])
						->setTo($user->email)
						->setSubject('แจ้งซ่อมคอมพิวเตอร์ '.Job::getDateTime($model->job_date).'')
						->send();
						
					}catch(\Swift_TransportException $e){
					

					}

				}
			}
		}

	}
	
	public function actionView($id = null){
		$model = Job::findOne($id);
		return $this->renderAjax('view',['model'=>$model]);
		
	}
	
	public function actionPrint($id = null){
		
		$this->layout = "print";

		$model = Job::findOne($id);
		
		return $this->render('print',['model'=>$model]);
	
	}
	
	
	public function actionGetDevice() {
	
		$out = [];

		if (isset($_POST['depdrop_parents'])) {

			$parents = $_POST['depdrop_parents'];

			if ($parents != null) {

					$id = $parents[0];
					
					$emp_department = Employee::findOne($id);
					
					$list = Device::find()->select('id,device_name')
					->select(['id,CONCAT(device_id," - ",device_name) AS device_name'])
					->where(['department_id'=>$emp_department->department_id])
					->andWhere(['device_status'=>'enable'])
					->All(); 

					$selected = '';

					foreach ($list as $i => $account) {

						$out[] = ['id' => $account['id'], 'name' => $account['device_name']];
					}

					echo Json::encode(['output'=>$out, 'selected'=>'']);
					return;
				}
			}

        echo Json::encode(['output'=>'', 'selected'=>'']);
    }

}
