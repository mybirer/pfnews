<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<?php $comment = $comments[0];?>
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
        <div class="col-xs-9">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Yorumu Düzenle</h3>
                </div>
                <div class="box-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Username</label>
                        <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter a Username" value="<?php echo $comment->fullname; ?>">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" value="<?php echo $comment->email; ?>">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Content</label>
                        <textarea class="textarea" placeholder="Place some text here" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"><?php echo $comment->content; ?></textarea>
                    </div>
                </div>
                <div class="box-footer">
                    <button class="btn btn-danger pull-right">Çöp</button>
                </div>
            </div>
        </div>
        <div class="col-xs-3">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Durum</h3>
                </div>
                <div class="box-body">
                    <label><input type="radio" value="moderated">Beklemede</label>
                    <label><input type="radio" value="approved">Onaylandı</label>
                </div>
                <div class="box-footer">
                    <button class="btn btn-default pull-left">İptal</button>
                    <button class="btn btn-primary pull-right">Güncelle</button>
                </div>
            </div>
        </div>
    </div>
</section>