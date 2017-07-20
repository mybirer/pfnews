<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

<div class="pull-right hidden-xs">
    <b>Version</b> 2.3.8
</div>
<strong>Copyright &copy; 2014-2016 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights
reserved.

<script type="text/javascript" src="<?php echo base_url('assets/packages/jquery-ui/jquery-ui.min.js');?>"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script type="text/javascript" src="<?php echo base_url('assets/packages/bootstrap/js/tether.min.js');?>"></script>
<script type="text/javascript" src="<?php echo base_url('assets/packages/bootstrap/js/bootstrap.min.js');?>"></script>
<script type="text/javascript" src="<?php echo base_url('assets/packages/adminlte/js/app.min.js');?>"></script>
<script type="text/javascript" src="<?php echo base_url('assets/js/backend.js');?>"></script>