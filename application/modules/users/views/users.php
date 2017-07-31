<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<section class="content-header">
    <h1>
        <?php echo t('Users');?>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo base_url('dashboard')?>"><i class="fa fa-dashboard"></i><?php echo t('Dashboard');?></a></li>
        <li><i class="fa fa-users active"></i> <?php echo t('Users');?></li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <?php get_message_helper();?>
            <div class="box box-primary">
                <div class="box-header">
                    <div class="box-toolbox">
                        <a href="<?php echo base_url('dashboard/users/add') ?>" class="btn btn-success pull-right">
                            <i class="fa fa-plus"></i> <?php echo t('Add User');?>
                        </a>
                        <form id="filters" method="get" action="">
                            <div class="form-group pull-left">
                                <div style="position: relative;">
                                    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><?php echo t('Action');?><span class="fa fa-caret-down"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a data-toggle="action-checkboxes" href="#" data-target=".obj-checkbox" data-action="/users/enable" style="text-decoration: none;"><?php echo t('Set Enabled');?></a></li>
                                        <li ><a data-toggle="action-checkboxes" href="#" data-target=".obj-checkbox" data-action="/users/disable" style="text-decoration: none;"><?php echo t('Set Disabled');?></a></li>
                                        <li class="divider"></li>
                                        <li><a data-toggle="action-checkboxes" href="#" data-target=".obj-checkbox" data-action="/users/delete" style="text-decoration: none;"><?php echo t('Delete');?></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="form-group pull-left">
                                <div class="input-group input-group-sm search-form">
                                    <input type="text" name="search_term" class="form-control pull-right" placeholder="<?php echo t('Search');?>..." <?php echo !empty(get_url_variable_value("search_term")) ? "value='".htmlspecialchars(urldecode(get_url_variable_value("search_term")))."'" : ""; ?> />
                                    <div class="input-group-btn">
                                        <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group pull-left">
                                <input type="hidden" name="is_detailed" value="<?php echo isset($_GET['is_detailed']) && $_GET['is_detailed']==1 ? 1 : 0 ?>" />
                                <a href="#" id="detailed-filter-btn" class="btn btn-sm btn-info"><?php echo t('Detailed Filter');?></a>
                            </div>
                            <div class="form-group pull-left">
                                <a href="<?php echo base_url('dashboard/users') ?>" class="btn btn-sm btn-warning"><?php echo t('Reset');?></a>
                            </div>
                            <div class="filter-panel" style="<?php echo isset($_GET['is_detailed']) && $_GET['is_detailed']==1 ? "display:block" : "display:none" ?>">
                                <hr style="display:block;clear:both;" />
                                <div class="form-group pull-left">
                                    <label><?php echo t('User Type');?>:</label>
                                    <select class="form-control" name="f_key[user_type]"  style="max-width:200px">
                                        <option value="">-<?php echo t('Filter by user type');?>-</option>
                                        <?php foreach($user_types as $item): ?>
                                        <option value="<?php echo $item->pkusertype ?>" <?php echo is_filter_opt_selected('user_type', $item->pkusertype) ?>><?php echo $item->title ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="form-group pull-left">
                                    <label><?php echo t('Enabled');?>:</label>
                                    <select class="form-control" name="f_key[enabled]"  style="max-width:200px">
                                        <option value="">-<?php echo t('Filter by enabled');?>-</option>
                                        <option value="1" <?php echo is_filter_opt_selected('enabled','1') ?>><?php echo t('True');?></option>
                                        <option value="0" <?php echo is_filter_opt_selected('enabled','0') ?>><?php echo t('False');?></option>
                                    </select>
                                </div>
                                <div class="form-group pull-left">
                                    <label class="clr">&nbsp;</label>
                                    <button type="submit" class="btn btn-sm btn-primary"><?php echo t('Filter');?></button>
                                </div>
                                <hr style="display:block;clear:both;" />
                            </div>
                        </form>
                    </div>
                </div>
                <div class="box-body table-responsive no-padding">
                    <table class="table table-hover table-bordered" >
                        <thead >
                            <tr>
                                <th class="text-center"><a href="#" data-toggle="toggle-checkboxs" data-target=".obj-checkbox">#</a></th>
                                <th><a href="#" class="live-label <?php is_ordered('fullname'); ?>" data-toggle="change-order" data-order-by="fullname"><?php echo t('Fullname');?></a></th>
                                <th><a href="#" class="live-label <?php is_ordered('username'); ?>" data-toggle="change-order" data-order-by="username"><?php echo t('Username');?></a></th>
                                <th><a href="#" class="live-label <?php is_ordered('email'); ?>" data-toggle="change-order" data-order-by="email"><?php echo t('Email');?></a></th>
                                <th><?php echo t('Enabled');?></th>
                                <th><?php echo t('User Type');?></th>
                                <th><a href="#" class="live-label <?php is_ordered('last_visit'); ?>" data-toggle="change-order" data-order-by="last_visit"><?php echo t('Last Visit');?></a></th>
                                <th><?php echo t('Actions');?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($objects as $obj): ?>
                                <tr>
                                    <td class="text-center"><label><input type="checkbox" class="minimal obj-checkbox" name="check_list[]" id="<?php echo $obj->pkuser;?>"/></label></td>
                                    <td><?php echo !empty($obj->profile_picture) ? '<img class="img-circle img-sm" src="'.$obj->profile_picture.'">' : '';?> <?php echo $obj->fullname;?></td>
                                    <td><?php echo $obj->username;?></td>
                                    <td><?php echo $obj->email;?></td>
                                    <td><?php echo $obj->enabled ? '<span class="label label-xs label-primary">true</span>' : '<span class="label label-xs bg-gray">false</span>';?></td>
                                    <td><?php echo $obj->user_type_str;?></td>
                                    <td><?php echo $obj->last_visit;?></td>
                                    <td>
                                        <a data-toggle="tooltip" title="<?php echo t('Edit');?>" class="text-red" href="<?php echo base_url('dashboard/users/edit/'.$obj->pkuser) ?>"><i class="fa fa-edit"></i></a>
                                        <a data-toggle="tooltip" title="<?php echo t('Delete');?>" class="text-red delete-link" href="<?php echo base_url('dashboard/users/delete/'.$obj->pkuser) ?>"><i class="fa fa-close"></i></a>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
                <div class="box-footer">
                    <div class="center-block">
                        <div class="table-length dataTables_length pull-left">
                            <label><?php echo t('Show');?>
                                <select name="limit" class="input-sm">
                                    <option value="10" <?php echo get_url_variable_value("limit")=="10" ? "selected" : ""; ?>>10</option>
                                    <option value="25" <?php echo get_url_variable_value("limit")=="25" ? "selected" : ""; ?>>25</option>
                                    <option value="50" <?php echo get_url_variable_value("limit")=="50" ? "selected" : ""; ?>>50</option>
                                    <option value="100" <?php echo get_url_variable_value("limit")=="100" ? "selected" : ""; ?>>100</option>
                                </select>
                            </label>
                        </div>
                    </div>
                    <div class="pagination-container"><?php echo $pagination ?></div>
                </div>
            </div>
        </div>
    </div>
</section>
