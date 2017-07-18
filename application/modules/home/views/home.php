<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

<div class="container">
<div class="row">
    <h1>Welcome to Pf News Bruh!!!</h1>

    <div id="body">
        <p>If you are admin, you can <a href="<?php echo base_url('dashboard'); ?>">go</a> login page.</p>

        <p>If you are subscriber, you can <a href="<?php echo base_url('login'); ?>">go</a> login page.</p>

        <p>If you are exploring CodeIgniter for the very first time, you should start by reading the <a href="user_guide/">User Guide</a>.</p>
        <p><?php echo $this->subscriber_auth->is_logged() ? 'You are logged in at front end':'Not logged in';?></p>
    </div>

</div>
</div>
