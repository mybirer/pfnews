<div class="register-box">
    <div class="register-logo">
        <a href="../../index2.html"><b>Admin</b>LTE</a>
    </div>
    <?php get_message_helper()?>
    <div class="register-box-body">
        <p class="login-box-msg">Register a new membership</p>

        <?php echo form_open(current_url());?>
            <div class="form-group has-feedback <?php echo has_error('fullname')?'has-error':'';?>">
                <input type="text" name="fullname" class="form-control" placeholder="<?php echo t('Full Name');?>">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
                <?php echo get_error('fullname');?>
            </div>
            <div class="form-group has-feedback <?php echo has_error('email')?'has-error':'';?>">
                <input type="email" name="email" class="form-control" placeholder="<?php echo t('Email');?>">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                <?php echo get_error('email');?>
            </div>
            <div class="form-group has-feedback <?php echo has_error('password')?'has-error':'';?>">
                <input type="password" name="password" class="form-control" placeholder="<?php echo t('Password');?>">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                <?php echo get_error('password');?>
            </div>
            <div class="form-group has-feedback <?php echo has_error('confirm_password')?'has-error':'';?>">
                <input type="password" name="confirm_password" class="form-control" placeholder="<?php echo t('Confirm Password');?>">
                <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
                <?php echo get_error('confirm_password');?>
            </div>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <div class="form-group has-feedback <?php echo has_error('terms')?'has-error':'';?>">
                                <input name="terms" type="checkbox"> <?php echo t('I agree to the');?> <a href="#"><?php echo t('terms');?></a>
                                <?php echo get_error('terms');?>
                            </div>
                        </label>
                    </div>
                </div>
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat"><?php echo t('Register');?></button>
                </div>
            </div>
        <?php echo form_close()?>

        <div class="social-auth-links text-center">
            <p>- <?php echo t('OR');?> -</p>
            <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> <?php echo t('Sign up using
                Facebook');?></a>
            <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> <?php echo t('Sign up using
                Google+');?></a>
        </div>

        <a href="<?php echo base_url('/login');?>" class="text-center">I already have a membership</a>
    </div>
</div>
