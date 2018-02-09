<?php
namespace app\components\tona;

class Input
{

	const
		INPUT_TEXT = 'text',
		INPUT_SELECT = 'select',
		INPUT_TEXTAREA = 'textarea',
		INPUT_IMAGE = 'image',
		INPUT_EMAIL = 'email';

	public function init()
	{

	}

	/**
	 * @param $type
	 * @param string $name
	 * @param string $value
	 * @param array $options
	 * @return string
	 */
	public function getInput($type, $name = '', $value = '', $options = [])
	{
		switch ($type) {
			case 'text':
				$input = $this->text($name, $value, $options);
				break;
			case 'image':
				$input = $this->image($name, $value, $options);
				break;
			default:
				$input = '';
		}

		return $input;
	}

	/**
	 * @param string $name
	 * @param string $value
	 * @param array $options
	 * @return string
	 */
	public function image($name = '', $value = '', $options = [])
	{
		$op = '1';
		if ($options) {
			foreach ($options as $k => $v) {
				$op .= $k . '="' . $v . '" ';
			}
		}

		$t = '<div class="row">';
		$t .= '<div class="col-lg-10 no-padding-right">';
		$t .= '<input class="form-control get-img" name="' . $name . '" value="' . $value . '" ' . $op . '>';
		$t .= '</div>';
		$t .= '<div class="col-lg-2 no-padding-left">';
		$t .= '<span class="input-group-btn">';
		$t .= '<a href="#" class="btn btn-default openFinder w100 preventDefault" data-target=".get-img">Select</a>';
		$t .= '</span>';
		$t .= '</div></div>';
		return $t;
	}

	/**
	 * @param string $name
	 * @param string $val
	 * @param array $options
	 * @return string
	 */
	public function text($name = '', $val = '', $options = [])
	{
		$op = '';
		if ($options) {
			foreach ($options as $k => $v) {
				$op .= $k . '="' . $v . '" ';
			}
		}
		return '<input name="' . $name . '" value="' . $val . '" '.$op.'>';
	}
}
