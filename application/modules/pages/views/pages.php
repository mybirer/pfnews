<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<section class="content-header">
    <h1>
        Aboneler
    </h1>
    <ol class="breadcrumb">
        <li><i class="fa fa-dashboard"></i><?php echo t('Dashboard');?></li>
        <li><i class="fa fa-dashboard active"></i> <?php echo t('Pages')?></li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <?php get_message_helper() ?>
            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title"><?php echo t('All Pages');?></h3>
                    <div class="box-toolbox">
                        <form id="search-form">
                            <div class="input-group input-group-sm pull-left search-form">
                                <input type="text" name="table_search" class="form-control pull-right" placeholder="<?php echo t('Search');?>.."/>
                                <div class="input-group-btn">
                                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                </div>
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
                                <th style="width:60px;">#</th>
                                <th><?php echo t('Title');?></th>
                                <th><?php echo t('Status');?></th>
                                <th><?php echo t('Created At');?></th>
                                <th><?php echo t('Comments');?></th>
                                <th><?php echo t('Comment Count');?></th>
                                <th>ID</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($pages as $page){?>
                                <tr>
                                    <td>
                                        <a data-toggle="tooltip" title="" class="text-red" href="/pages/edit/<?php echo $page->pkpage;?>" data-original-title="<?php echo t('Edit');?>"><i class="fa fa-edit"></i></a>
                                        <a data-toggle="tooltip" title="" class="text-blue pull-right" data-original-title="<?php echo t('Go to Link');?>"><i class="fa fa-external-link"></i></a>
                                    </td>
                                    <td><?php echo $page->title;?></td>
                                    <td><label class="label bg-<?php echo $page->status=='published'?'green':'yellow';?>"><?php echo $page->status == 'published'?t('Published'):t('Draft');?></label></td>
                                    <td><?php echo $page->created_at;?></td>
                                    <td><label class="label bg-<?php echo $page->allow_comments==0?'red':'green';?>"><?php echo $page->allow_comments==0?t('Closed'):t('Opened');?></label></td>
                                    <td><?php echo $page->comments;?></td>
                                    <td><?php echo $page->pkpage;?></td>
                                </tr>
                            <?php }?>
                        </tbody>
                    </table>
                </div>
                <div class="box-footer">
                    <div class="table-length dataTables_length pull-left">
                        <label><?php echo t('Show');?>
                            <select name="limit" class="form-control input-sm">
                                <option value="10">10</option>
                                <option value="25">25</option>
                                <option value="50">50</option>
                                <option value="100">100</option>
                            </select>
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
