<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<?php $comment = $comments[0];?>
<section class="content-header">
    <h1>
        <?php echo t('Edit Comment');?>
    </h1>
    <ol class="breadcrumb">
        <li><i class="fa fa-dashboard"></i> <?php echo t('Dashboard');?></li>
        <li><i class="fa fa-dashboard active"></i> <?php echo t('Edit Comment');?></li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-xs-9">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title"><?php echo t('Edit Comment');?></h3>
                </div>
                <div class="box-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1"><?php echo t('Username');?></label>
                        <input type="text" class="form-control" id="exampleInputEmail1" placeholder="<?php echo t('Enter a Username');?>" value="<?php echo $comment->fullname; ?>">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1"><?php echo t('Email Address');?></label>
                        <input type="email" class="form-control" id="exampleInputEmail1" placeholder="<?php echo t('Enter email');?>" value="<?php echo $comment->email; ?>">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1"><?php echo t('Content');?></label>
                        <textarea class="textarea" placeholder="<?php echo t('Place some text here');?>" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"><?php echo $comment->content; ?></textarea>
                    </div>
                </div>
                <div class="box-footer">
                    <button class="btn btn-danger pull-right"><?php echo t('Remove');?></button>
                </div>
            </div>
        </div>
        <div class="col-xs-3">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title"><?php echo t('Status');?></h3>
                </div>
                <div class="box-body">
                    <label><input type="radio" value="pending"><?php echo t('Pending');?></label>
                    <label><input type="radio" value="approved"><?php echo t('Approved');?></label>
                </div>
                <div class="box-footer">
                    <button class="btn btn-default pull-left"><?php echo t('Cancel');?></button>
                    <button class="btn btn-primary pull-right"><?php echo t('Update');?></button>
                </div>
            </div>
        </div>
    </div>
</section>
