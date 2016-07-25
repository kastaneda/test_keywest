<?php

require_once __DIR__.'/../vendor/autoload.php'; 

$app = new Silex\Application(); 
$app['debug'] = true;

$app->register(new Silex\Provider\DoctrineServiceProvider(),
    include __DIR__ . '/../config.php');

$app->get('/', function() use($app) { 
    return 'Hello, Silex!'; 
}); 

$app->get('/hello/{name}', function($name) use ($app) {
    return 'Hello ' . $app->escape($name);
});

$app->run(); 
