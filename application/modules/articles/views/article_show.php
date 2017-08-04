<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<section class="content-header">
    <ol class="breadcrumb">
        <li><i class="fa fa-dashboard"></i> <?php echo t('Dashboard');?></li>
        <li><i class="fa fa-dashboard active"></i> <?php echo t('Article')?></li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <h1><?php echo $object['title'];?></h1>
            <p><?php echo $object['summary'];?></p>
            <div class="page">
                <?php echo $object['content'];?>
            </div>
        </div>
        <?php if ($object['allow_comments']):?>
        <div class="col-xs-12">
            <?php get_message_helper()?>
            <div class="box box-primary">
                <div class="box-header">
                    <h2 class="box-title">Comments • <?php echo $comments_count;?></h2>
                </div>
                <div class="box-body">
                    <?php echo form_open(current_url());?>
                        <div class="col-xs-12 margin-bottom">
                            <label><?php echo t('Email');?></label>
                            <input type="email" class="form-control" name="email" placeholder="<?php echo t('Your email will not display public');?>">
                        </div>
                        <div class="col-xs-12 margin-bottom">
                            <label><?php echo t('Comment');?></label>
                            <textarea type="text" name="content" class="form-control input-sm" placeholder="Press enter to post comment"></textarea>
                        </div>
                        <div class="col-xs-12">
                            <button type="submit" name="send_comment" class="btn btn-primary pull-right"><?php echo t('Send');?></button>
                        </div>
                    <?php echo form_close();?>
                </div>
                <hr style="margin-top: 10px;margin-bottom: 10px;">
                <div class="box-body">
                    <?php echo $comments_count==0?t('Henüz bu sayfaya hiç yorum yapılmamış'):'';?>
                    <?php foreach($comments as $comment): ?>
                        <div class="post" data-comment-id="<?php echo $comment->pkcomment; ?>">
                            <div class="user-block">
                                <img class="img-circle img-bordered-sm" src="<?php echo base_url('assets/img/user1-128x128.jpg');?>" alt="user image">
                                <span class="username">
                                <a href="#"><?php echo $comment->fullname; ?></a>
                                </span>
                                <span class="description"><?php echo $comment->created_at; ?></span>
                            </div>
                            <p>
                                <?php echo $comment->content; ?>
                            </p>
                            <ul class="list-inline">
                                <li class="pull-right"><a href="#" class="link-black text-sm"><i class="fa fa-thumbs-o-up margin-r-5"></i> <?php echo t('Like');?></a>
                                </li>
                            </ul>
                        </div>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>
        <?php endif;?>
    </div>
</section>
