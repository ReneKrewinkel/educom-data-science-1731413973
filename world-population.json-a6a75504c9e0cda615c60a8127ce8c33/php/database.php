<?php 
define("USER", "root");
define("PASSWORD", "");
define("DATABASE", "jq");
define("HOST", "localhost");

class database {

    private $connection;

    public function __construct() {
       $this->connection = mysqli_connect(HOST,                                          
                                         USER, 
                                         PASSWORD,
                                         DATABASE );
    }

    public function getConnection() {
        return($this->connection);
    }

    public function push_jq(
        $rank, 
        $cca3, 
        $country, 
        $capital, 
        $continent, 
        $population_2022, 
        $population_2020, 
        $population_2015,
        $population_2010,
        $population_2000,
        $population_1990,
        $population_1980,
        $population_1970,
        $area_km2,
        $population_density,
        $population_growth_rate,
        $percentage_world_population) {
    
        $cca3 = $this -> escape_string($cca3);
        $country = $this -> escape_string($country);
        $capital = $this -> escape_string($capital);
        $continent = $this -> escape_string($continent);

        $sql = "INSERT INTO jq (
            rank, 
            cca3, 
            country, 
            capital, 
            continent,
            population_2022,
            population_2020, 
            population_2015, 
            population_2010,
            population_2000,
            population_1990,
            population_1980,
            population_1970,
            area_km2,
            population_density,
            population_growth_rate,
            percentage_world_population) VALUES ($rank, 
            '$cca3', 
            '$country', 
            '$capital', 
            '$continent',
            $population_2022,
            $population_2020, 
            $population_2015, 
            $population_2010,
            $population_2000,
            $population_1990,
            $population_1980,
            $population_1970,
            $area_km2,
            $population_density,
            $population_growth_rate,
            $percentage_world_population)";

        //    if ($rank == 209 ) echo($sql);
        $result = mysqli_query($this -> connection, $sql);
    }

    public function push_continent(
        $continent_id,
        $naam) {
    
        $naam = $this -> escape_string($naam);
    
        $sql = "INSERT INTO continent (
            continent_id,
            naam) VALUES (
            $continent_id,
            '$naam')";

        $result = mysqli_query($this -> connection, $sql);
    }

    public function push_country(
        $rank,
        $cca3,
        $country,
        $capital,
        $area_km2,
        $continent_id) {
    
        $cca3 = $this -> escape_string($cca3);
        $country = $this -> escape_string($country);
        $capital = $this -> escape_string($capital);

        $sql = "INSERT INTO country (
            rank,
            cca3,
            country,
            capital,
            area_km2,
            continent_id) VALUES (
            $rank,
            '$cca3',
            '$country',
            '$capital',
            $area_km2,
            $continent_id)";
        $result = mysqli_query($this -> connection, $sql);
    }

    public function push_population(
        $rank,
        $year,
        $population) {
    
        $sql = "INSERT INTO population (
            rank,
            year,
            population
            ) VALUES (
            $rank,
            $year,
            $population)";
        $result = mysqli_query($this -> connection, $sql);
    }

    private function escape_string($string){
        return $this -> connection -> real_escape_string($string);
    }

}
