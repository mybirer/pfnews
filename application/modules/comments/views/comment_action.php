<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<section class="content-header">
    <h1>
        Abone Bilgileri
    </h1>
    <ol class="breadcrumb">
        <li><i class="fa fa-dashboard"></i> Ana Panel</li>
        <li><i class="fa fa-dashboard"></i> Aboneler</li>
        <li><i class="fa fa-dashboard active"></i> Abone Bilgileri</li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-<?php if (!$result) echo 'danger'; else if ($affected_rows == 0) echo 'warning'; else echo 'success';?>">
                <div class="box-header with-border">
                    <h3 class="box-title"><?php if (!$result) echo 'Hata'; else if ($affected_rows == 0) echo 'Uyarı'; else echo 'Başarılı';?></h3>
                </div>
                <div class="box-body">
                    <?php
                        if (!$result){
                            echo 'Birşeyler yanlış gidiyor!';
                        }else{
                            if ($affected_rows == 0)
                                echo 'Eylem gerçekleştirilemiyor!';
                            else if ($action == 'delete' ){
                                echo 'Yorum başarıyla silindi!';
                            }else if ($action == 'approved'){
                                echo 'Yorum onaylandı!';
                            }else if ($action == 'moderated'){
                                echo 'Yorum beklemeye alındı!';
                            }else if ($action == 'trash'){
                                echo 'Yorum çöp\'e alındı!';
                            }
                        }
                    ?>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button type="button" class="btn btn-default">Geri</button>
                </div>
                <!-- /.box-footer-->
            </div>
        </div>
    </div>
</section>
