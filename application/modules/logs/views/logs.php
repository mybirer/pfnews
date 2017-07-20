<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<section class="content-header">
    <h1>
        <?php echo t('Logs');?>
    </h1>
    <ol class="breadcrumb">
        <li><i class="fa fa-dashboard"></i> <?php echo t('Dashboard');?></li>
        <li><i class="fa fa-dashboard active"></i> <?php echo t('Logs');?></li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title"><?php echo t('System Logs');?></h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                        <div class="row"><div class="col-sm-6"><div class="dataTables_length" id="example1_length">
                                    <label><?php echo t('Show');?> <select name="example1_length" aria-controls="example1" class="form-control input-sm"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> entries</label>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="box-tools">
                                    <div class="input-group input-group-sm" style="width: 100%;">
                                        <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                                        <div class="input-group-btn" style="width: 1%">
                                            <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="col-sm-12">
                                    <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                    <thead>
                                    <tr role="row">
                                        <th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width: 176px;"><?php echo t('Level');?></th>
                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 224px;"><?php echo t('Module');?></th>
                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 205px;"><?php echo t('Description');?></th>
                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 152px;"><?php echo t('Time');?></th>
                                        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 111px;"><?php echo t('IP Address');?></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php

                                        //warning #FFE495  error: #ce8483  information: #a3d0ef
                                        foreach ($objects as $object){
                                    ?>
                                            <tr role="row" style="background-color: <?php if ($object->kind == 'error') echo '#ce8483'; if ($object->kind == 'warning') echo '#FFE495'; if ($object->kind == 'important') echo '#ce8483';?>">
                                                <td><?php echo $object->kind;?></td>
                                                <td><?php echo $object->module?></td>
                                                <td><?php echo $object->description?></td>
                                                <td><?php echo $object->created_at?></td>
                                                <td><?php echo $object->ip?></td>
                                            </tr>
                                    <?php
                                        }
                                    ?>

                                    </tbody>
                                </table>
                                </div>
                            </div>
                            <div>
                                <div class="col-sm-5">
                                    <div class="dataTables_info" id="example1_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries</div>
                                </div>
                                <div class="col-sm-7">
                                    <div class="dataTables_paginate paging_simple_numbers pull-right" id="example1_paginate">
                                        <ul class="pagination">
                                            <li class="paginate_button previous disabled" id="example1_previous">
                                                <a href="#" aria-controls="example1" data-dt-idx="0" tabindex="0"><?php echo t('Previous');?></a>
                                            </li>
                                            <li class="paginate_button active">
                                                <a href="#" aria-controls="example1" data-dt-idx="1" tabindex="0">1</a>
                                            </li>
                                            <li class="paginate_button "><a href="#" aria-controls="example1" data-dt-idx="2" tabindex="0">2</a></li>
                                            <li class="paginate_button "><a href="#" aria-controls="example1" data-dt-idx="3" tabindex="0">3</a></li>
                                            <li class="paginate_button "><a href="#" aria-controls="example1" data-dt-idx="4" tabindex="0">4</a></li>
                                            <li class="paginate_button "><a href="#" aria-controls="example1" data-dt-idx="5" tabindex="0">5</a></li>
                                            <li class="paginate_button "><a href="#" aria-controls="example1" data-dt-idx="6" tabindex="0">6</a></li>
                                            <li class="paginate_button next" id="example1_next"><a href="#" aria-controls="example1" data-dt-idx="7" tabindex="0"><?php echo t('Next');?></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div></div>
                    </div>
                <!-- /.box-body -->
            </div>
        </div>
    </div>
</section>
