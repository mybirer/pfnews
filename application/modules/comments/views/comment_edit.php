<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
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
        <?php echo form_open(current_url())?>
        <div class="col-xs-12 col-sm-9">
            <?php get_message_helper()?>
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title"><?php echo t('Edit Comment');?></h3>
                </div>
                <div class="box-body">
                    <div class="form-group">
                        <label><?php echo t('Username');?></label>
                        <input type="text" disabled class="form-control" placeholder="<?php echo t('Username');?>" value="<?php echo $comment['fullname']; ?>">
                    </div>
                    <div class="form-group">
                        <label><?php echo t('Email Address');?></label>
                        <input type="email" disabled class="form-control" placeholder="<?php echo t('Email');?>" value="<?php echo $comment['email']; ?>">
                    </div>
                    <div class="form-group">
                        <label><?php echo t('Content');?></label>
                        <textarea class="textarea" name="content" placeholder="<?php echo t('Place some text here');?>" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"><?php echo $comment['content']; ?></textarea>
                    </div>
                </div>
                <div class="box-footer">
                    <a href="<?php echo base_url('/dashboard/comments/delete/'.$comment['pkcomment']);?>" class="btn btn-danger pull-right"><?php echo t('Delete Comment');?></a>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-3">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title"><?php echo t('Status');?></h3>
                </div>
                <div class="box-body">
                    <select class="form-control select2" name="status" style="width: 100%;">
                        <option value="approved">Approved</option>
                        <option value="pending">Pending</option>
                        <option value="spam">Spam</option>
                    </select>
                </div>
                <div class="box-footer">
                    <a href="<?php echo base_url('/dashboard/comments');?>" class="btn btn-default pull-left"><?php echo t('Cancel');?></a>
                    <button type="submit" class="btn btn-primary pull-right"><?php echo t('Update');?></button>
                </div>
            </div>
        </div>
        <?php echo form_close();?>
        <div class="col-xs-12 col-sm-3">
            <div class="box box-warning">
                <div class="box-body">
                    <div class="attachment-block clearfix">
                        <img style="width: 100%" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJx209ylXRE-1H53_gA32oxGdpT01TDtP6zNEGsFFLreluWzutfGGz6y7MTdYQkwzZE8auie5Qdg" alt="Attachment Image">
                        <h4 ><a href="http://www.pfnews.com/">Pentagon, PKK/YPG'nin Adının Neden SDG Olarak Değiştirildiğine Cevap Veremedi</a></h4>

                        <div class="attachment-text">
                            Description about the attachment can be placed here.
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry...
                        </div>
                        <a class="btn bg-olive margin pull-right">Go to News</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
