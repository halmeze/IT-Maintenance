<?php
namespace app\controllers;

use yii;
use yii\web\Controller;
use yii\data\ActiveDataProvider;
use yii\web\UploadedFile;
use app\models\Employee;
use app\models\DeviceType;
use app\models\Department;
use app\models\Device;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;

class ImportController  extends Controller {

    public function behaviors() {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
            'acess' => [
                'class' => AccessControl::className(),
                'only' => ['index','device-type', 'department', 'employee', 'device'],
                'rules' => [
                    [
                        'actions' => ['index','device-type', 'department', 'employee', 'device'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ]
            ]
        ];
    }
        
    public function actionIndex(){
		return $this->render('index');
    }
    

	
	//upload file excel
	public function actionDeviceType(){
	
	    $model = new DeviceType();

        if ($model->load(Yii::$app->request->post())) {
		
			$file = UploadedFile::getInstance($model, 'file');
			
			if(empty($file)){
			
				return $this->render('import_type', ['model' => $model]);
			}
			
            $model->file = $file;

            $fileName = rand(0, 999);

            //save file to folder web/upload
            $model->file->saveAs('file/' . $fileName . '.' . $model->file->extension);
				
            //import excel file to product table 
            $this->actionImportType('file/' . $fileName . '.' . $model->file->extension);
			
        }else{
		
			 return $this->render('import_type', ['model' => $model]);
		}
	}
	
	//import data to database
    public function actionImportType($inputFile = null) {

        try {
            $inputFileType = \PHPExcel_IOFactory::identify($inputFile);
            $objReader = \PHPExcel_IOFactory::createReader($inputFileType);
            $objPHPExcel = $objReader->load($inputFile);
            
        } catch (yii\base\Exception $e) {
            die('Error');
        }
		
        $sheet = $objPHPExcel->getSheet(0);
        $highestRow = $sheet->getHighestRow();
        $highestColumn = $sheet->getHighestColumn();
		
        for ($row = 1; $row <= $highestRow; $row++) {

            $rowData = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row, NULL, TRUE, FALSE);

            if ($row == 1) {
                continue;
            }

            $type = new DeviceType();
            $type->device_type = $rowData['0']['1'];
            $type->save();
			
				if($type->getErrors()){
					return $this->redirect(['error','error'=>'เกิดข้อผิดพลาดในการนำเข้าข้อมูล']);
				}
        }
		
		//show alert
        Yii::$app->getSession()->setFlash('import_success');
        
        return $this->redirect(['index']);
    }
	
	
		
	//upload file excel
	public function actionDepartment(){
	
	    $model = new Department();

        if ($model->load(Yii::$app->request->post())) {
		
			$file = UploadedFile::getInstance($model, 'file');
			
			if(empty($file)){
			
				return $this->render('import_department', ['model' => $model]);
			}
			
            $model->file = $file;

            $fileName = rand(0, 999);

            //save file to folder web/upload
            $model->file->saveAs('file/' . $fileName . '.' . $model->file->extension);
				
            //import excel file to product table 
            $this->actionImportDepartment('file/' . $fileName . '.' . $model->file->extension);
			
        }else{
		
			 return $this->render('import_department', ['model' => $model]);
		}
	}
	
	//import data to database
    public function actionImportDepartment($inputFile) {

        try {
            $inputFileType = \PHPExcel_IOFactory::identify($inputFile);
            $objReader = \PHPExcel_IOFactory::createReader($inputFileType);
            $objPHPExcel = $objReader->load($inputFile);
            
        } catch (yii\base\Exception $e) {
            die('Error');
        }
		
        $sheet = $objPHPExcel->getSheet(0);
        $highestRow = $sheet->getHighestRow();
        $highestColumn = $sheet->getHighestColumn();
		
        for ($row = 1; $row <= $highestRow; $row++) {

            $rowData = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row, NULL, TRUE, FALSE);

            if ($row == 1) {
                continue;
            }

            $department = new Department();
            $department->department_name = $rowData['0']['1'];
            $department->save();
            
			if($department->getErrors()){
				print_r($department->getErrors());
				
				return $this->redirect(['error','error'=>'เกิดข้อผิดพลาดในการนำเข้าข้อมูล']);
			}
        }
		
		//show alert
        Yii::$app->getSession()->setFlash('import_success');
        
