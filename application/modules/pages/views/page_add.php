<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<section class="content-header">
    <h1>
        <?php echo t('Add Page');?>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo base_url('dashboard')?>"><i class="fa fa-dashboard"></i> <?php echo t('Dashboard');?></a></li>
        <li><a href="<?php echo base_url('dashboard/pages')?>"><i class="fa fa-file-o ""></i> <?php echo t('Pages');?></a></li>
        <li><i class="fa fa-plus active""></i> <?php echo t('Add Page');?></li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <?php echo form_open(current_url());?>
        <div class="col-sm-9 col-xs-12">
            <?php get_message_helper()?>
            <div class="box">
                <div class="box-body table-responsive">
                    <div class="box-body has-feedback <?php echo has_error('title')?'has-error':'';?>">
                        <label for="title"><?php echo t('Page Title');?></label>
                        <input id="title" name="title" class="form-control" type="text" placeholder="<?php echo t('Title');?>" value="<?php echo set_value('title');?>">
                        <?php if (has_error('title')) echo get_error('title');?>
                    </div>
                    <div class="box-body has-feedback <?php echo has_error('alias')?'has-error':'';?>">
                        <label for="alias"><?php echo t('Page link');?></label>
                        <input class="form-control input-sm" id="alias" name="alias" type="text" placeholder="unique page name" value="<?php echo set_value('title');?>">
                        <p class="help-block"><b>Pagelink: </b>  <?php echo base_url('pagelink');?></p>
                        <?php if (has_error('alias')) echo get_error('alias');?>
                    </div>
                    <div class="box-body has-feedback <?php echo has_error('content')?'has-error':'';?>">
                        <textarea id="content" name="content" rows="10" cols="80">
                            <?php echo set_value('content');?>
                        </textarea>
                        <?php if (has_error('content')) echo get_error('content');?>
                    </div>
                    <div class="box-body form-group">
                        <a href="<?php echo base_url('/pages');?>" class="btn btn-danger pull-right"><?php echo t('Delete');?></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-3 col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title"><?php echo t('Publish');?></h3>
                    <div class="pull-right box-tools">
                        <button type="button" class="btn btn-default btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                            <i class="fa fa-plus"></i></button>
                    </div>
                </div>
                <div class="box-body table-responsive">
                    <div class="form-group">
                        <label><?php echo t('Status');?></label>
                        <select id="status" name="status" class="form-control select2" style="width: 100%;">
                            <option value="publish" selected="selected"><?php echo t('Publish');?></option>
                            <option value="draft"><?php echo t('Draft');?></option>
                        </select>
                    </div>
                    <div class="form-group margin">
                        <label class="help-block pull-left">
                            <input type="checkbox" name="allow_comments" id="allow_comments" class="flat-red">
                            &nbsp;<?php echo t('Allow Comments');?>
                        </label>
                    </div>
                </div>
                <div class="box-footer">
                    <button type="submit" name="addPostForm" data-toggle="save" class="btn btn-success pull-right">
                        <?php echo t('Save');?>
                    </button>
                </div>
            </div>
        </div>
        <?php echo form_close();?>
    </div>
</section>
<script src="<?php echo base_url('plugins/iCheck/icheck.min.js');?>"></script>
<script src="<?php echo base_url('plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js');?>"></script>
<script>
    $(function () {
        // Replace the <textarea id="editor1"> with a CKEditor
        // instance, using default configuration.
        CKEDITOR.replace('content');
        //bootstrap WYSIHTML5 - text editor
        $(".textarea").wysihtml5();
    });
</script>
