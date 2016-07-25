<?php

require_once __DIR__.'/../vendor/autoload.php'; 

$app = new Silex\Application(); 
$app['debug'] = true;

$app->register(new Silex\Provider\DoctrineServiceProvider(),
    include __DIR__ . '/../config.php');

$app->get('/comments-api/v1/latest', function() use ($app) {
    $sql = "SELECT * FROM bookmark ORDER BY created_at DESC LIMIT 0,10;";
    $data = $app['db']->fetchAll($sql, array((int) $id));

    return $app->json($data);
}); 

$app->run(); 
