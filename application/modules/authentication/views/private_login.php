<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<div class="login-box">
    <div class="login-logo">
        <a href="../../index2.html"><b>Private</b>Login</a>
    </div>
    <div class="login-box-body">
        <?php
        if (!empty($login_error)){
        ?>
            <div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4><i class="icon fa fa-ban"></i> <?php echo t('Error');?>!</h4>
                <?php echo $login_error;?>
            </div>
        <?php
        }
        ?>
        <p class="login-box-msg"><?php echo t('Please fill the form to login');?></p>
        
        <?php echo form_open(base_url('authentication/dashboard_login'));?>
            <?php $error = form_error('email','<p class="text-danger">','</p>')?>
            <div class="form-group has-feedback <?php echo $error ? 'has-error':'';?>">
                <input type="email" class="form-control" placeholder="<?php echo t('Email');?>" name="email" value="<?php echo set_value('email')?>">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                <?php echo $error;?>
            </div>
            <?php $error = form_error('password','<p class="text-danger">','</p>')?>
            <div class="form-group has-feedback <?php echo $error ? 'has-error':'';?>">
                <input type="password" class="form-control" name="password" placeholder="<?php echo t('Password');?>">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                <?php echo $error;?>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <button type="submit" class="btn btn-primary btn-block btn-flat"><?php echo t('Sign In');?></button>
                </div>
            </div>
        <?php echo form_close();?>
        <div class="col-md-xs-12 margin text-center"><br>
            <a href="#"><?php echo t('I forgot my password');?></a><br>
            <a href="register.html" class="text-center"><?php echo t('Register a new membership');?></a>
        </div>

    </div>
</div>
