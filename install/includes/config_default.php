<?php
	$settings = array(


        ###### ADMIN ######
        'admin' => array(
            'max_upload_size' => '5242880',
            'upload_blacklist' => '/\\.(?:php[34567s]?|phtml)$/i',
        ),
        ########


        ###### SYMPHONY ######
        'symphony' => array(
            'pagination_maximum_rows' => 99999,
            'lang' => 'en',
            'version' => '2.7.10',
            'pages_table_nest_children' => 'yes',
            'cookie_prefix' => 'sym-',
            'session_gc_divisor' => '10',
            'association_maximum_rows' => '5',
            'cell_truncation_length' => '75',
            'admin-path' => 'symphony',
            'enable_xsrf' => 'no',
        ),
        ########


        ###### LOG ######
        'log' => array(
            'archive' => '1',
            'maxsize' => '102400',
            'filter' => 24575,
        ),
        ########


        ###### GENERAL ######
        'general' => array(
            'sitename' => 'To Do List',
            'useragent' => 'Symphony/2.7.10',
        ),
        ########


        ###### IMAGE ######
        'image' => array(
            'cache' => '1',
            'quality' => '90',
        ),
        ########


        ###### DATABASE ######
        'database' => array(
            'query_caching' => 'default',
            'host' => 'localhost',
            'port' => '3306',
            'user' => null,
            'password' => null,
            'db' => null,
            'tbl_prefix' => 'sym_',
        ),
        ########


        ###### PUBLIC ######
        'public' => array(
            'display_event_xml_in_source' => 'no',
        ),
        ########


        ###### REGION ######
        'region' => array(
            'time_format' => 'g:i a',
            'date_format' => 'd F Y',
            'timezone' => 'America/Vancouver',
            'datetime_separator' => ' ',
        ),
        ########


        ###### MAINTENANCE_MODE ######
        'maintenance_mode' => array(
            'enabled' => 'no',
        ),
        ########


        ###### FILE ######
        'file' => array(
            'write_mode' => '0775',
        ),
        ########


        ###### DIRECTORY ######
        'directory' => array(
            'write_mode' => '0775',
        ),
        ########


        ###### SORTING ######
        'sorting' => array(
            'section_lists_sortby' => '9',
            'section_lists_order' => 'asc',
            'section_items_sortby' => '4',
            'section_items_order' => 'asc',
            'section_preferences_sortby' => null,
            'section_preferences_order' => 'asc',
        ),
        ########
    );
