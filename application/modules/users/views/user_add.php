<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<section class="content-header">
    <h1>
        <?php echo t('Add User');?>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo base_url('dashboard')?>"><i class="fa fa-dashboard"></i><?php echo t('Dashboard');?></a></li>
        <li><a href="<?php echo base_url('dashboard/users')?>"><i class="fa fa-users"></i> <?php echo t('Users');?></a></li>
        <li><i class="fa fa-dashboard active"></i> <?php echo t('Add User');?></li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <?php get_message_helper()?>
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title"><?php echo t('Create New User');?></h3>
                </div>
                <?php echo form_open(current_url());?>
                <div class="box-body margin">
                    <div class="col-sm-4 col-xs-12">
                        <div class="input-group">
                            <div class="col-xs-12 margin">
                                <img class="profile-user-img img-responsive img-circle" style="width: 75%" src="../../assets/img/user4-128x128.jpg" alt="User profile picture">
                            </div>
                            <div class="col-xs-12 form-group margin">
                                <a class="btn btn-primary btn-block"><?php echo t('Upload Image');?></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8 col-xs-12">
                        <div class="form-group">
                            <label class="control-label"><?php echo t('Fullname');?></label>
                            <div class="input-group col-xs-12">
                                <span class="input-group-addon" style="width: 40px;"><i class="fa fa-user"></i></span>
                                <input type="text" name="fullname" class="form-control" placeholder="<?php echo t('Name and Surname');?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label"><?php echo t('Email');?><span class="text-red"> *</span></label>
                            <div class="input-group col-xs-12">
                                <span class="input-group-addon" style="width: 40px;"><i class="fa fa-envelope"></i></span>
                                <input type="email" name="email" class="form-control" placeholder="<?php echo t('User Email');?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label"><?php echo t('Username');?><span class="text-red"> *</span></label>
                            <div class="input-group col-xs-12" >
                                <span class="input-group-addon" style="width: 40px;">@</span>
                                <input type="text" name="username" class="form-control" placeholder="<?php echo t('Username');?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label"><?php echo t('Password');?><span class="text-red"> *</span></label>
                            <div class="input-group col-xs-12" >
                                <span class="input-group-addon" style="width: 40px;"><i class="fa fa-lock"></i></span>
                                <input type="password" name="password" class="form-control" placeholder="<?php echo t('Password');?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label"><?php echo t('Password');?><span class="text-red"> *</span></label>
                            <div class="input-group col-xs-12" >
                                <span class="input-group-addon" style="width: 40px;"><i class="fa fa-lock"></i></span>
                                <input type="password" name="confirm_password" class="form-control" placeholder="<?php echo t('Password');?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label"><?php echo t('User Type');?><span class="text-red"> *</span></label>
                            <div class="input-group col-xs-12">
                                <span class="input-group-addon"><i class="fa fa-group"></i></span>
                                <select class="form-control select2" name="user_type" style="width: 100%;">
                                    <option selected disabled>-- <?php echo t('select user type');?> --</option>
                                    <?php foreach ($user_types as $user_type):?>
                                    <option value="<?php echo $user_type->pkusertype;?>"><?php echo $user_type->title;?></option>
                                    <?php endforeach;?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <div class="checkbox pull-right">
                                    <label>
                                        <input name="enabled" checked type="checkbox"><?php echo t('User Enabled');?>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-footer">
                    <a href="<?php echo base_url('/dashboard/users');?>" class="btn btn-default"><?php echo t('Cancel');?></a>
                    <button type="submit" class="btn btn-info pull-right"><?php echo t('Create');?></button>
                </div>
                <?php echo form_close();?>
            </div>
        </div>
    </div>
</section>
<script src="<?php echo base_url('plugins/iCheck/icheck.min.js');?>"></script>
<script src="<?php echo base_url('plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js');?>"></script>
<script type="text/javascript">
    $(function () {
        $("#content").wysihtml5();
    });
</script>
