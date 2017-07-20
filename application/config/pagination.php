<?php
/**
 * Created by PhpStorm.
 * User: MyBirer
 * Date: 20.07.2017
 * Time: 13:42
 */

$config['use_page_numbers'] = true;
$config['page_query_string'] = true;
$config['query_string_segment'] = 'page';
$config['reuse_query_string'] = true;
$config['attributes'] = array('class' => 'myclass');
$config['full_tag_open'] = '<ul class="pagination pagination-sm no-margin pull-right">';
$config['full_tag_close'] = '</ul>';
$config['first_link'] = '<span class="glyphicon glyphicon-step-backward" aria-hidden="true"></span>';
$config['first_tag_open'] = '<li>';
$config['first_tag_close'] = '</li>';
$config['last_link'] = '<span class="glyphicon glyphicon-step-forward" aria-hidden="true"></span>';
$config['last_tag_open'] = '<li>';
$config['last_tag_close'] = '</li>';
$config['next_link'] = '<span class="glyphicon glyphicon-forward" aria-hidden="true"></span>';
$config['next_tag_open'] = '<li>';
$config['next_tag_close'] = '</li>';
$config['prev_link'] = '<span class="glyphicon glyphicon-backward" aria-hidden="true"></span>';
$config['prev_tag_open'] = '<li>';
$config['prev_tag_close'] = '</li>';
$config['cur_tag_open'] = '<li class="active"><a href="#"><b>';
$config['cur_tag_close'] = '</b></a></li>';
$config['num_tag_open'] = '<li>';
$config['num_tag_close'] = '</li>';