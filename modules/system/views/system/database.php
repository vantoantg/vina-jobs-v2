<?php

use yii\helpers\Html;
use yii\widgets\Pjax;
use yii\helpers\Url;
/* @var $this yii\web\View */
/* @var $searchModel app\models\search\System */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Systems';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="system-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php Pjax::begin(); ?>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
				<?php $form = \yii\bootstrap\ActiveForm::begin(); ?>
                <button type="submit" class="btn btn-primary" name="backup_db">Backup database</button>
				<?php \yii\bootstrap\ActiveForm::end(); ?>
            </div>
            <div class="col-lg-12">
				<?php if($files) { ?>
                    <table id="spend-management-template" class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th class="type">No.</th>
                            <th class="name">Name</th>
                            <th class="name">Size</th>
                            <th class="time">Time</th>
                            <th class="status">Download</th>
                            <th class="action">Action</th>
                        </tr>
                        </thead>
                        <tbody">
						<?php foreach($files as $k => $file){ ?>
                            <tr>
                                <td class="type"><?= $k + 1 ?></td>
                                <td class="name"><?= $file['name'] ?></td>
                                <td class="name"><?= \app\library\helper\Helper::humanFilesize($file['size']) ?></td>
                                <td class="time"><?= $file['time'] ?></td>
                                <td class="status">
                                    <a href="<?= $file['path'] ?>" download="<?= $file['name'] ?>"><span class="glyphicon glyphicon-download-alt"></span></a>
                                </td>
                                <td class="action">
                                    <a href="<?= Url::to('/admin/admin/backup-db?delete='.$file['name']) ?>" title="DELETE" data-widget="confirm-delete" data-confirm-text="Are you sure you want to delete this item?"><span class="glyphicon glyphicon-trash"></span></a>
                                </td>
                            </tr>
						<?php } ?>
                        </tbody>
                    </table>
				<?php }else{ ?>
                    <p>No database.</p>
				<?php } ?>
            </div>
        </div>
    </div>
</div>
