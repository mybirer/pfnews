<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<?php $page=$pages[0]?>
<section class="content-header">
    <h1>
        New Page
    </h1>
    <ol class="breadcrumb">
        <li><i class="fa fa-dashboard"></i> Ana Panel</li>
        <li><i class="fa fa-dashboard active"></i>Edit Page</li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <?php echo form_open(current_url());?>
        <div class="col-xs-9">
            <?php
            $form_response = $this->session->flashdata('form_response');
            if (!empty($form_response)){ ?>
                <div class="alert alert-<?php echo $form_response[0]=='success'?'success':'danger';?> alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <h4><i class="icon fa fa-<?php echo $form_response[0]=='success'?'fa-check':'fa-ban';?>"></i> <?php echo $form_response[0]=='success'?'Başarılı!':'Hata!';?></h4>
                    <?php echo $form_response[1];?>
                </div>
            <?php } ?>
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Edit Page</h3>
                </div>
                <div class="box-body table-responsive">
                    <div class="box-body has-feedback <?php echo has_error('title')?'has-error':'';?>">
                        <input id="title" name="title" class="form-control" type="text" placeholder="Title" value="<?php echo $page->title;?>">
                        <p class="help-block"><b>Permalink: </b>  http://minyy.com/example-title-alias-link-here.php</p>
                        <?php if (has_error('title')) echo ger_error('title');?>
                    </div>
                    <div class="box-body has-feedback <?php echo has_error('content')?'has-error':'';?>">
                        <textarea class="text-area" id="content" name="content" placeholder="Place some text here" style="width: 100%; height: 200px; font-size: 16px; line-height: 12px; border: 1px solid #dddddd; padding: 10px;"><?php echo $page->content;?></textarea>
                        <?php if (has_error('content')) echo ger_error('content');?>
                    </div>
                    <div class="box-body form-group">
                        <a href="/pages/delete/<?php echo $page->pkpage;?>" class="btn btn-danger pull-right">Delete</a>
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
<script src="<?php echo base_url('plugins/iCheck/icheck.min.js');?>"></script>
<script src="<?php echo base_url('plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js');?>"></script>
<script type="text/javascript">
    var $con = $('.wysihtml5-toolbar');
    var btnResize = $('<li>');
    btnResize.append('<a class="btn" title="Resize editor" tabindex="-1" href="#"><i class="icon-resize-full"></i></a>')
        .on('click', function(e){
            e.preventDefault();
            var $this = $(this);
            // if large make small:
            if( $this.hasClass('resized') ){
                $('#content').removeClass('full-editor');
                $this.removeClass('resized').find('i').removeClass('icon-resize-small');
            } else {
                // make large
                $('#content').addClass('full-editor');
                $this.addClass('resized').find('i').addClass('icon-resize-small');
            }
        });

    // append resize button to toolbar
    $con.find('.wysihtml5-toolbar').append(btnResize);
    $(function () {
        $("#content").wysihtml5();
    });

</script>
