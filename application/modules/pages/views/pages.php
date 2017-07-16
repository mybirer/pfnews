<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<section class="content-header">
    <h1>
        Aboneler
    </h1>
    <ol class="breadcrumb">
        <li><i class="fa fa-dashboard"></i> Ana Panel</li>
        <li><i class="fa fa-dashboard active"></i> Aboneler</li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">All Pages</h3>
                    <div class="box-toolbox">
                        <form id="search-form">
                            <div class="input-group input-group-sm pull-left search-form">
                                <input type="text" name="table_search" class="form-control pull-right" placeholder="Search.."/>
                                <div class="input-group-btn">
                                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </form>
                        <a href="index.php?controller=module&action=&do=add" class="btn btn-success pull-right">
                            <i class="fa fa-plus"></i>New Page
                        </a>
                    </div>
                </div>
                <div class="box-body table-responsive no-padding">
                    <table class="table table-hover table-bordered" >
                        <thead >
                            <tr>
                                <th style="width:60px;">#</th>
                                <th>Author</th>
                                <th>Title</th>
                                <th>Status</th>
                                <th>Post Date</th>
                                <th>Comments</th>
                                <th>ID</th>
                            </tr>
                        </thead>
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