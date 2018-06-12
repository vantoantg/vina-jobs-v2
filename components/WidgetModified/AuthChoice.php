<?php

/*
 *  Created by Tona Nguyen.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
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
            $view->registerJs("jQuery('#".$this->getId()."').authchoice({$options});");
        } else {
            \yii\authclient\widgets\AuthChoiceStyleAsset::register($view);
        }
        $this->options['id'] = $this->getId();
        echo \yii\bootstrap\Html::beginTag('div', $this->options);
    }
}
