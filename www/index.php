<?php

require_once __DIR__.'/../vendor/autoload.php'; 

$app = new Silex\Application(); 
$app['debug'] = true;

$app->register(new Silex\Provider\DoctrineServiceProvider(),
    include __DIR__ . '/../config.php');

$app->get('/v1/bookmark/latest', function () use ($app) {
    $sql = "SELECT * FROM bookmark ORDER BY created_at DESC LIMIT 0,10";
    $data = $app['db']->fetchAll($sql);

    return $app->json($data);
}); 

$app->get('/v1/bookmark/{url}', function ($url) use ($app) {
    $sql = 'SELECT * FROM bookmark WHERE url = ?';
    $data = $app['db']->fetchAssoc($sql, [$url]);
    if ($data) {
        $sql = 'SELECT id, created_at, ip, `text` FROM comment WHERE bookmark_id = ?';
        $data['comments'] = $app['db']->fetchAll($sql, [$data['id']]);
        return $app->json($data);
    } else {
        $app->abort(404);
    }
})->assert('url', 'http.+');

$app->put('/v1/bookmark/{url}', function ($url) use ($app) {
    $app->abort(403); // TBD
})->assert('url', 'http.+');

$app->post('/v1/bookmark/{id}', function ($id) use ($app) {
    $app->abort(403); // TBD
})->assert('id', '\d+');

$app->put('/v1/comment/{id}', function ($id) use ($app) {
    $app->abort(403); // TBD
})->assert('id', '\d+');

$app->delete('/v1/comment/{id}', function ($id) use ($app) {
    $app->abort(403); // TBD
})->assert('id', '\d+');

$app->run(); 
