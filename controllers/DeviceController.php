<?php

namespace app\controllers;

use Yii;
use app\models\Device;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use yii\data\ActiveDataProvider;
/**
 * DeviceController implements the CRUD actions for Device model.
 */
class DeviceController extends Controller
{
    public function behaviors() {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
					'delete-all' => ['post'],
                ],
            ],
            'acess' => [
                'class' => AccessControl::className(),
                'only' => ['index', 'create', 'update', 'delete'],
                'rules' => [
                    [
                        'actions' => ['index', 'create', 'update', 'delete'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ]
            ]
        ];
    }

    /**
     * Lists all Device models.
     * @return mixed
     */
    public function actionIndex(){

        $model = new Device();

        $query = Device::find()->where(['device_status'=>'enable'])->orderBy('device_type_id,department_id ASC');

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort'=>false,
        ]);

        return $this->render('index', [
            'model' => $model,
            'get_select' =>NULL,
            'dataProvider' => $dataProvider,
			'active'=>'device_id'
        ]);
		
    }

    public function actionSearchDevice(){

            $get_select = Yii::$app->request->get('Device');

            $device_type_id = $get_select['device_type_id'];

            $department_id = $get_select['department_id'];

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

        //return $this->renderPartial('index', [
        return $this->render('index', [
            'model' => new Device(),
            'get_select'=> $get_select,
            'dataProvider' => $dataProvider,
			'active'=>'device_type'
        ]);
    }
	
	public function actionSearchId(){

            $get_select = Yii::$app->request->get('Device');

            $query = Device::find()->where(['device_id'=>$get_select['device_id']]);

            $dataProvider = new ActiveDataProvider([
                'query' => $query,
                'pagination'=>false,
                'sort'=>false,
            ]);

        //return $this->renderPartial('index', [
        return $this->render('index', [
            'model' => new Device(),
            'get_select'=> NULL,
            'dataProvider' => $dataProvider,
			'active'=>'device_id'
        ]);
    }
	
	public function actionDeviceName(){

            $get_select = Yii::$app->request->get('Device');

            $query = Device::find()->where(['id'=>$get_select['id']]);

            $dataProvider = new ActiveDataProvider([
                'query' => $query,
                'pagination'=>false,
                'sort'=>false,
            ]);

        //return $this->renderPartial('index', [
        return $this->render('index', [
            'model' => new Device(),
            'get_select'=> NULL,
            'dataProvider' => $dataProvider,
			'active'=>'device_name'
        ]);
    }
	
	
	public function actionDeviceSn(){

            $get_select = Yii::$app->request->get('Device');

            $query = Device::find()->where(['serial_no'=>$get_select['serial_no']]);

            $dataProvider = new ActiveDataProvider([
                'query' => $query,
                'pagination'=>false,
                'sort'=>false,
            ]);

        //return $this->renderPartial('index', [
        return $this->render('index', [
            'model' => new Device(),
            'get_select'=> NULL,
            'dataProvider' => $dataProvider,
			'active'=>'serial_no'
        ]);
    }
    
    public function actionDeviceStatus($status) {
        
        $query = Device::find()->where(['device_status' => $status]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => false,
            'sort' => false,
        ]);
        
        return $this->render('use',[
            'model' => new Device(),
            'dataProvider'=>$dataProvider,
			'active'=>'device_id'
			
        ]);
    }

    /**
     * Displays a single Device model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Device model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Device();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            
            //show alert
            Yii::$app->getSession()->setFlash('save');
            
            //for search device
            return $this->redirect(['search-device',
                'Device[department_id]'=>$model->department_id,
                'Device[device_type_id]'=>$model->device_type_id]);
            
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Device model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id){

        $device = Yii::$app->request->get('Device');

        $page = Yii::$app->request->get('page');

        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            
            //show alert
            Yii::$app->getSession()->setFlash('save');
            
                if($device != NULL){

                    //for search device page
                    return $this->redirect(['search-device',
                        'Device[department_id]'=>$device['department_id'],
                        'Device[device_type_id]'=>$device['device_type_id']]);
                }else{

                    return $this->redirect(['index', 'page' => $page]);
                }

        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Device model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {

        $device = Yii::$app->request->get('Device');

        $page = Yii::$app->request->get('page');

        $this->findModel($id)->delete();
        
        //show alert
        Yii::$app->getSession()->setFlash('delete');
            
        if($device != NULL){

            //for search device
            return $this->redirect(['search-device',
                'Device[department_id]'=>$device['department_id'],
                'Device[device_type_id]'=>$device['device_type_id']]);
            
        }else{

            return $this->redirect(['index', 'page' => $page]);
        }


    }
	
	
	public function actionDeleteAll(){
	
		$delete_ids = explode(',', Yii::$app->request->post('ids'));
		
		Device::deleteAll(['in','id',$delete_ids]);
		
		return $this->redirect(['index']);
		
	}

    /**
     * Finds the Device model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Device the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Device::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
