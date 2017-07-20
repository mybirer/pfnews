<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<section class="content-header">
    <h1>
        Users
    </h1>
    <ol class="breadcrumb">
        <li><i class="fa fa-dashboard"></i> Dashboard</li>
        <li><i class="fa fa-dashboard active"></i> Users</li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <?php
            $form_response = $this->session->flashdata('form_response');
            if (!empty($form_response)){ ?>
                <div class="alert alert-<?php echo $form_response[0]=='success'?'success':'danger';?> alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <h4><i class="icon fa fa-<?php echo $form_response[0]=='success'?'fa-check':'fa-ban';?>"></i> <?php echo $form_response[0]=='success'?'Başarılı!':'Hata!';?></h4>
                    <?php echo $form_response[1];?>
                </div>
            <?php } ?>
            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title">Users</h3>
                    <div class="box-toolbox">
                        <form id="search-form">
                            <div class="input-group input-group-sm pull-left search-form">
                                <input type="text" name="table_search" class="form-control pull-right" placeholder="Search.."/>
                                <div class="input-group-btn">
                                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </form>
                        <a href="pages/add" class="btn btn-success pull-right">
                            <i class="fa fa-plus"></i>New Page
                        </a>
                    </div>
                </div>
                <div class="box-body table-responsive no-padding">
                    <table class="table table-hover table-bordered" >
                        <thead >
                            <tr>
                                <th style="width:60px;">#</th>
                                <th>Username</th>
                                <th>Fullname</th>
                                <th>Email</th>
                                <th>Created At</th>
                                <th>Yorumlar</th>
                                <th>Yorum Sayısı</th>
                                <th>ID</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($objects as $obj){?>
                                <tr>
                                    <td>
                                        <a data-toggle="tooltip" title="Edit" class="text-red" href="/pages/edit/<?php echo $obj->pkuser;?>"><i class="fa fa-edit"></i></a>
                                    </td>
                                    <td><?php echo $obj->fullname;?></td>
                                    <td><?php echo $page->summary;?></td>
                                    <td><label class="label bg-<?php echo $page->status=='published'?'green':'yellow';?>"><?php echo $page->status == 'published'?'Yayında':'Taslak';?></label></td>
                                    <td><?php echo $page->created_at;?></td>
                                    <td><label class="label bg-<?php echo $page->allow_comments==0?'red':'green';?>"><?php echo $page->allow_comments==0?'Kapalı':'Açık';?></label></td>
                                    <td><?php echo $page->comments;?></td>
                                    <td><?php echo $page->pkpage;?></td>
                                </tr>
                            <?php }?>
                        </tbody>
                    </table>
                </div>
                <div class="box-footer">
                    <div class="table-length dataTables_length pull-left">
                        <label>Show
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