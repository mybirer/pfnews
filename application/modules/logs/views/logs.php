<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<section class="content-header">
    <h1>
        <?php echo t('Logs');?>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo base_url('dashboard')?>"><i class="fa fa-dashboard"></i> <?php echo t('Dashboard');?></a></li>
        <li><i class="fa fa-eye active"></i> <?php echo t('Logs');?></li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-primary">
                <div class="box-header">
                    <div class="box-toolbox">
                        <form id="filters" method="get" action="">
                            <div class="form-group pull-left">
                                <div style="position: relative;">
                                    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><?php echo t('Action');?><span class="fa fa-caret-down"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#" data-toggle="action-checkboxes" data-target=".obj-checkbox" data-action="/logs/delete" style="text-decoration: none;"><?php echo t('Delete');?></a></li>
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
                                <a href="<?php echo base_url('dashboard/logs') ?>" class="btn btn-sm btn-warning"><?php echo t('Reset');?></a>
                            </div>
                            <div class="filter-panel" style="<?php echo isset($_GET['is_detailed']) && $_GET['is_detailed']==1 ? "display:block" : "display:none" ?>">
                                <hr style="display:block;clear:both;" />
                                <div class="form-group pull-left">
                                    <label><?php echo t('Error Level');?>:</label>
                                    <select class="form-control" name="f_key[kind]"  style="max-width:200px">
                                        <option value="">-<?php echo t('Filter by error level');?>-</option>
                                        <option value="error" <?php echo is_filter_opt_selected('kind', 'error')?>><?php echo t('Error');?></option>
                                        <option value="warning" <?php echo is_filter_opt_selected('kind', 'warning')?>><?php echo t('Warning');?></option>
                                        <option value="info" <?php echo is_filter_opt_selected('kind', 'info')?>><?php echo t('Information');?></option>
                                    </select>
                                </div>
                                <div class="form-group pull-left">
                                    <label><?php echo t('module');?>:</label>
                                    <select class="form-control" name="f_key[module]"  style="max-width:200px">
                                        <option value="">-<?php echo t('Filter by module');?>-</option>
                                        <?php foreach ($modules as $module):?>
                                            <option value="<?php echo $module['module'];?>" <?php echo is_filter_opt_selected('module',$module['module']) ?>><?php echo $module['module'];?></option>
                                        <?php endforeach;?>
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
                    <table class="table table-hover table-bordered table-striped dataTable" role="grid" >
                        <thead>
                        <tr role="row">
                            <th class="text-center"><a href="#" data-toggle="toggle-checkboxs" data-target=".obj-checkbox">#</a></th>
                            <th><a href="#" class="live-label <?php is_ordered('kind'); ?>" data-toggle="change-order" data-order-by="kind"><?php echo t('Level');?></a></th>
                            <th><a href="#" class="live-label <?php is_ordered('module'); ?>" data-toggle="change-order" data-order-by="module"><?php echo t('Module');?></a></th>
                            <th><a href="#" class="live-label <?php is_ordered('description'); ?>" data-toggle="change-order" data-order-by="description"><?php echo t('Description');?></a></th>
                            <th><a href="#" class="live-label <?php is_ordered('created_at'); ?>" data-toggle="change-order" data-order-by="created_at"><?php echo t('Time');?></a></th>
                            <th><a href="#" class="live-label <?php is_ordered('ip'); ?>" data-toggle="change-order" data-order-by="ip"><?php echo t('IP Address');?></a></th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php
                    //warning #FFE495  error: #ffa8a7  information: #a3d0ef
                    foreach ($objects as $object):?>
                        <tr role="row" <?php if ($object->kind == 'error') echo 'style="background-color: #ffa8a7"'; if ($object->kind == 'warning') echo 'style="background-color: #FFE495"'; if ($object->kind == 'important') echo 'style="background-color: #ce8483"';?>>
                            <td class="text-center"><label><input type="checkbox" class="minimal obj-checkbox" name="check_list[]" id="<?php echo $object->pklog;?>"/></label></td>
                            <td><?php echo $object->kind;?></td>
                            <td><?php echo $object->module?></td>
                            <td><?php echo $object->description?></td>
                            <td><?php echo $object->created_at?></td>
                            <td><?php echo $object->ip?></td>
                        </tr>
                <?php endforeach;?>
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
