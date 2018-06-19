<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\library\helper;

/**
 * Class ActionColumn
 */
class ActionColumn
{
    public static function changeStatus($label = 'Status')
    {
        return [
            'format' => 'raw',
            'attribute' => 'status',
            'label' => $label,
            'value' => function ($model) {
                return '<i class="zmdi zmdi-check"></i>';
            },
        ];
    }

    /**
     * @param string $template
     *
     * @return array
     */
    public static function link($template = '{update} {delete}')
    {
        $buttons = [
            'view' => function ($url, $model) {
                $html = '<a href="'.$url.'" data-placement="top" data-toggle="tooltip" title="View">
                <button class="btn btn-default btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" >
                <span class="glyphicon glyphicon-eye-open"></span></button></a>';

                return $html;
            },

            'update' => function ($url, $model) {
                $html = '<a href="'.$url.'" data-placement="top" data-toggle="tooltip" title="Edit">
                <button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" >
                <span class="glyphicon glyphicon-pencil"></span></button></a>';

                return $html;
            },

            'delete' => function ($url, $model) {
                $html = '<a href="'.$url.'" 
								data-placement="top" data-toggle="tooltip" title="Delete"
								data-confirm-del="true" 
								data-confirm-ms="Bạn có chắc là sẽ xóa mục này không?"
								>
									<button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" >
									<span class="glyphicon glyphicon-trash"></span></button></a>';

                return $html;
            },
        ];

        $htmls = [
            'class' => 'yii\grid\ActionColumn',
//            'header' => 'Actions',
//            'headerOptions' => ['style' => 'color:#337ab7'],
            'template' => $template,
            'buttons' => $buttons,
        ];

        return $htmls;
    }
}
