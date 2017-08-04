<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/

//dikkat sırası önemli
//istisnalar önce , regex url sonra yazılmalı
$route['default_controller'] = 'home';
$route['login'] = 'authentication/panel_login';
$route['logout'] = 'authentication/panel_logout';
$route['register'] = 'authentication/panel_register';
$route['panel'] = 'dashboard/panel';
$route['panel/(.+)'] = 'dashboard/panel/$1';
$route['dashboard'] = 'dashboard/index';
$route['dashboard/logout'] = 'authentication/dashboard_logout';
$route['dashboard/no_access'] = 'dashboard/dashboard/no_access';

//eğer base_url den sonra yukarıdakilerden farklı bir veri gelirse
//sayfa olarak değerlendir. (Örn: http://example.com/iletisim => http://example.com/pages/show/iletisim)
$route['(:any)'] = 'pages/show/$1';

$route['haber/(.+)'] = 'news/show/$1';
$route['video/(.+)'] = 'videos/show/$1';
$route['galeri/(.+)'] = 'galleries/show/$1';
$route['yazarlar/(:any)/(:any)/(:num)'] = 'articles/show/$2/$3';
//   base_url() / yazar_adi / article_slug / id

$route['dashboard/(.+)'] = '$1';

$route['404_override'] = '';

$route['translate_uri_dashes'] = FALSE;
