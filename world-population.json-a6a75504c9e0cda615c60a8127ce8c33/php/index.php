<?php
require_once("database.php");

$db = new database();
$connection = $db -> getConnection();

$jsonContent_jq = file_Get_contents('world-population.json');
$jsonContent_country = file_Get_contents('country.json');
$jsonContent_continent = file_Get_contents('continent.json');
$jsonContent_population = file_Get_contents('population.json');

$phpContent_jq = json_decode($jsonContent_jq, true);
$phpContent_country = json_decode($jsonContent_country, true);
$phpContent_continent = json_decode($jsonContent_continent, true);
$phpContent_population = json_decode($jsonContent_population, true);

for ($i = 0; $i < count($phpContent_continent); $i++) {
    $db -> push_continent(
        $phpContent_continent[$i]['id'], 
        $phpContent_continent[$i]['continent']);
}

for ($i = 0; $i < count($phpContent_jq); $i++) {
    $db -> push_jq(
        $phpContent_jq[$i]['rank'], 
        $phpContent_jq[$i]['cca3'], 
        $phpContent_jq[$i]['country'], 
        $phpContent_jq[$i]['capital'], 
        $phpContent_jq[$i]['continent'], 
        $phpContent_jq[$i]['population_2022'], 
        $phpContent_jq[$i]['population_2020'], 
        $phpContent_jq[$i]['population_2015'], 
        $phpContent_jq[$i]['population_2010'], 
        $phpContent_jq[$i]['population_2000'], 
        $phpContent_jq[$i]['population_1990'], 
        $phpContent_jq[$i]['population_1980'], 
        $phpContent_jq[$i]['population_1970'], 
        $phpContent_jq[$i]['area_km2'], 
        $phpContent_jq[$i]['population_density'], 
        $phpContent_jq[$i]['population_growth_rate'], 
        $phpContent_jq[$i]['percentage_world_population']);
    
    $db -> push_country(
        $phpContent_country[$i]['rank'], 
        $phpContent_country[$i]['cca3'], 
        $phpContent_country[$i]['country'],
        $phpContent_country[$i]['capital'],
        $phpContent_country[$i]['area_km2'],
        $phpContent_country[$i]['id']);
}

for ($i = 0; $i < count($phpContent_population); $i++) {
    $db -> push_population(
        $phpContent_population[$i]['rank'], 
        $phpContent_population[$i]['year'], 
        $phpContent_population[$i]['population']);
}