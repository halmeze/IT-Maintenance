<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "employee".
 *
 * @property integer $id
 * @property string $user_fullname
 * @property string $user_position
 * @property integer $department_id
 *
 * @property Department $department
 * @property Job[] $jobs
 */
class Employee extends \yii\db\ActiveRecord
{
	
	 public $file;
	 
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'employee';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['department_id'], 'required'],
            [['department_id'], 'integer'],
            [['user_fullname'], 'string', 'max' => 45],
            [['user_position'], 'string', 'max' => 100],
            [['department_id'], 'exist', 'skipOnError' => true, 'targetClass' => Department::className(), 'targetAttribute' => ['department_id' => 'id']],
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
            'user_fullname' => 'ชื่อผู้แจ้ง',
            'user_position' => 'ตำแหน่ง',
            'department_id' => 'หน่วยงาน/แผนก',
        ];
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
    public function getJobs()
    {
        return $this->hasMany(Job::className(), ['job_employee_id' => 'id']);
    }
}
