<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

<!DOCTYPE html>
<html lang="tr">
    <head>
        <meta charset="utf-8">
        <title><?php echo $template['title'];?></title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/bootstrap.min.css');?>">

        <script type="text/javascript" src="<?php echo base_url('assets/js/jquery-3.2.1.min.js');?>"></script>

    </head>

    <body>
        <section class="header"><?php echo $template['partials']['header']; ?></section>
        <section class="content"><?php echo $template['body'];?></section>
        <section class="footer"><?php echo $template['partials']['footer']; ?></section>
    </body>
</html>