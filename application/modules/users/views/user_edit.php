<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<section class="content-header">
    <h1>
        <?php echo t('Edit User');?>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo base_url('dashboard')?>"><i class="fa fa-dashboard"></i><?php echo t('Dashboard');?></a></li>
        <li><a href="<?php echo base_url('dashboard/users')?>"><i class="fa fa-users"></i> <?php echo t('Users');?></a></li>
        <li><i class="fa fa-dashboard active"></i> <?php echo t('Edit User');?></li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <?php get_message_helper()?>
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title"><?php echo t('Edit User');?></h3>
                </div>
                <?php echo form_open(current_url());?>
                <div class="box-body margin">
                    <div class="col-xs-12 col-sm-4">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="col-xs-12 margin">
                                    <img class="profile-user-img img-responsive img-circle" style="width: 75%" src="<?php echo $user['profile_picture'];?>" alt="User profile picture">
                                </div>
                                <div class="col-xs-12 form-group ">
                                    <input type="file" class="hidden-file-input" data-target="profile" id="profile_picture" name="profile_picture">
                                    <label for="profile_picture" class="btn bg-blue btn-flat btn-block margin"><i class="fa fa-upload">&nbsp;</i>  <?php echo t('Change Image');?></label>
                                    <p class="text-muted margin">Please select your image 120x120 pixel and should't exceed 2 Mb.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8">
                        <div class="form-group <?php echo has_error('fullname')?'has-error':'';?>">
                            <label class="control-label"><?php echo t('Fullname');?></label>
                            <div class="input-group col-xs-12">
                                <span class="input-group-addon" style="width: 40px;"><i class="fa fa-user"></i></span>
                                <input type="text" name="fullname" class="form-control" value="<?php echo $user['fullname'];?>" placeholder="<?php echo t('Name and Surname');?>">
                            </div>
                            <?php echo get_error('fullname');?>
                        </div>
                        <div class="form-group <?php echo has_error('email')?'has-error':'';?>">
                            <label class="control-label"><?php echo t('Email');?><span class="text-red"> *</span></label>
                            <div class="input-group col-xs-12">
                                <span class="input-group-addon" style="width: 40px;"><i class="fa fa-envelope"></i></span>
                                <input type="email" name="email" value="<?php echo $user['email'];?>" class="form-control" placeholder="<?php echo t('User Email');?>">
                            </div>
                            <?php echo get_error('email');?>
                        </div>
                        <div class="form-group <?php echo has_error('username')?'has-error':'';?>">
                            <label class="control-label"><?php echo t('Username');?><span class="text-red"> *</span></label>
                            <div class="input-group col-xs-12" >
                                <span class="input-group-addon" style="width: 40px;">@</span>
                                <input type="text" name="username" class="form-control" value="<?php echo $user['username'];?>" placeholder="<?php echo t('Username');?>">
                            </div>
                            <?php echo get_error('username');?>
                        </div>
                        <div class="form-group">
                            <label class="control-label"><?php echo t('User Type');?><span class="text-red"> *</span></label>
                            <div class="input-group col-xs-12">
                                <span class="input-group-addon"><i class="fa fa-group"></i></span>
                                <select class="form-control select2" name="user_type" style="width: 100%;">
                                    <?php foreach ($user_types as $user_type):?>
                                    <option <?php echo $user_type->pkusertype==intval($user['user_type'])?'selected':'';?> value="<?php echo $user_type->pkusertype;?>"><?php echo $user_type->title;?></option>
                                    <?php endforeach;?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <div class="checkbox pull-right">
                                    <label>
                                        <input name="enabled" <?php echo $user['enabled'] == 1?'checked':'';?> type="checkbox"><?php echo t('User Enabled');?>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-footer">
                    <a href="<?php echo base_url('/dashboard/users');?>" class="btn btn-default"><?php echo t('Cancel');?></a>
                    <button type="submit" name="save" class="btn btn-success pull-right"><?php echo t('Save');?></button>
                </div>
                <?php echo form_close();?>
            </div>
        </div>
        <div class="col-xs-12">
            <div class="box box-danger">
                <div class="box-header with-border">
                    <h3 class="box-title"><?php echo t('Change Password');?></h3>
                </div>
                <?php echo form_open(current_url());?>
                <div class="box-body margin">
                    <div class="form-group <?php echo has_error('password')?'has-error':'';?>">
                        <label class="control-label"><?php echo t('Password');?><span class="text-red"> *</span></label>
                        <div class="input-group col-xs-12" >
                            <span class="input-group-addon" style="width: 40px;"><i class="fa fa-lock"></i></span>
                            <input type="password" name="password" class="form-control" placeholder="<?php echo t('Password');?>">
                        </div>
                        <?php echo get_error('password');?>
                    </div>
                    <div class="form-group <?php echo has_error('confirm_password')?'has-error':'';?>">
                        <label class="control-label"><?php echo t('Confirm Password');?><span class="text-red"> *</span></label>
                        <div class="input-group col-xs-12" >
                            <span class="input-group-addon" style="width: 40px;"><i class="fa fa-lock"></i></span>
                            <input type="password" name="confirm_password" class="form-control" placeholder="<?php echo t('Confirm Password');?>">
                        </div>
                        <?php echo get_error('confirm_password');?>
                    </div>
                </div>
                <div class="box-footer">
                    <button type="submit" name="change" class="btn btn-danger pull-right"><?php echo t('Change');?></button>
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
