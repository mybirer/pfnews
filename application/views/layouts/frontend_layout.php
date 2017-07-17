<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

<!DOCTYPE html>
<html lang="tr">
    <head>
        <meta charset="utf-8">
        <title><?php echo $template['title'];?></title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/packages/bootstrap/css/bootstrap.min.css');?>">
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/packages/fontawesome/css/font-awesome.min.css');?>">
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/packages/ionicons/css/ionicons.min.css');?>">
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/packages/adminlte/css/AdminLTE.min.css');?>">
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/packages/adminlte/css/skins/_all-skins.min.css');?>">
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/backend_styles.css');?>">
        <script type="text/javascript" src="<?php echo base_url('assets/js/jquery-3.2.1.min.js');?>"></script>

        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>
        <section class="header"><?php echo $template['partials']['header']; ?></section>
        <section class="content"><?php echo $template['body'];?></section>
        <section class="footer"><?php echo $template['partials']['footer']; ?></section>
    </body>
</html>