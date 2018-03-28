<?php

namespace app\models;

use Yii;

class Setting extends \app\models\base\Setting
{
	/**
	 * @inheritdoc
	 */
	public function rules()
	{
		return [
			[['name', 'code'], 'required'],
			[['sorted'], 'integer'],
			[['input'], 'string'],
			[['name'], 'string', 'max' => 255],
			[['code', 'value', 'default'], 'string', 'max' => 55],
		];
	}

	/**
	 * @inheritdoc
	 */
	public function attributeLabels()
	{
		return [
			'id' => 'ID',
			'name' => 'Name',
			'code' => 'Code',
			'value' => 'Value',
			'default' => 'Default',
			'sorted' => 'Sorted',
			'input' => 'Input',
		];
	}

	/**
	 * @return array
	 */
	public static function getSettings()
	{
		$settings = self::find()->all();
		$setting = [];
		if($settings){
			foreach ($settings as $item){
				$setting[$item->code] = $item->value ? $item->value : $item->default;
			}
		}

		return $setting;
	}
}
