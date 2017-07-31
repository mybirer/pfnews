<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>


<script type="text/javascript" src="<?php echo base_url('assets/js/jquery-2.2.3.min.js');?>"></script>
<script type="text/javascript" src="<?php echo base_url('assets/js/bootstrap.min.js');?>"></script>
<script type="text/javascript" src="<?php echo base_url('plugins/iCheck/icheck.min.js');?>"></script>

<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
