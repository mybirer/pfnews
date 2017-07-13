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
        <h2 style="margin-top:0px">Pf_logs Read</h2>
        <table class="table">
	    <tr><td>Module Name</td><td><?php echo $module_name; ?></td></tr>
	    <tr><td>Action</td><td><?php echo $action; ?></td></tr>
	    <tr><td>Description</td><td><?php echo $description; ?></td></tr>
	    <tr><td>Created At</td><td><?php echo $created_at; ?></td></tr>
	    <tr><td>Created By</td><td><?php echo $created_by; ?></td></tr>
	    <tr><td>Usertype</td><td><?php echo $usertype; ?></td></tr>
	    <tr><td>Ip</td><td><?php echo $ip; ?></td></tr>
	    <tr><td></td><td><a href="<?php echo site_url('logs') ?>" class="btn btn-default">Cancel</a></td></tr>
	</table>
        </body>
</html>