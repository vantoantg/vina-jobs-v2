<?php
/**
 * Created by Tona Nguyễn
 * Date: 3/28/2018
 * Time: 11:35 AM
 */

namespace app\library\helper;

/**
 * Class ActionColumn
 * @package app\library\helper
 */
class ActionColumn
{
	public static function changeStatus($label = 'Status'){
		return [
			'format' => 'raw',
			'attribute' => 'status',
			'label' => $label,
			'value' => function($model) {
				return '<i class="zmdi zmdi-check"></i>';
			},
		];
	}
	/**
     * @param string $template
     * @return array
     */
    public static function link($template = '{update} {delete}')
    {

        $buttons = [
            'view' => function ($url, $model) {
                $html = '<a href="' . $url . '" data-placement="top" data-toggle="tooltip" title="View">
                <button class="btn btn-default btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" >
                <span class="glyphicon glyphicon-eye-open"></span></button></a>';
                return $html;
            },

            'update' => function ($url, $model) {
                $html = '<a href="' . $url . '" data-placement="top" data-toggle="tooltip" title="Edit">
                <button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" >
                <span class="glyphicon glyphicon-pencil"></span></button></a>';
                return $html;
            },

            'delete' => function ($url, $model) {
                $html = '<a href="' . $url . '" 
								data-placement="top" data-toggle="tooltip" title="Delete"
								data-confirm-del="true" 
								data-confirm-ms="Bạn có chắc là sẽ xóa mục này không?"
								>
									<button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" >
									<span class="glyphicon glyphicon-trash"></span></button></a>';
                return $html;
            }

        ];

        $htmls = [
            'class' => 'yii\grid\ActionColumn',
//            'header' => 'Actions',
//            'headerOptions' => ['style' => 'color:#337ab7'],
            'template' => $template,
            'buttons' => $buttons
        ];

        return $htmls;
    }
}