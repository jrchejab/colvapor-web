<?php

use Illuminate\Support\Facades\Route;
use Statamic\Facades\Term;

Route::statamic('/', 'home', ['title' => 'Inicio', 'description' => 'COL VAPOR - Mas de 50 anos de experiencia en gestion de cadena de suministro industrial']);

Route::statamic('/productos/{category}', 'category', function ($category) {
    $term = Term::whereTaxonomy('categories')->where('slug', $category)->first();
    return [
        'title' => $term ? $term->get('title') : ucfirst($category),
        'category' => $category,
    ];
})->where('category', 'valvulas|tuberias|accesorios|instrumentacion|corrosion');
