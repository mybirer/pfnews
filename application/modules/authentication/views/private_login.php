<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<div class="login-box">
    <div class="login-logo">
        <a href="../../index2.html"><b>Private</b>Login</a>
    </div>
    <div class="login-box-body">
        <?php get_message_helper()?>
        <p class="login-box-msg"><?php echo t('Please fill the form to login');?></p>
        
        <?php echo form_open(base_url('authentication/dashboard_login'));?>
            <div class="form-group has-feedback <?php echo has_error('email') ? 'has-error':'';?>">
                <input type="email" class="form-control" placeholder="<?php echo t('Email');?>" name="email" value="<?php echo set_value('email')?>">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                <?php echo get_error('email');?>
            </div>
            <div class="form-group has-feedback <?php echo has_error('password') ? 'has-error':'';?>">
                <input type="password" class="form-control" name="password" placeholder="<?php echo t('Password');?>">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                <?php echo get_error('password');?>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <button type="submit" class="btn btn-primary btn-block btn-flat"><?php echo t('Sign In');?></button>
                </div>
            </div>
        <?php echo form_close();?>
        <div class="col-md-xs-12 margin text-center"><br>
            <a href="#"><?php echo t('I forgot my password');?></a><br>
        </div>

    </div>
</div>