        return $this->redirect(['index']);
    }
	
	
	//upload file excel
	public function actionEmployee(){
	
	    $model = new Employee();

        if ($model->load(Yii::$app->request->post())) {
		
			$file = UploadedFile::getInstance($model, 'file');
			
			if(empty($file)){
			
				return $this->render('import_employee', ['model' => $model]);
			}
			
            $model->file = $file;

            $fileName = rand(0, 999);

            //save file to folder web/upload
            $model->file->saveAs('file/' . $fileName . '.' . $model->file->extension);
				
            //import excel file to product table 
            $this->actionImportEmployee('file/' . $fileName . '.' . $model->file->extension);
			
        }else{
		
			 return $this->render('import_employee', ['model' => $model]);
		}
	}
	
	public function actionImportEmployee($inputFile) {

        try {

            $inputFileType = \PHPExcel_IOFactory::identify($inputFile);
            $objReader = \PHPExcel_IOFactory::createReader($inputFileType);
            $objPHPExcel = $objReader->load($inputFile);
            
        } catch (yii\base\Exception $e) {
            die('Error');
        }

        $sheet = $objPHPExcel->getSheet(0);
        $highestRow = $sheet->getHighestRow();
        $highestColumn = $sheet->getHighestColumn();

        for ($row = 1; $row <= $highestRow; $row++) {

            $rowData = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row, NULL, TRUE, FALSE);

            if ($row == 1) {
                continue;
            }

            $employee = new Employee();
            $employee->user_fullname = $rowData['0']['1'];
			$employee->user_position = $rowData['0']['2'];
			$department = Department::find()->where(['department_name'=>trim($rowData['0']['3'])])->One();
			
			if(!$department){
				return $this->redirect(['error','error'=>'เกิดข้อผิดพลาดในการนำเข้าข้อมูล']);
			}
			
			$employee->department_id = $department['id'];
            $employee->save();
			
            if($employee->getErrors()){
				return $this->redirect(['error','error'=>'เกิดข้อผิดพลาดในการนำเข้าข้อมูล']);
			}
			
        }
		
		//show alert
        Yii::$app->getSession()->setFlash('import_success');
        
        return $this->redirect(['index']);
    }
	
	
	//upload file excel
	public function actionDevice(){
	
	    $model = new Device();

        if ($model->load(Yii::$app->request->post())) {
		
			$file = UploadedFile::getInstance($model, 'file');
			
			if(empty($file)){
			
				return $this->render('import_device', ['model' => $model]);
			}
			
            $model->file = $file;

            $fileName = rand(0, 999);

            //save file to folder web/upload
            $model->file->saveAs('file/device_' . $fileName . '.' . $model->file->extension);
				
            //import excel file to product table 
            $this->actionImportDevice('file/device_' . $fileName . '.' . $model->file->extension);
			
        }else{
		
			 return $this->render('import_device', ['model' => $model]);
		}
	}
	
	public function actionImportDevice($inputFile) {

        try {

            $inputFileType = \PHPExcel_IOFactory::identify($inputFile);
            $objReader = \PHPExcel_IOFactory::createReader($inputFileType);
            $objPHPExcel = $objReader->load($inputFile);
            
        } catch (yii\base\Exception $e) {
            die('Error');
        }

        $sheet = $objPHPExcel->getSheet(0);
        $highestRow = $sheet->getHighestRow();
        $highestColumn = $sheet->getHighestColumn();
		
		//skip emply row
		//$highestRow -= 1;
		
        for ($row = 1; $row <= $highestRow; $row++) {

            $rowData = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row, NULL, TRUE, FALSE);

            if ($row == 1) {
                continue;
            }

		if(!empty($rowData['0']['18']) && !empty($rowData['0']['19'])){
		
            $device = new Device();
            $device->device_id = $rowData['0']['1'];
			$device->serial_no = $rowData['0']['2'];
			$device->device_brand = $rowData['0']['3'];
			$device->device_model = $rowData['0']['4'];
			$device->device_name = $rowData['0']['5'];
			$device->memory = $rowData['0']['6'];
			$device->cpu = $rowData['0']['7'];
			$device->harddisk = $rowData['0']['8'];
			$device->monitor = $rowData['0']['9'];
			$device->device_ip = $rowData['0']['10'];
			$device->date_use = $rowData['0']['11'];
			$device->date_expire = $rowData['0']['12'];
			$device->device_price = $rowData['0']['13'];
			$device->vender = $rowData['0']['14'];
			$device->warranty = $rowData['0']['15'];
			
			//check status
			if($rowData['0']['16'] == 'enable' || $rowData['0']['16'] == 'disable'){
				
				$device->device_status = $rowData['0']['16'];
				
			}else{
			
				$device->device_status = 'enable';
			}
			
			$device->other_detail = $rowData['0']['17'];
			
			//get device type id
			$device_type = DeviceType::find()->where(['device_type'=>trim($rowData['0']['18'])])->One();
			
			//get department id
			$department = Department::find()->where(['department_name'=>trim($rowData['0']['19'])])->One();

			$device->department_id = $department['id'];
			$device->device_type_id = $device_type['id'];
            $device->save();
			
				if($device->getErrors()){
					return $this->redirect(['error','error'=>'เกิดข้อผิดพลาดในการนำเข้าข้อมูล']);
				}
			
			}else{

				return $this->redirect(['error','error'=>'เกิดข้อผิดพลาดในการนำเข้าข้อมูล']);
			}
        }
		
		//show alert
        Yii::$app->getSession()->setFlash('import_success');
        
        return $this->redirect(['index']);
    }
	
	public function actionError($error){
		return $this->render('error',['name'=>'Error','message'=>$error]);
	}


}

