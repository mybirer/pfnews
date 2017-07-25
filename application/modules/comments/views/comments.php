<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<section class="content-header">
    <h1>
        <?php echo t('Comments');?>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo base_url('dashboard')?>"><i class="fa fa-dashboard"></i> <?php echo t('Dashboard');?></a></li>
        <li><i class="fa fa-comments-o active"></i> <?php echo t('Comments');?></li>
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
                                        <li><a href="#" data-toggle="action-checkboxes" class="text-green" data-target=".obj-checkbox" data-action="/comments/approve" style="text-decoration: none;"><i class="fa  fa-check-circle-o"></i><?php echo t('Approve');?></a></li>
                                        <li><a href="#" data-toggle="action-checkboxes" class="text-yellow" data-target=".obj-checkbox" data-action="/comments/set_pending" style="text-decoration: none;"><i class="fa fa-hourglass-o"></i><?php echo t('Set Pending');?></a></li>
                                        <li><a href="#" data-toggle="action-checkboxes" class="text-red" data-target=".obj-checkbox" data-action="/comments/set_spam" style="text-decoration: none;"><i class="fa fa-minus-circle"></i><?php echo t('Spam');?></a></li>
                                        <li class="list-seperator"></li>
                                        <li><a href="#" data-toggle="action-checkboxes" data-target=".obj-checkbox" data-action="/comments/delete" style="text-decoration: none;"><i class="fa fa-trash-o"></i><?php echo t('Delete');?></a></li>
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
                                    <select class="form-control" name="f_key[status]"  style="max-width:200px">
                                        <option value="">-<?php echo t('Filter by status');?>-</option>
                                        <option value="approved" <?php echo is_filter_opt_selected('status', 'approved')?>><?php echo t('Approved');?></option>
                                        <option value="pending" <?php echo is_filter_opt_selected('status', 'pending')?>><?php echo t('Pending');?></option>
                                        <option value="spam" <?php echo is_filter_opt_selected('status', 'spam')?>><?php echo t('Spam');?></option>
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
                            <th><a href="#" class="live-label <?php is_ordered('email'); ?>" data-toggle="change-order" data-order-by="email"><?php echo t('Email');?></a></th>
                            <th><?php echo t('Comment');?></th>
                            <th><a href="#" class="live-label <?php is_ordered('status'); ?>" data-toggle="change-order" data-order-by="status"><?php echo t('Status');?></a></th>
                            <th><a href="#" class="live-label <?php is_ordered('created_at'); ?>" data-toggle="change-order" data-order-by="created_at"><?php echo t('Created At');?></a></th>
                            <th style="width:60px;"><?php echo t('Actions');?></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($objects as $object):?>
                        <tr>
                            <td class="text-center"><label><input type="checkbox" class="minimal obj-checkbox" name="check_list[]" id="<?php echo $object->pkcomment;?>"/></label></td>
                            <td><?php echo $object->email;?></td>
                            <td><?php echo $object->content;?></td>
                            <td><label class="label bg-<?php if ($object->status=='approved') echo 'green';if ($object->status=='pending') echo 'yellow';if ($object->status=='spam') echo 'red';?>"><?php echo $object->status;?></label></td>
                            <td><?php echo $object->created_at;?></td>
                            <td>
                                <a data-toggle="tooltip" title="" class="text-red" href="/comments/edit/<?php echo $object->pkcomment;?>" data-original-title="<?php echo t('Edit');?>"><i class="fa fa-edit"></i></a>
                                <a data-toggle="tooltip" title="" class="text-blue pull-right" data-original-title="<?php echo t('Go to Comment');?>"><i class="fa fa-external-link"></i></a>
                                <a data-toggle="tooltip" title="" class="text-green" href="/comments/approve/<?php echo $object->pkcomment;?>" data-original-title="<?php echo t('Approve');?>"><i class="fa fa-check-circle-o"></i></a>
                                <a data-toggle="tooltip" title="" class="text-yellow" href="/comments/set_pending/<?php echo $object->pkcomment;?>" data-original-title="<?php echo t('Pending');?>"><i class="fa fa-hourglass-o"></i></a>
                                <a data-toggle="tooltip" title="" class="text-red" href="/comments/set_spam/<?php echo $object->pkcomment;?>" data-original-title="<?php echo t('Spam');?>"><i class="fa fa-minus-circle"></i></a>
                                <a data-toggle="tooltip" title="" class="text-red" href="/comments/delete/<?php echo $object->pkcomment;?>" data-original-title="<?php echo t('Delete');?>"><i class="fa fa-remove"></i></a>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
