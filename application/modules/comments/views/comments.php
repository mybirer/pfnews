<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<section class="content-header">
    <h1>
        Aboneler
    </h1>
    <ol class="breadcrumb">
        <li><i class="fa fa-dashboard"></i> Ana Panel</li>
        <li><i class="fa fa-dashboard active"></i> Aboneler</li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Yorumlar</h3>
                </div>
                <div class="box-body">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li <?php if ($status == 'all') echo 'class="active"';?>><a href="<?php if ($status != 'all') echo '/comments/?status=all';?>">Tümü (<?php echo $all_count;?>)</a></li>
                            <li <?php if ($status == 'moderated') echo 'class="active" style="border-top-color: #f39c12" ';?>><a href="<?php if ($status != 'moderated') echo '/comments/?status=moderated';?>">Onay Bekleyenler (<?php echo $moderated_count;?>)</a></li>
                            <li <?php if ($status == 'approved') echo 'class="active" style="border-top-color: #00a65a" ';?>><a href="<?php if ($status != 'approved') echo '/comments/?status=approved';?>">Onaylananlar (<?php echo $approved_count;?>)</a></li>
                            <li <?php if ($status == 'trash') echo 'class="active" style="border-top-color: #dd4b39" ';?>><a href="<?php if ($status != 'trash') echo '/comments/?status=trash';?>">Çöp (<?php echo $trash_count;?>)</a></li>
                        </ul>
                        <div id="comments" class="margin">
                            <?php foreach ($comments as $comment){?>
                                <div class="post">
                                    <div class="user-block">
                                        <img class="img-circle img-bordered-sm" src="../../assets/img/user1-128x128.jpg" alt="user image">
                                        <span class="username">
                                            <a href="#"><?php echo $comment->fullname;?></a>
                                            <div class="pull-right btn-box-tool" style="position: relative;">
                                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">İşlem
                                                    <span class="fa fa-caret-down"></span></button>
                                                <ul class="dropdown-menu">
                                                    <li><a href="edit/<?php echo $comment->pkcomment;?>">Düzenle</a></li>
                                                    <li><a href="action/approved/<?php echo $comment->pkcomment;?>">Onayla</a></li>
                                                    <li><a href="action/moderated/<?php echo $comment->pkcomment;?>">Beklet</a></li>
                                                    <li><a href="action/trash/<?php echo $comment->pkcomment;?>">Çöp</a></li>
                                                    <li class="divider"></li>
                                                    <li><a href="action/delete/<?php echo $comment->pkcomment;?>">Sil</a></li>
                                                </ul>
                                            </div>
                                        </span>
                                        <span class="description"><?php echo $comment->created_at;?></span>
                                    </div>
                                    <!-- /.user-block -->
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
                            <?php }?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>