<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <?php get_message_helper() ?>
            <div class="box box-primary">
                <div class="box-header">
                    <div class="box-toolbox">
                        <form id="filters" method="get" action="">
<!--                            <div class="form-group pull-left">-->
<!--                                <div style="position: relative;">-->
<!--                                    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">--><?php //echo t('Action');?><!--<span class="fa fa-caret-down"></span></button>-->
<!--                                    <ul class="dropdown-menu">-->
<!--                                        <li><a href="#" data-toggle="action-checkboxes" class="text-green" data-target=".obj-checkbox" data-action="pages/publish" style="text-decoration: none;"><i class="fa  fa-check-circle-o"></i>--><?php //echo t('Publish');?><!--</a></li>-->
<!--                                        <li><a href="#" data-toggle="action-checkboxes" class="text-yellow" data-target=".obj-checkbox" data-action="pages/unpublish" style="text-decoration: none;"><i class="fa fa-hourglass-o"></i>--><?php //echo t('Unpublish');?><!--</a></li>-->
<!--                                        <li class="list-seperator"></li>-->
<!--                                        <li><a href="#" data-toggle="action-checkboxes" data-target=".obj-checkbox" data-action="pages/delete" style="text-decoration: none;"><i class="fa fa-trash-o"></i>--><?php //echo t('Delete');?><!--</a></li>-->
<!--                                    </ul>-->
<!--                                </div>-->
<!--                            </div>-->
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
                                <a href="<?php echo base_url('dashboard/pages') ?>" class="btn btn-sm btn-warning"><?php echo t('Reset');?></a>
                            </div>
                            <div class="filter-panel" style="<?php echo isset($_GET['is_detailed']) && $_GET['is_detailed']==1 ? "display:block" : "display:none" ?>">
                                <hr style="display:block;clear:both;" />
                                <div class="form-group pull-left">
                                    <label><?php echo t('Status');?>:</label>
                                    <select class="form-control" name="f_key[status]"  style="max-width:200px">
                                        <option value="">-<?php echo t('Filter by status');?>-</option>
                                        <option value="published" <?php echo is_filter_opt_selected('status', 'published')?>><?php echo t('Published');?></option>
                                        <option value="draft" <?php echo is_filter_opt_selected('status', 'draft')?>><?php echo t('Draft');?></option>
                                    </select>
                                </div>
                                <div class="form-group pull-left">
                                    <label class="clr">&nbsp;</label>
                                    <button type="submit" class="btn btn-sm btn-primary"><?php echo t('Filter');?></button>
                                </div>
                                <hr style="display:block;clear:both;" />
                            </div>
                        </form>
                        <a href="pages/add" class="btn btn-success pull-right">
                            <i class="fa fa-plus"></i><?php echo t('New Page');?>
                        </a>
                    </div>
                </div>
                <div class="box-body table-responsive no-padding">
                    <table class="table table-hover table-bordered" >
                        <thead >
                        <tr>
                            <th style="width:60px;text-align: center">#</th>
                            <th><a href="#" class="live-label <?php is_ordered('title'); ?>" data-toggle="change-order" data-order-by="title"><?php echo t('Title');?></a></th>
                            <th><a href="#" class="live-label <?php is_ordered('alias'); ?>" data-toggle="change-order" data-order-by="alias"><?php echo t('Alias');?></a></th>
                            <th><a href="#" class="live-label <?php is_ordered('status'); ?>" data-toggle="change-order" data-order-by="status"><?php echo t('Status');?></a></th>
                            <th><a href="#" class="live-label <?php is_ordered('created_at'); ?>" data-toggle="change-order" data-order-by="created_at"><?php echo t('Created At');?></a></th>
                            <th><a href="#" class="live-label <?php is_ordered('allow_comments'); ?>" data-toggle="change-order" data-order-by="allow_comments"><?php echo t('Comments');?></a></th>
<!--                            <th>--><?php //echo t('Comment Count');?><!--</th>-->
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($pages as $page){?>
                            <tr>
                                <td>
                                    <a data-toggle="tooltip" title="" class="text-red" href="/pages/edit/<?php echo $page->pkpage;?>" data-original-title="<?php echo t('Edit');?>"><i class="fa fa-edit"></i></a>
                                    <a data-toggle="tooltip" title="" class="text-blue pull-right" target="_blank" href="<?php echo base_url($page->alias);?>" data-original-title="<?php echo t('Go to Link');?>"><i class="fa fa-external-link"></i></a>
                                </td>
                                <td><?php echo $page->title;?></td>
                                <td><?php echo $page->alias;?></td>
                                <td><label class="label bg-<?php echo $page->status=='published'?'green':'yellow';?>"><?php echo $page->status == 'published'?t('Published'):t('Draft');?></label></td>
                                <td><?php echo $page->created_at;?></td>
                                <td><label class="label bg-<?php echo $page->allow_comments==0?'red':'green';?>"><?php echo $page->allow_comments==0?t('Closed'):t('Opened');?></label></td>
<!--                                <td>--><?php //echo $page->comments;?><!--</td>-->
                            </tr>
                        <?php }?>
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
