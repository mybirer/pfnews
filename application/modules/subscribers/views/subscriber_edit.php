<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<?php $subscriber=$subscribers[0];?>
<section class="content-header">
    <h1>
        Abone Bilgileri
    </h1>
    <ol class="breadcrumb">
        <li><i class="fa fa-dashboard"></i> Ana Panel</li>
        <li><i class="fa fa-dashboard"></i> Aboneler</li>
        <li><i class="fa fa-dashboard active"></i> Abone Bilgileri</li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-md-3">
            <!-- Profile Image -->
            <div class="box box-primary">
                <div class="box-body box-profile">
                    <img class="profile-user-img img-responsive img-circle" src="../../assets/img/user4-128x128.jpg" alt="User profile picture">

                    <h3 class="profile-username text-center"><?php echo $subscriber->name;?></h3>

                    <p class="text-muted text-center"><?php echo $subscriber->city.' , '.$subscriber->country;?></p>

                    <ul class="list-group list-group-unbordered">
                        <li class="list-group-item">
                            <b>Email</b> <a class="pull-right"><?php echo $subscriber->email;?></a>
                        </li>
                        <li class="list-group-item">
                            <b>Username</b> <a class="pull-right"><?php echo $subscriber->username;?></a>
                        </li>
                        <li class="list-group-item">
                            <b>Last Visit</b> <a class="pull-right"><?php echo $subscriber->last_visit;?></a>
                        </li>
                        <li class="list-group-item">
                            <b>Member Date</b> <a class="pull-right"><?php echo $subscriber->created_at;?></a>
                        </li>
                        <li class="list-group-item">
                            <b>IP</b> <a class="pull-right"><?php echo $subscriber->ip;?></a>
                        </li>
                    </ul>

                    <a href="#" class="btn btn-danger btn-block" data-toggle="modal" data-target="#modal_ban"><b>Engelle</b></a>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
            <!-- /.box -->
        </div>
        <div class="col-md-9">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Düzenle</h3>
                </div>
                <form class="form-horizontal">
                    <div class="box-body">
                        <div class="col-md-3">
                            <img class="profile-user-img img-responsive img-circle" src="../../assets/img/user4-128x128.jpg" alt="User profile picture">
                            <div class="form-group">
                                <p class="text-muted text-center">Change profile image</p>
                                <input type="file" id="exampleInputFile">
                                <p class="help-block">Example block-level help text here.</p>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label">Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputEmail3" placeholder="Name" value="<?php echo $subscriber->name;?>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                                <div class="col-sm-10">
                                    <input type="email" class="form-control" id="inputEmail3" placeholder="Email" value="<?php echo $subscriber->email;?>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label">Username</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputEmail3" placeholder="Username" value="<?php echo $subscriber->username;?>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label">Password</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="inputEmail3" placeholder="Password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label">City</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputEmail3" placeholder="City" value="<?php echo $subscriber->city;?>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label">Country</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputEmail3" placeholder="Country" value="<?php echo $subscriber->country;?>">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-footer">
                        <button type="submit" class="btn btn-default">İptal</button>
                        <button type="submit" class="btn btn-info pull-right">Kaydet</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-12">
            <div class="box box-success">
                <div class="box-header">
                    <h3 class="box-title">Yorumlar</h3>
                    <div class="box-tools">
                        <div class="input-group input-group-sm" style="width: 150px;">
                            <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                            <div class="input-group-btn">
                                <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-body table-responsive no-padding">
                    <table class="table table-hover">
                        <tbody><tr>
                            <th>ID</th>
                            <th>Konum</th>
                            <th>Tarih</th>
                            <th>Durum</th>
                            <th>Yorum</th>
                        </tr>
                        <tr>
                            <td>183</td>
                            <td>Başbakan Binali Yıldırım ..</td>
                            <td>11-7-2014</td>
                            <td><span class="label label-success">Onay</span></td>
                            <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                        </tr>
                        <tr>
                            <td>219</td>
                            <td>Cumhurbaşkanı Recep Tayyip Erdoğan ve Başdanışmanı</td>
                            <td>11-7-2014</td>
                            <td><span class="label label-warning">Beklemede</span></td>
                            <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                        </tr>
                        <tr>
                            <td>657</td>
                            <td>Denize Düştü Yılana Sarıldı!</td>
                            <td>11-7-2014</td>
                            <td><span class="label label-success">Onay</span></td>
                            <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                        </tr>
                        <tr>
                            <td>175</td>
                            <td>Gaziantep Baklavası Rekor Kırdı</td>
                            <td>11-7-2014</td>
                            <td><span class="label label-danger">Çöp</span></td>
                            <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                        </tr>
                        </tbody></table>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="modal fade" id="modal_ban" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Engelle</h4>
            </div>
            <div class="modal-body">
                <p>Bu kullanıcıyı engellemek istediğinizden emin misiniz?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">İptal</button>
                <button type="button" class="btn btn-danger">Engelle</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->