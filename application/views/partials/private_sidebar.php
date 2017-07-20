<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<?php
$currentUser=Globals::currentUser();
$module_array=Globals::modules();
$modules=[];
foreach($module_array as $module){
    $modules[$module['name']]=$module;
}
?>
<section class="sidebar">
    <div class="user-panel">
        <div class="pull-left image">
            <img src="<?php echo Globals::currentUser()->profile_picture ?>" class="img-circle" alt="Profile Picture">
        </div>
        <div class="pull-left info">
            <p><?php echo Globals::currentUser()->fullname ?></p>
            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
    </div>
    <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>
        <?php foreach($currentUser->modules as $module_key=>$module): ?>
        <li class="<?php echo $module_key==Globals::activeModule() ? 'active' : '' ?>">
            <a href="<?php echo base_url('/dashboard/'.$modules[$module_key]['name']) ?>">
                <i class="fa <?php echo $modules[$module_key]['icon'] ?>"></i> <span><?php echo $modules[$module_key]['title'] ?></span>
            </a>
        </li>
        <?php endforeach; ?>
    </ul>
</section>
