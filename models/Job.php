<?php

namespace app\models;

use Yii;
use yii\helpers\ArrayHelper;
/**
 * This is the model class for table "job".
 *
 * @property integer $id
 * @property string $job_date
 * @property string $job_detail
 * @property string $job_start_date
 * @property string $job_success_date
 * @property string $job_how_to_fix
 * @property integer $price
 * @property string $job_status
 * @property integer $job_employee_id
 * @property integer $job_type_id
 * @property integer $device_id
 * @property integer $user_id
 *
 * @property JobType $jobType
 * @property User2 $user
 * @property Employee $jobEmployee
 */
class Job extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'job';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
		
            [['job_date', 'job_start_date', 'job_success_date'], 'safe'],
            [['price', 'job_employee_id', 'job_type_id', 'device_id', 'user_id'], 'integer'],
            [['job_date','job_employee_id', 'job_type_id','user_id'], 'required'],
            [['job_detail', 'job_how_to_fix'], 'string', 'max' => 1000],
            [['job_status'], 'string', 'max' => 45],
			
            //[['job_type_id'], 'exist', 'skipOnError' => true, 'targetClass' => JobType::className(), 'targetAttribute' => ['job_type_id' => 'id']],
            //[['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => \dektrium\user\models\User::className(), 'targetAttribute' => ['user_id' => 'id']],
            //[['job_employee_id'], 'exist', 'skipOnError' => true, 'targetClass' => Employee::className(), 'targetAttribute' => ['job_employee_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'job_date' => 'วันที่แจ้ง',
            'job_detail' => 'ปัญหา/งาน',
            'job_start_date' => 'วันที่ดำเนินการ',
            'job_success_date' => 'วันที่เสร็จ',
            'job_how_to_fix' => 'สาเหตุ/วิธีแก้ไข',
            'price' => 'ค่าใช้จ่าย',
            'job_status' => 'สถานะ',
            'job_employee_id' => 'ชื่อผู้แจ้ง',
            'job_type_id' => 'ประเภทงาน',
            'device_id' => 'Device ID',
            'user_id' => 'User ID',
			'UserName'=>Yii::t('app','ผู้ดำเนินการ'),
        ];
    }
	
	public function getUserName(){
		return $this->user->fullname;
	}

    public static function dateThai($date){

        if(!empty($date)){
			
            $get_date = explode("-", $date);
            
            $month =  [ "มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน", "กรกฏาคม", "สิงหาคม", "กันยนยน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม" ];
			
			if($get_date["1"] != "00"){
				
				$get_month = $get_date["1"]-1;
				
				$get_year = $get_date["0"]+543;

				return $get_date["2"]." ".$month[$get_month]." ".$get_year;    
			}
		}
        return false;
    }
	
	public static function getDateTime($get_date = null){
		
		if(!empty($get_date)){
		
			$date = explode(" ", $get_date);
			$date_t = Job::dateThai($date['0']);
		
		return $date_t."  เวลา  ".substr($date['1'],0,-3)." น.";
			
		}

	}

    public static function dateShortThai($date){
		
		if(!empty($date)){
			
			$get_date = explode("-", $date);
			
			$month =  [ "ม.ค.", "ก.พ.", "มี.ค.", "เม.ย.", "พ.ค.", "มิ.ย.", "ก.ค.", "ส.ค.", "ก.ย.", "ต.ค.", "พ.ย.", "ธ.ค." ];

			if($get_date["1"] != "00"){
				
				$get_month = $get_date["1"]-1;
				
				$get_year = $get_date["0"]+543;
				
				return $get_date["2"]." ".$month[$get_month]." ".substr($get_year,2);
			}
			
		}else{
			return false;
		}
    }
	
	//show status name
	public static function getStatus($status){
		
		if($status == "success"){
			
			$status_name = "<span style='color:green'>สำเร็จ</span>";
			
		}else if($status == "wait"){
			
			$status_name = '<span style="color:#CA6924;">รอตรวจสอบ</span>';
			
		}else if($status == "process"){
			
			$status_name = '<span style="color:#4B77BE;">กำลังดำเนินการ</span>';
		}
		return $status_name;
	}

    public static function itemsAlias($key){
        
        $year_now = date("Y");
        
        $year_start = 2015;
        
        $year = array();
              
        for ($year_start; $year_now >= $year_start; $year_now--) {
            
            $year_show = $year_now + 543;
            
            $year[$year_now] = $year_show;      
               
        }
        
        $items =[
            'month'=>[
                '01' => 'มกราคม',
                '02'=>'กุมภาพันธ์',
                '03'=>'มีนาคม',
                '04'=>'เมษายน',
                '05'=>'พฤษภาคม',
                '06'=>'มิถุนายน',
                '07'=>'กรกฏาคม',
                '08'=>'สิงหาคม',
                '09'=>'กันยายน',
                '10'=>'ตุลาคม',
                '11'=>'พฤศจิกายน',
                '12'=>'ธันวาคม',
            ],
            
        'year'=> $year
        ];
        
        return ArrayHelper::getValue($items, $key,[]);
    }

    public function getMonth(){
        return self::itemsAlias('month');
    }
	
	//count job status
	public static function CountStatus($get_status){
		
		return Job::find()->where(['job_status'=>$get_status])->count();
		
	}

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getJobType()
    {
        return $this->hasOne(JobType::className(), ['id' => 'job_type_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(\dektrium\user\models\User::className(), ['id' => 'user_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmployee()
    {
        return $this->hasOne(Employee::className(), ['id' => 'job_employee_id']);
    }


    public function getDevice(){
        return $this->hasOne(Device::className(),['id'=>'device_id']);
    }
}
