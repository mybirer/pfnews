<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<section class="content-header">
    <h1>
        <?php echo t('Edit Comment');?>
    </h1>
    <ol class="breadcrumb">
        <li><i class="fa fa-dashboard"></i> <?php echo t('Dashboard');?></li>
        <li><i class="fa fa-dashboard active></i> <?php echo t('Edit Comment');?></li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-warning">
                <div class="box-header with-border">
                    <h3 class="box-title"><?php echo t('Error');?></h3>
                </div>
                <div class="box-body">
                    <?php sprintf(t('The %s you have requested is not found'),strtolower(t('Comment')));?>!
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button type="button" class="btn btn-default"><?php echo t('Back');?></button>
                </div>
                <!-- /.box-footer-->
            </div>
        </div>
    </div>
</section>
