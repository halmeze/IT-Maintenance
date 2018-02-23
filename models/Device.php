<?php

namespace app\models;

use Yii;
use app\models\DeviceType;

/**
 * This is the model class for table "device".
 *
 * @property integer $id
 * @property string $device_id
 * @property string $serial_no
 * @property string $device_brand
 * @property string $device_model
 * @property string $device_name
 * @property string $memory
 * @property string $cpu
 * @property string $harddisk
 * @property string $monitor
 * @property string $other_detail
 * @property string $device_ip
 * @property string $date_use
 * @property string $date_expire
 * @property double $device_price
 * @property string $device_docs
 * @property string $device_status
 * @property integer $device_type_id
 * @property integer $department_id
 *
 * @property Department $department
 * @property DeviceType $deviceType
 */
class Device extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
	 
	public $file;
	 
    public static function tableName()
    {
        return 'device';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['date_use', 'date_expire'], 'safe'],
            [['device_price'], 'number'],
            [['device_status', 'device_type_id', 'department_id'], 'required'],
            [['device_status'], 'string'],
            [['device_type_id', 'department_id'], 'integer'],
            [['device_id', 'serial_no', 'memory', 'device_docs'], 'safe'],
            [['device_brand', 'device_model', 'device_name', 'other_detail','vender','warranty'], 'safe'],
            [['cpu', 'harddisk', 'monitor', 'device_ip'], 'safe'],
			[['file'],'file','extensions'=>'xls,xlsx'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'device_id' => 'รหัสอุปกรณ์',
            'serial_no' => 'Serial No',
            'device_brand' => 'Device Brand',
            'device_model' => 'Device Model',
            'device_name' => 'ชื่อเครื่อง',
            'memory' => 'Memory',
            'cpu' => 'Cpu',
            'harddisk' => 'Harddisk',
            'monitor' => 'Monitor',
            'other_detail' => 'หมายเหตุ',
            'device_ip' => 'เลข IP',
            'date_use' => 'วันที่รับเข้า',
            'date_expire' => 'วันที่เลิกใช้งาน',
            'device_price' => 'ราคา',
            'device_docs' => 'Device Docs',
            'device_status' => 'สถานะ',
            'device_type_id' => 'หมวดหมู่อุปกรณ์',
            'department_id' => 'หน่วยงาน',
			'vender'=>'ตัวแทนจำหน่าย/ผู้ขาย',
			'warranty'=>'การรับประกัน',
            'DeviceName'=> Yii::t('app','ชื่อเครื่อง'),
			'DeviceRepair'=> Yii::t('app','ประวัติการซ่อม'),
			'DeviceDetail'=> Yii::t('app','รายละเอียด'),
        ];
    }
    
        
    //virtual attirbute
    public function getDeviceName(){
        return $this->device_name.($this->device_status == 'disable' ? '<span class="disable">  (เลิกใช้งาน) </span>' : '');
    }

    public static function countStatus($status){
        return Device::find()->where(['device_status'=>$status])->count();
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDepartment()
    {
        return $this->hasOne(Department::className(), ['id' => 'department_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDeviceType()
    {
        return $this->hasOne(DeviceType::className(), ['id' => 'device_type_id']);
    }
}
