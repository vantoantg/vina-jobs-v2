<?php
/**
 * Created by Tona Nguyễn
 * Date: 1/29/2018
 * Time: 5:32 PM
 */

namespace app\models;
use app\library\helper\Cons;
use app\library\helper\Helper;
use Yii;

class Company extends \app\models\base\Company
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'content'], 'required'],
            [['location_id', 'created_by', 'status', 'arranged'], 'integer'],
            [['content'], 'string'],
            [['created_at'], 'safe'],
	        [['website'],'url', 'defaultScheme' => ''],
            [['logo'], 'file', 'extensions' => 'gif, jpg, png, jpeg',],
            [['name', 'logo'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'location_id' => 'Location ID',
            'name' => 'Tên công ty',
            'logo' => 'Logo',
            'content' => 'Giới thiệu về công ty',
            'created_by' => 'Created By',
            'created_at' => 'Created At',
            'status' => 'Status',
            'arranged' => 'Arranged',
        ];
    }

	public function beforeSave($insert) {

		if (parent::beforeSave($insert)) {
			if ($this->isNewRecord) {

			}
			return true;
		}
		return false;
	}

	public function getCompany($company){
    	$company = self::findOne($company);

    	return $company;
	}

    /**
     * @param $company_id
     * @return array
     */
	public function gallery($company_id){
        $imgs = [];
        $files = FileUploads::instance()->getListByObjects(FileUploads::COM_GALLERY, $company_id);
        if($files){
            foreach ($files as $file){
                $imgs[] =  [
                	'id' => $file['id'],
                	'img' => Helper::imgRender(Helper::params('companyCompanyGallery').$file['file_path'], 150,120)];
            }
        }

        return $imgs;
    }

	/**
	 * @param $logo
	 * @param int $w
	 * @param int $h
	 * @return mixed|string
	 */
    public static function getLogo($logo, $w = 200, $h = 200){
	    if ($logo) {
	        $path = Yii::$app->homeUrl.Helper::params('companyLogoPath') . $logo;
	        if(file_exists($path)){
                return $path;
            }
	    	return Cons::getNoImg();
//		    return Helper::imgRender(Helper::params('companyLogoPath') . $logo, $w, $h);
	    } else {
		    return Helper::imgRender(false);
	    }
    }
}