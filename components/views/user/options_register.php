<?php


?>

<div class="modal fade" id="register-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
     style="display: none;">
	<!--<div class="vertical-alignment-helper">
    <div class="modal-dialog vertical-align-center">-->
    <div class="">
    <div class="modal-dialog">

        <div class="modal-content loginmodal-container switch-register">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close" title="Đóng lại">
                <span aria-hidden="true">&times;</span>
            </button>
            <div class="clearfix"></div>
            <ul class="ds-btn">
                <li>
                    <a class="btn btn-lg btn-primary" href="<?= $candidate; ?>">
                        <i class="far fa-address-card pull-left"></i><span>Cá nhân<br><small>Người tìm việc</small></span></a>

                </li>
                <li>
                    <a class="btn btn-lg btn-success " href="<?= $company; ?>">
                        <i class="far fa-building pull-left"></i><span>Công ty<br><small>Nhà tuyển dụng</small></span></a>

                </li>
            </ul>
        </div>
    </div>
    </div>
</div>
