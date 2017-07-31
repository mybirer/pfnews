<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<?php $object=$objects[0];?>
<section class="content-header">
    <h1>
        <?php echo t('Edit Subscriber');?>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo base_url('dashboard')?>"><i class="fa fa-dashboard"></i> <?php echo t('Dashboard');?></a></li>
        <li><a href="<?php echo base_url('dashboard/subscribers')?>"><i class="fa fa-heart ""></i> <?php echo t('Subscribers');?></a></li>
        <li><i class="fa fa-edit active""></i> <?php echo t('Edit Subscriber');?></li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-md-3">
            <!-- Profile Image -->
            <div class="box box-primary">
                <div class="box-body box-profile">
                    <img class="profile-user-img img-responsive img-circle" src="../../assets/img/user4-128x128.jpg" alt="User profile picture">

                    <h3 class="profile-username text-center"><?php echo $object->name;?></h3>

                    <p class="text-muted text-center"><?php echo $object->city.' , '.$object->country;?></p>

                    <ul class="list-group list-group-unbordered">
                        <li class="list-group-item">
                            <b><?php echo t('Email');?></b> <a class="pull-right"><?php echo $object->email;?></a>
                        </li>
                        <li class="list-group-item">
                            <b><?php echo t('Username');?></b> <a class="pull-right"><?php echo $object->username;?></a>
                        </li>
                        <li class="list-group-item">
                            <b><?php echo t('Last Visit');?></b> <a class="pull-right"><?php echo $object->last_visit;?></a>
                        </li>
                        <li class="list-group-item">
                            <b><?php echo t('Member Date');?></b> <a class="pull-right"><?php echo $object->created_at;?></a>
                        </li>
                        <li class="list-group-item">
                            <b><?php echo t('IP');?></b> <a class="pull-right"><?php echo $object->ip;?></a>
                        </li>
                    </ul>
                    <?php if ($object->banned == '1'):?>
                    <a href="<?php echo base_url('dashboard/subscribers/enable/'.$object->pksubscriber);?>" class="btn btn-success btn-block"><b><?php echo t('Enable');?></b></a>
                    <?php else:?>
                    <a href="<?php echo base_url('dashboard/subscribers/disable/'.$object->pksubscriber);?>" class="btn btn-danger btn-block"><b><?php echo t('Disable');?></b></a>
                    <?php endif;?>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
            <!-- /.box -->
        </div>
        <div class="col-md-9">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title"><?php echo t('Edit');?></h3>
                </div>
                <form class="form-horizontal">
                    <div class="box-body">
                        <div class="col-md-3">
                            <img class="profile-user-img img-responsive img-circle" src="../../assets/img/user4-128x128.jpg" alt="User profile picture">
                            <div class="form-group">
                                <p class="text-muted text-center"><?php echo t('Change profile image');?></p>
                                <input type="file" id="exampleInputFile">
                                <p class="help-block">Example block-level help text here.</p>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label"><?php echo t('Name');?></label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputEmail3" placeholder="<?php echo t('Name');?>" value="<?php echo $object->name;?>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label"><?php echo t('Email');?></label>
                                <div class="col-sm-10">
                                    <input type="email" class="form-control" id="inputEmail3" placeholder="<?php echo t('Email');?>" value="<?php echo $object->email;?>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label"><?php echo t('Username');?></label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputEmail3" placeholder="<?php echo t('Username');?>" value="<?php echo $object->username;?>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label"><?php echo t('Password');?></label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="inputEmail3" placeholder="<?php echo t('Password');?>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label"><?php echo t('City');?></label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputEmail3" placeholder="<?php echo t('City');?>" value="<?php echo $object->city;?>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label"><?php echo t('Country');?></label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputEmail3" placeholder="<?php echo t('Country');?>" value="<?php echo $object->country;?>">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-footer">
                        <button type="submit" class="btn btn-default"><?php echo t('Cancel');?></button>
                        <button type="submit" class="btn btn-info pull-right"><?php echo t('Save');?></button>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-12">
            <div class="box box-success">
                <div class="box-header">
                    <h3 class="box-title"><?php echo t('Comments');?></h3>
                    <div class="box-tools">
                        <div class="input-group input-group-sm" style="width: 150px;">
                            <input type="text" name="table_search" class="form-control pull-right" placeholder="<?php echo t('Search');?>">

                            <div class="input-group-btn">
                                <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-body table-responsive no-padding">
                    <table class="table table-hover">
                        <tbody><tr>
                            <th><?php echo t('ID');?></th>
                            <th><?php echo t('Location');?></th>
                            <th><?php echo t('Date');?></th>
                            <th><?php echo t('Status');?></th>
                            <th><?php echo t('Comment');?></th>
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
