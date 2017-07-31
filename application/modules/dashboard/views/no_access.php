<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<section class="content-header">
    <h1>
        <?php echo t('Acces Denied');?>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo base_url('dashboard')?>"><i class="fa fa-dashboard"></i><?php echo t('Dashboard');?></a></li>
        <li><i class="fa fa-minus-circle active"></i> <?php echo t('Access Denied');?></li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <?php get_message_helper()?>
            <div class="box box-danger">
                <div class="box-header with-border">
                    <h3 class="box-title"><?php echo t('Error');?></h3>
                </div>
                <div class="box-body">
                    <p><?php echo t('You dont have permition to display this page.<br>To get permission please contact with your Administrator');?></p>
                </div>
                <div class="box-footer">
                    <button type="button" class="btn btn-default"><?php echo t('Back');?></button>
                </div>
            </div>
        </div>
    </div>
</section>
