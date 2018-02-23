<?php
namespace app\controllers;
use Yii;
use yii\db\Query;
use app\models\Version;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;

class UpdateController extends \yii\web\Controller
{

    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
			'acess'=>[
				'class'=>AccessControl::className(),
				'only' =>['index','create','update','delete'],
				'rules'=>[
					[
						//'actions'=>['index','create','update','delete'],
						'allow'=>true,
						'roles'=>['@'],
					],

				]
			]
        ];
    }
	
    public function actionIndex()
    {

			$this->actionCheckConnect();
					
			$json = json_decode($this->getJson(),true);
			
			$current_version = $this->version();
			
			$last_version = $json['data']['version'];
			
			return $this->render('index',['current_version'=>$current_version,'last_version'=>$last_version]);
		
    }
	
	public function actionCheckConnect(){
		
		$connect = $this->getJson();
		
		if(empty($connect)){
		
			return $this->redirect(['not-connect']);
		
		}
	}
	
	public function actionNotConnect(){
	
		return $this->render('notConnect');
	}
	
	public function actionUpdate(){
	
		$json = json_decode($this->getJson(),true);
		
		$filename = $json['data']['file'];

		$current_version = $this->version();

		$new_version = $json['data']['version'];
		
		$link = $json['data']['link'];

		if($current_version < $new_version){
			
			$file_update = @copy($link,$_SERVER['DOCUMENT_ROOT'].'/it/_update/'.$filename);

			if(!$file_update){
			
				return $this->render('manual_update',['link'=>$link,'version'=>$new_version]);
				
			}else{
				
				return $this->render('update',['data'=>$json['data'],'current_version'=>$current_version]);
			}
			
		}else{
		
			return $this->render('isCurrent',['current_version'=>$current_version]);
		}
	}
	
	public function actionExtractFile(){
	
		$json = json_decode($this->getJson(),true);
		
		$link = $json['data']['link'];
		
		$version = $json['data']['version'];
		
		if(isset($_GET['update']) && isset($_GET['v']) && isset($_GET['filename'])){
		
			$this->updateVersionDb($version);
		
			$file = $_SERVER['DOCUMENT_ROOT'].'/it/_update/'.$_GET['filename'];
			
			if($_GET['update'] == 'install'){
				
				$zip = new \ZipArchive();
				
				if( file_exists($file) ){

					if ($zip->open($file) === TRUE) {
					
						$zip->extractTo('../');
						
						$zip->close();
											
						return $this->render('success',['version'=>$version]);
						
					} else {
						
						return $this->render('manual_update',['link'=>$link,'version'=>$version]);
					}

				}else{
				
					return $this->render('manual_update',['link'=>$link,'version'=>$version]);
				}
			}
		}
	}
	
	public function version(){
	
		$version = Version::find()->select('version')->where(['id'=>1])->One();
		
		return $current_version = $version->version;

	}
	
	public function getJson(){
	
		$version = $this->version();

		$json = @file_get_contents("http://www.monkeywebstudio.com/it/update/service.php?version=$version");
	 
		return $json;
	}
	
	/*public function createTableVersion(){
	
		$connection = \Yii::$app->db;
		
		 try {

			$command = $connection->createCommand(
			
				"CREATE TABLE IF NOT EXISTS `version` (
				 `id` int(11) NOT NULL AUTO_INCREMENT,
				 `version` varchar(10) NOT NULL,
				 `update_date` datetime NOT NULL,
				 PRIMARY KEY (`id`)
				) ENGINE=InnoDB DEFAULT CHARSET=utf8;
				
				 INSERT INTO `version` (`id`, `version`, `update_date`) VALUES (1, '2.4', '2016-07-30 02:15:27');
				");

			$result = $command->execute();
			
		} catch (Exception $e) {
		
			 echo "Caught exception : <b>".$e->getMessage()."</b><br/>";
			 
		}
	}*/
	
	public function updateVersionDb($version){
	
		$connection = \Yii::$app->db;
		
		 try {
			//update version number
			$command = $connection->createCommand(
			
				"UPDATE `version` SET `version` = '".$version."' WHERE `version`.`id` = 1;");

			$command->execute();
		} catch (Exception $e) {
		
			 echo "Caught exception : <b>".$e->getMessage()."</b><br/>";
		}
	}
	


}
