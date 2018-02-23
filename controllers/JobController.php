<?php

namespace app\controllers;

use Yii;
use app\models\Job;
use app\models\JobSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\data\ActiveDataProvider;
use yii\filters\AccessControl;
/**
 * JobController implements the CRUD actions for Job model.
 */
class JobController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
			'acess'=>[
				'class'=>AccessControl::className(),
				'only' =>['index','searchstatus','print','create','update','delete'],
				'rules'=>[
					[
						'actions'=>['index','searchstatus','print','create','update','delete'],
						'allow'=>true,
						'roles'=>['@'],
					],
					/*['actions'=>['']
						'allow'=>true,
						'roles'=>['?','@'],
					]*/
				]
			]
        ];
    }

    /**
     * Lists all Job models.
     * @return mixed
     */
    public function actionIndex(){
		
        $start_search = Yii::$app->request->get('start_search',date("Y-m-d"));

        $end_search = Yii::$app->request->get('end_search',date("Y-m-d"));

        //show data for search date
        $query = Job::find()->where('DATE(job_date) BETWEEN "'.$start_search.'" AND "'.$end_search.'"')->orderBy(['job_date' => SORT_DESC]);

        $dataProvider = new ActiveDataProvider([
                'query' => $query,
                'pagination'=>false,
                'sort' =>false
        ]);

        return $this->render('index', [
                'start_search' => $start_search,
                'end_search' => $end_search,
                'dataProvider' => $dataProvider,
                'countAll'=> $query->count(),
                'title'=>"วันที่ ".Job::dateThai($start_search)." ถึง ".Job::dateThai($end_search),
        ]);
        
    }
	
    public function actionSearchStatus($status){
        //show data for search date
        $query = Job::find()->where(['job_status'=>$status])->orderBy(['job_date' => SORT_DESC]);

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

    /**
     * Displays a single Job model.
     * @param integer $id
     * @return mixed
     */
    public function actionPrint($id)
    {
        $this->layout = "print";
        return $this->render('print', [
            'model' => $this->findModel($id),
        ]);
    }
	

    /**
     * Creates a new Job model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {
        $model = new Job();
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            
            //show alert
            Yii::$app->getSession()->setFlash('save');

            return $this->redirect(['index',
                'start_search' => Yii::$app->formatter->asDate($model->job_date, 'php:Y-m-d'),
                'end_search' => Yii::$app->formatter->asDate($model->job_date, 'php:Y-m-d'),
            ]);
            
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Job model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
	//get date search
	$start_search = Yii::$app->request->get('start_search');
		
	$end_search = Yii::$app->request->get('end_search');
		
	$model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            
	     //show alert
            Yii::$app->getSession()->setFlash('save');	
            
            return $this->redirect(['index',
                'start_search'=>$start_search,
                'end_search'=>$end_search
            ]);
			
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Job model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id){
		
	//get date search
	$start_search = Yii::$app->request->get('start_search');
		
	$end_search = Yii::$app->request->get('end_search');
		
        $this->findModel($id)->delete();
        
            //show alert
            Yii::$app->getSession()->setFlash('delete');
            
		return $this->redirect(['index',
			'start_search'=>$start_search,
			'end_search'=>$end_search
		]);
    }

    /**
     * Finds the Job model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Job the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Job::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
