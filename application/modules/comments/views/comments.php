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
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title"><?php echo t('Comments');?></h3>
                </div>
                <div class="box-body">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li <?php if ($status == 'pending') echo 'class="active" style="border-top-color: #f39c12" ';?>><a href="<?php if ($status != 'pending') echo '/comments/?status=pending';?>"><?php echo t('Pending Comments').' ('.$pending_count.')';?></a></li>
                            <li <?php if ($status == 'approved') echo 'class="active" style="border-top-color: #00a65a" ';?>><a href="<?php if ($status != 'approved') echo '/comments/?status=approved';?>"><?php echo t('Approved Comments').' ('.$approved_count.')';?></a></li>
                            <li <?php if ($status == 'removed') echo 'class="active" style="border-top-color: #dd4b39" ';?>><a href="<?php if ($status != 'removed') echo '/comments/?status=removed';?>"><?php echo t('Removed Comments').' ('.$removed_count.')';?></a></li>
                        </ul>
                        <div id="comments" class="margin">
                            <?php foreach ($comments as $comment){?>
                                <?php
                                    $cstatus = $comment->status;
                                    $clr = '';
                                    if ($cstatus == comments_model::$REMOVED)
                                        $clr = '#dd4b39';
                                    elseif ($cstatus == comments_model::$PENDING)
                                        $clr = '#f39c12';
                                    elseif ($cstatus == comments_model::$APPROVED)
                                        $clr = '#00a65a';
                                ?>
                                <div class="callout" style="border-color: <?php echo $clr;?>">
                                    <div class="post">
                                        <div class="user-block">
                                            <img class="img-circle img-bordered-sm" src="../../assets/img/user1-128x128.jpg" alt="user image">
                                            <span class="username">
                                            <a href="#"><?php echo $comment->fullname;?></a>
                                            <div class="pull-right btn-box-tool" style="position: relative;">
                                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><?php echo t('Action');?>
                                                    <span class="fa fa-caret-down"></span></button>
                                                <ul class="dropdown-menu">
                                                    <li><a href="edit/<?php echo $comment->pkcomment;?>" style="text-decoration: none;"><?php echo t('Edit');?></a></li>
                                                    <li><a href="action/approved/<?php echo $comment->pkcomment;?>" style="text-decoration: none;"><?php echo t('Approve');?></a></li>
                                                    <li><a href="action/pending/<?php echo $comment->pkcomment;?>" style="text-decoration: none;"><?php echo t('Set Pending');?></a></li>
                                                    <li><a href="action/removed/<?php echo $comment->pkcomment;?>" style="text-decoration: none;"><?php echo t('Send Trash');?></a></li>
                                                    <li class="divider"></li>
                                                    <li><a href="action/delete/<?php echo $comment->pkcomment;?>" style="text-decoration: none;"><?php echo t('Delete');?></a></li>
                                                </ul>
                                            </div>
                                        </span>
                                            <span class="description"><?php echo $comment->created_at;?></span>
                                        </div>
                                        <p>
                                            <?php echo $comment->content;?>
                                        </p>
                                        <ul class="list-inline">
                                            <li class="pull-right">
                                                <a href="#" class="link-black text-sm"><i class="fa fa-comments-o margin-r-5"></i> Comments (5)</a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            <?php }?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
