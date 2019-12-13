<?php
define('DB_DIR', '/data');
define('DB_FILE', 'my-wordpress-sqlite-db');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

$table_prefix  = 'wp_';

$protocol = 'http';
if( isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https' ) {
  $_SERVER['HTTPS']='on';
  $protocol = 'https';
}

define('WP_SITEURL', $protocol . '://' . $_SERVER['HTTP_HOST']);
define('WP_HOME', $protocol . '://' . $_SERVER['HTTP_HOST']);

if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');
