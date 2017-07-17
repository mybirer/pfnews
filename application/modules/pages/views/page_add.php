<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<section class="content-header">
    <h1>
        New Page
    </h1>
    <ol class="breadcrumb">
        <li><i class="fa fa-dashboard"></i> Ana Panel</li>
        <li><i class="fa fa-dashboard active"></i>New Page</li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-xs-9">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">New Page</h3>
                </div>
                <div class="box-body table-responsive">
                    <div class="box-body pad form-group">
                        <input id="title" name="title" class="form-control" type="text" placeholder="Title">
                        <p class="help-block"><b>Permalink: </b>  http://minyy.com/example-title-alias-link-here.php</p>
                        <textarea class="text-area" id="content" name="content" placeholder="Place some text here" style="width: 100%; height: 200px; font-size: 16px; line-height: 12px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                    </div>
                    <div class="box-body pad form-group">
                        <a href="index.php?controller=module&action=" class="btn btn-danger pull-right">Delete</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-3">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Publish</h3>
                    <div class="pull-right box-tools">
                        <button type="button" class="btn btn-default btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                            <i class="fa fa-plus"></i></button>
                    </div>
                </div>
                <div class="box-body table-responsive">
                    <label>Status</label>
                    <select id="status" name="status" class="form-control select2" style="width: 100%;">
                        <option value="publish" selected="selected">Publish</option>
                        <option value="draft">Draft</option>
                    </select>
                </div>
                <div class="box-body table-responsive">
                    <label class="help-block pull-left">
                        <input type="checkbox" name="comment_status" id="comment_status" class="flat-red">
                        &nbsp;Allow Comments
                    </label>
                    <button type="submit" name="addPostForm" data-toggle="save" class="btn btn-success pull-right">
                        Save
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#content").wysihtml5();
    });
</script>