<?php
namespace app\components\tona;

class Dropdown
{
    public function init(){

    }
    
    public static function netWork(){
        return [
            1 => [
                'id'  => 1,
                'name'  => 'Facebook',
                'link'  => 'facebook.com'
            ],
            2 => [
                'id'  => 2,
                'name'  => 'Twitter',
                'link'  => 'twitter.com'
            ],
            3 => [
                'id'  => 3,
                'name'  => 'Linkedin',
                'link'  => 'linkedin.com'
            ],
            4 => [
                'id'  => 4,
                'name'  => 'MySpace',
                'link'  => 'myspace.com'
            ],
            5 => [
                'id'  => 5,
                'name'  => 'Google Plus',
                'link'  => 'plus.google.com'
            ],
            6 => [
                'id'  => 6,
                'name'  => 'DevianArt',
                'link'  => 'deviantart.com'
            ]
        ];
    }
}
