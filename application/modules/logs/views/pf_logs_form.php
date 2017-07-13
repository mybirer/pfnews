<!doctype html>
<html>
    <head>
        <title>harviacode.com - codeigniter crud generator</title>
        <link rel="stylesheet" href="<?php echo base_url('assets/bootstrap/css/bootstrap.min.css') ?>"/>
        <style>
            body{
                padding: 15px;
            }
        </style>
    </head>
    <body>
        <h2 style="margin-top:0px">Pf_logs <?php echo $button ?></h2>
        <form action="<?php echo $action; ?>" method="post">
	    <div class="form-group">
            <label for="varchar">Module Name <?php echo form_error('module_name') ?></label>
            <input type="text" class="form-control" name="module_name" id="module_name" placeholder="Module Name" value="<?php echo $module_name; ?>" />
        </div>
	    <div class="form-group">
            <label for="varchar">Action <?php echo form_error('action') ?></label>
            <input type="text" class="form-control" name="action" id="action" placeholder="Action" value="<?php echo $action; ?>" />
        </div>
	    <div class="form-group">
            <label for="varchar">Description <?php echo form_error('description') ?></label>
            <input type="text" class="form-control" name="description" id="description" placeholder="Description" value="<?php echo $description; ?>" />
        </div>
	    <div class="form-group">
            <label for="timestamp">Created At <?php echo form_error('created_at') ?></label>
            <input type="text" class="form-control" name="created_at" id="created_at" placeholder="Created At" value="<?php echo $created_at; ?>" />
        </div>
	    <div class="form-group">
            <label for="int">Created By <?php echo form_error('created_by') ?></label>
            <input type="text" class="form-control" name="created_by" id="created_by" placeholder="Created By" value="<?php echo $created_by; ?>" />
        </div>
	    <div class="form-group">
            <label for="int">Usertype <?php echo form_error('usertype') ?></label>
            <input type="text" class="form-control" name="usertype" id="usertype" placeholder="Usertype" value="<?php echo $usertype; ?>" />
        </div>
	    <div class="form-group">
            <label for="varchar">Ip <?php echo form_error('ip') ?></label>
            <input type="text" class="form-control" name="ip" id="ip" placeholder="Ip" value="<?php echo $ip; ?>" />
        </div>
	    <input type="hidden" name="pklog" value="<?php echo $pklog; ?>" /> 
	    <button type="submit" class="btn btn-primary"><?php echo $button ?></button> 
	    <a href="<?php echo site_url('logs') ?>" class="btn btn-default">Cancel</a>
	</form>
    </body>
</html>