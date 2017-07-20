<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<section class="content-header">
    <h1>
        <?php echo t('Comments');?>
    </h1>
    <ol class="breadcrumb">
        <li><i class="fa fa-dashboard"></i> <?php echo t('Dashboard');?></li>
        <li><i class="fa fa-dashboard active"></i> <?php echo t('Comments');?></li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-<?php if (!$result) echo 'danger'; else if ($affected_rows == 0) echo 'warning'; else echo 'success';?>">
                <div class="box-header with-border">
                    <h3 class="box-title"><?php if (!$result) echo t('Error'); else if ($affected_rows == 0) echo t('Warning'); else echo t('Success');?></h3>
                </div>
                <div class="box-body">
                    <?php
                        if (!$result){
                            echo t('Something went wrong').'!';
                        }else{
                            if ($affected_rows == 0)
                                echo t('This action can not be performed').'!';
                            else if ($action == 'delete' ){
                                echo sprintf(t('%s deleted successfully'),t('Comment')).'!';
                            }else if ($action == 'approved'){
                                echo t('Comment has been approved').'!';
                            }else if ($action == 'pending'){
                                echo t('Comment status has changed as pending').'!';
                            }else if ($action == 'removed'){
                                echo t('Comment has been removed').'!';
                            }
                        }
                    ?>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <a type="button" href="<?php echo base_url('/comments');?>" class="btn btn-default"><?php echo t('Back');?></a>
                </div>
                <!-- /.box-footer-->
            </div>
        </div>
    </div>
</section>
