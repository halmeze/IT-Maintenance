<?php

namespace app\models;

use Yii;

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
 */
class Request extends \yii\db\ActiveRecord
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
            [['job_date','job_employee_id','job_detail'], 'required'],
            [['job_detail', 'job_how_to_fix'], 'string', 'max' => 1000],
            [['job_status'], 'string', 'max' => 45],
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
            'job_detail' => 'ปัญหา/อาการเสีย',
            'job_start_date' => 'วันที่ดำเนินการซ่อม',
            'job_success_date' => 'วันที่เสร็จ',
            'job_how_to_fix' => 'สาเหตุ/วิธีการซ่อม',
            'price' => 'Price',
            'job_status' => 'สถานะการซ่อม',
            'job_employee_id' => 'ชื่อผู้แจ้ง',
            'job_type_id' => 'Job Type ID',
            'device_id' => 'Device ID',
            'user_id' => 'ผู้ดำเนินการ',
        ];
    }
	

	
	public function getJobType()
    {
        return $this->hasOne(JobType::className(), ['id' => 'job_type_id']);
    }
	
	public function getDevice(){
        return $this->hasOne(Device::className(),['id'=>'device_id']);
    }
	
	public function getUser()
    {
        return $this->hasOne(\dektrium\user\models\User::className(), ['id' => 'user_id']);
    }
	
	public function getEmployee()
    {
        return $this->hasOne(Employee::className(), ['id' => 'job_employee_id']);
    }
	
}
