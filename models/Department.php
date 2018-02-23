<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "department".
 *
 * @property integer $id
 * @property string $department_name
 *
 * @property Device[] $devices
 * @property User[] $users
 */
class Department extends \yii\db\ActiveRecord
{

	public $file;
    
	/**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'department';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['department_name'], 'string', 'max' => 255],
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
            'department_name' => 'ชื่อหน่วยงาน',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDevices()
    {
        return $this->hasMany(Device::className(), ['department_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsers()
    {
        return $this->hasMany(User::className(), ['department_id' => 'id']);
    }
}
