<?php
/**
 * Created by PhpStorm.
 * User: HP570
 * Date: 6/5/2018
 * Time: 11:08 AM
 */
namespace app\components;

use yii\helpers\Json;

class AuthChoice extends \yii\authclient\widgets\AuthChoice
{
    /**
     * Initializes the widget.
     */
    public function init()
    {
        $view = \Yii::$app->getView();
        if ($this->popupMode) {
            AuthChoiceAsset::register($view);
            if (empty($this->clientOptions)) {
                $options = '';
            } else {
                $options = Json::htmlEncode($this->clientOptions);
            }
            $view->registerJs("jQuery('#" . $this->getId() . "').authchoice({$options});");
        } else {
            \yii\authclient\widgets\AuthChoiceStyleAsset::register($view);
        }
        $this->options['id'] = $this->getId();
        echo \yii\bootstrap\Html::beginTag('div', $this->options);
    }
}
