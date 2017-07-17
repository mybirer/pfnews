<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<div class="login-box">
    <div class="login-logo">
        <a href="../../index2.html"><b>Admin</b>LTE</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">Sign in to start your session</p>
        
        <?php echo form_open('/login');?>
            <?php $error = form_error('email','<p class="text-danger">','</p>')?>
            <div class="form-group has-feedback <?php echo $error ? 'has-error':'';?>">
                <div class="input-group">
                    <input type="email" class="form-control" placeholder="Email" name="email" value="<?php echo set_value('email')?>">
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <?php echo $error;?>
            </div>
            <?php $error = form_error('password','<p class="text-danger">','</p>')?>
            <div class="form-group has-feedback <?php echo $error ? 'has-error?':'';?>">
                <div class="input-group">
                    <input type="password" class="form-control" name="password" placeholder="Password">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <?php echo $error;?>
            </div>
            <div class="row">
                <!-- /.col -->
                <div class="col-xs-12">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
                </div>
                <!-- /.col -->
            </div>
        <?php echo form_close();?>

        <!-- /.social-auth-links -->

        <a href="#">I forgot my password</a><br>
        <a href="register.html" class="text-center">Register a new membership</a>

    </div>
    <!-- /.login-box-body -->
</div>