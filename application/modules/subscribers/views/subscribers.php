<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<section class="content-header">
    <h1>
        <?php echo t('Subscribers');?>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo base_url('dashboard')?>"><i class="fa fa-dashboard"></i> <?php echo t('Dashboard');?></a></li>
        <li><i class="fa fa-heart active""></i> <?php echo t('Subscribers');?></li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box box-primary">
                <div class="box-header">
                    <div class="box-toolbox">
                        <form id="filters" method="get" action="">
                            <div class="form-group pull-left">
                                <div style="position: relative;">
                                    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><?php echo t('Action');?><span class="fa fa-caret-down"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#" data-toggle="action-checkboxes" class="text-green" data-target=".obj-checkbox" data-action="subscribers/enable" style="text-decoration: none;"><i class="fa  fa-check-circle-o"></i><?php echo t('Enable');?></a></li>
                                        <li><a href="#" data-toggle="action-checkboxes" class="text-red" data-target=".obj-checkbox" data-action="subscribers/disable" style="text-decoration: none;"><i class="fa fa-minus-circle"></i><?php echo t('Disable');?></a></li>
                                        <li class="list-seperator"></li>
                                        <li><a href="#" data-toggle="action-checkboxes" data-target=".obj-checkbox" data-action="subscribers/delete" style="text-decoration: none;"><i class="fa fa-trash-o"></i><?php echo t('Delete');?></a></li>
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
                                <a href="<?php echo base_url('dashboard/subscribers') ?>" class="btn btn-sm btn-warning"><?php echo t('Reset');?></a>
                            </div>
                            <div class="filter-panel" style="<?php echo isset($_GET['is_detailed']) && $_GET['is_detailed']==1 ? "display:block" : "display:none" ?>">
                                <hr style="display:block;clear:both;" />
                                <div class="form-group pull-left">
                                    <label><?php echo t('Error Level');?>:</label>
                                    <select class="form-control" name="f_key[banned]"  style="max-width:200px">
                                        <option value="">-<?php echo t('Filter by status');?>-</option>
                                        <option value="0" <?php echo is_filter_opt_selected('banned', '0')?>><?php echo t('Enabled Subscribers');?></option>
                                        <option value="1" <?php echo is_filter_opt_selected('banned', '1')?>><?php echo t('Disabled Subscribers');?></option>
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
                    <table class="table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th class="text-center"><a href="#" data-toggle="toggle-checkboxs" data-target=".obj-checkbox">#</a></th>
                            <th><a href="#" class="live-label <?php is_ordered('name'); ?>" data-toggle="change-order" data-order-by="name"><?php echo t('Name');?></a></th>
                            <th><a href="#" class="live-label <?php is_ordered('email'); ?>" data-toggle="change-order" data-order-by="email"><?php echo t('Email');?></a></th>
                            <th><a href="#" class="live-label <?php is_ordered('banned'); ?>" data-toggle="change-order" data-order-by="banned"><?php echo t('Status');?></a></th>
                            <th><a href="#" class="live-label <?php is_ordered('created_at'); ?>" data-toggle="change-order" data-order-by="created_at"><?php echo t('Created At');?></a></th>
                            <th><a href="#" class="live-label <?php is_ordered('last_visit'); ?>" data-toggle="change-order" data-order-by="last_visit"><?php echo t('Last Visit');?></a></th>
                            <th style="width:60px;"><?php echo t('Actions');?></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($objects as $object):?>
                            <tr>
                                <td class="text-center"><label><input type="checkbox" class="minimal obj-checkbox" name="check_list[]" id="<?php echo $object->pksubscriber;?>"/></label></td>
                                <td><?php echo $object->name;?></td>
                                <td><?php echo $object->email;?></td>
                                <td><label class="label bg-<?php echo $object->banned=='1'?'red':'green';?>"><?php echo $object->banned=='1'?'Disabled':'Enabled';?></label></td>
                                <td><?php echo $object->created_at;?></td>
                                <td><?php echo $object->last_visit;?></td>
                                <td style="white-space:nowrap;">
                                    <a data-toggle="tooltip" title="" class="text-red" href="subscribers/edit/<?php echo $object->pksubscriber;?>" data-original-title="<?php echo t('Edit');?>"><i class="fa fa-edit"></i></a>
                                    <a data-toggle="tooltip" title="" class="text-green" href="subscribers/enable/<?php echo $object->pksubscriber;?>" data-original-title="<?php echo t('Enable Subscriber');?>"><i class="fa fa-check-circle-o"></i></a>
                                    <a data-toggle="tooltip" title="" class="text-red" href="subscribers/disable/<?php echo $object->pksubscriber;?>" data-original-title="<?php echo t('Disable Subscriber');?>"><i class="fa fa-minus-circle"></i></a>
                                    <a data-toggle="tooltip" title="" class="text-red" href="subscribers/delete/<?php echo $object->pksubscriber;?>" data-original-title="<?php echo t('Delete');?>"><i class="fa fa-remove"></i></a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
                <div class="box-footer">
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
                    <div class="pagination_container">
                        <?php echo $pagination;?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
