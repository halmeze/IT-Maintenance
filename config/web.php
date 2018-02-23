<?php

$params = require(__DIR__ . '/params.php');

$config = [
    'id' => 'basic',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
	'language' => 'th',
	
	'modules' => [
		'user' => [
			'class' => 'dektrium\user\Module',
			'enableUnconfirmedLogin' => true,
			'confirmWithin' => 21600,
			'cost' => 12,
			'admins' => ['admin']
		],
		'gridview' =>  [
			'class' => '\kartik\grid\Module'
		]
	],
	
    'components' => [

        'mycomponent' => [
 
            'class' => 'app\components\MyComponent',
 
           ],

        'assetManager' => [
            'bundles' => [
                'yii\bootstrap\BootstrapAsset' => false,
            ],
        ],
        
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => 'xpZ_dnlkrYzwM1sy5v-do-kPTwoFyz7I',
        ],
        'formatter' => [

		   'defaultTimeZone' => 'UTC',
		   'timeZone' => 'Asia/Bangkok',
		   'dateFormat' => 'php:d-m-Y',
		   'datetimeFormat'=>'php:d-M-Y H:i:s'
		   
        ],
		
		'session' => [
            'name' => '_it_web_application', // 
            'savePath' => __DIR__ . '/../runtime', // a temporary folder 
        ],
		
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'user' => [
            //'identityClass' => 'app\models\User',
            'identityClass' => 'dektrium\user\models\User',
            'enableAutoLogin' => true,
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'mailer' => [
           'class' => 'yii\swiftmailer\Mailer',
                'viewPath' => '@app/mail',
                'useFileTransport' => $params['active'] ,
                'transport' => [
                    'class' => 'Swift_SmtpTransport',
                    'host' => $params['host'],
                    'username' => $params['adminEmail'] ,
                    'password' => $params['password'],
                    'port' => '587',
                    'encryption' => 'tls',
                ],
            ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'db' => require(__DIR__ . '/db.php'),
    /*
      'urlManager' => [
      'enablePrettyUrl' => true,
      'showScriptName' => false,
      'rules' => [
      ],
      ],
     */
    ],
    'params' => $params,
];

if (YII_ENV_DEV) {
    // configuration adjustments for 'dev' environment
    /*$config['bootstrap'][] = 'debug';
    $config['modules']['debug'] = [
        'class' => 'yii\debug\Module',
    ];*/

   /* $config['bootstrap'][] = 'gii';
    $config['modules']['gii'] = [
        'class' => 'yii\gii\Module',
    ];
    */
}

return $config;
