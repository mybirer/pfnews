<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<section class="content-header">
    <section class="content-header">
        <h1>
            <?php echo t('Subscribers');?>
        </h1>
        <ol class="breadcrumb">
            <li><i class="fa fa-dashboard"></i> <?php echo t('Dashboard');?></li>
            <li><i class="fa fa-dashboard active""></i> <?php echo t('Subscribers');?></li>
        </ol>
    </section>
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title"><?php echo t('Subscribers');?></h3>
                    <div class="box-tools">
                        <div class="input-group input-group-sm" style="width: 300px;">
                            <input type="text" name="table_search" class="form-control pull-right" placeholder="<?php echo t('Search');?>">

                            <div class="input-group-btn">
                                <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-body">
                    <div class="dataTables_wrapper form-inline dt-bootstrap">
                        <div class="row">
                            <div class="col-sm-12">
                                <table class="table table-bordered table-hover" role="grid">
                                    <thead>
                                        <tr role="row">
                                            <th style="width: 81px;">#</th>
                                            <th style="width: 181px;"><?php echo t('Name Surname');?></th>
                                            <th style="width: 181px;"><?php echo t('Surname');?></th>
                                            <th style="width: 181px;"><?php echo t('Email');?></th>
                                            <th style="width: 181px;"><?php echo t('Created At');?></th>
                                            <th style="width: 181px;"><?php echo t('IP Address');?></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <?php foreach ($objects as $object) { ?>
                                        <tr>
                                            <td><a data-toggle="tooltip" title="" class="text-red" href="edit/<?php echo $object->pksubscriber; ?>" data-original-title="Edit"><i class="fa fa-edit"></i></a></td>
                                            <td><?php echo $object->name; ?></td>
                                            <td><?php echo $object->username; ?></td>
                                            <td><?php echo $object->email; ?></td>
                                            <td><?php echo $object->created_at; ?></td>
                                            <td><?php echo $object->ip; ?></td>
                                        </tr>
                                    <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-5">
                                <p class="text-muted" >Showing 1 to 10 of 57 entries</p>
                            </div>
                            <div class="col-sm-7" style="text-align: right">
                                    <ul class="pagination" style="margin: 0px">
                                        <li class="paginate_button previous disabled" ><a href="#" data-dt-idx="0" tabindex="0"><?php echo t('Previous');?></a></li>
                                        <li class="paginate_button active"><a href="#" aria-controls="example1" data-dt-idx="1" tabindex="0">1</a></li>
                                        <li class="paginate_button "><a href="#" data-dt-idx="2" tabindex="0">2</a></li>
                                        <li class="paginate_button "><a href="#" data-dt-idx="3" tabindex="0">3</a></li>
                                        <li class="paginate_button "><a href="#" data-dt-idx="4" tabindex="0">4</a></li>
                                        <li class="paginate_button "><a href="#" data-dt-idx="5" tabindex="0">5</a></li>
                                        <li class="paginate_button "><a href="#" data-dt-idx="6" tabindex="0">6</a></li>
                                        <li class="paginate_button next"><a href="#" data-dt-idx="7" tabindex="0"><?php echo t('Next');?></a></li>
                                    </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
