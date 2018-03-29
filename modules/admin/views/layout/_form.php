<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use \app\library\helper\Helper;
use \app\library\helper\Cons;

/* @var $this yii\web\View */
/* @var $model app\models\Pages */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="pages-form">

    <?php $form = ActiveForm::begin(); ?>

	<div id="editor" style="height: 480px" class="form-control{{ has_errors(form.tpl_data) ? ' is-invalid'}}"></div>
	<textarea id="editor_hd" class="d-none"><?= $file_content ?></textarea>

    <div class="col-sm-12">
        <div class="col-sm-12 bg-white">
			<?= Html::submitButton('Save & Edit', ['class' => 'btn btn-success', 'name' => 'save', 'value' => 'saveedit']) ?>
        </div>
    </div>
    <?php ActiveForm::end(); ?>

</div>
