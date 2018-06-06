<?php
/**
 * Created by PhpStorm.
 * User: HP570
 * Date: 6/6/2018
 * Time: 12:33 PM
 */
namespace app\components\Menu;

class ActiveMenu
{
    public static function is($id){
        echo '<input type="hidden" id="setActiveTopMenu" value="'.$id.'">';
    }
}