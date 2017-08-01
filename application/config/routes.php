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
$route['default_controller'] = 'home';
$route['login'] = 'authentication/panel_login';
$route['logout'] = 'authentication/panel_logout';
$route['register'] = 'authentication/panel_register';
$route['panel'] = 'dashboard/panel';
$route['panel/(:any)'] = 'dashboard/panel/$1';
$route['dashboard'] = 'dashboard/index';
$route['dashboard/logout'] = 'authentication/dashboard_logout';

//eğer base_url den sonra yukarıdakilerden farklı bir veri gelirse
//sayfa olarak değerlendir. (Örn: http://example.com/iletisim => http://example.com/pages/show/iletisim)
$route['(:any)'] = 'pages/show/$1';

$route['haber/(:any)'] = 'news/show/$1';
$route['video/(:any)'] = 'videos/show/$1';
$route['galeri/(:any)'] = 'galleries/show/$1';

$route['dashboard/comments'] = 'comments';
$route['dashboard/comments/(:any)'] = 'comments/$1';
$route['dashboard/comments/(:any)/(:any)'] = 'comments/$1/$2';

$route['dashboard/logs'] = 'logs';
$route['dashboard/logs/(:any)'] = 'logs/$1';
$route['dashboard/logs/(:any)/(:any)'] = 'logs/$1/$2';

$route['dashboard/pages'] = 'pages';
$route['dashboard/pages/(:any)'] = 'pages/$1';
$route['dashboard/pages/(:any)/(:any)'] = 'pages/$1/$2';

$route['dashboard/articles'] = 'articles';
$route['dashboard/articles/(:any)'] = 'articles/$1';
$route['dashboard/articles/(:any)/(:any)'] = 'articles/$1/$2';

$route['dashboard/subscribers'] = 'subscribers';
$route['dashboard/subscribers/(:any)'] = 'subscribers/$1';
$route['dashboard/subscribers/(:any)/(:any)'] = 'subscribers/$1/$2';

$route['dashboard/users'] = 'users';
$route['dashboard/users/(:any)'] = 'users/$1';
$route['dashboard/users/(:any)/(:any)'] = 'users/$1/$2';

$route['dashboard/(:any)'] = 'dashboard/dashboard/$1';

$route['404_override'] = '';

$route['translate_uri_dashes'] = FALSE;
