# Loading data
$path = "C:\xampp\htdocs\educom-data-science-1731413973\world-population.json-a6a75504c9e0cda615c60a8127ce8c33\world-population.json"
$jsonContent = Get-Content -Path $path -Raw

# Setting it to language UTF8
$utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False

# Exercise 1
$jsonContent | jq 'map({
    country: .country,
    density_1970: (.population_1970 / .area_km2)
    }) |
    (.[0] | keys_unsorted) as $keys |
    $keys,
    map([.[$keys[]]])[] | @csv' > "C:\Users\zoy\Downloads\world-population.json-a6a75504c9e0cda615c60a8127ce8c33\world-population-ex1.csv"
    
# Exercise 2
$jsonContent | jq '
    group_by(.continent) |
    map({
    continent: .[0].continent,
    difference:
    (([.[].population_2022] | add) - ([.[].population_1970] | add))
    }) |
    (.[0] | keys_unsorted) as $keys |
    $keys,
    map([.[$keys[]]])[] | @csv' > "C:\Users\zoy\Downloads\world-population.json-a6a75504c9e0cda615c60a8127ce8c33\world-population-ex2.csv"

# Exercise 3
$jsonContent | jq '
    group_by(.continent) |
    map({
    continent: .[0].continent,
    population_1970: ([.[].population_1970] | add),
    population_1980: ([.[].population_1980] | add),
    population_1990: ([.[].population_1990] | add),
    population_2000: ([.[].population_2000] | add),
    population_2010: ([.[].population_2010] | add),
    population_2015: ([.[].population_2015] | add),
    population_2020: ([.[].population_2020] | add),
    population_2022: ([.[].population_2020] | add)
    }) |
    (.[0] | keys_unsorted) as $keys |
    $keys,
    map([.[$keys[]]])[] | @csv' > "C:\Users\zoy\Downloads\world-population.json-a6a75504c9e0cda615c60a8127ce8c33\world-population-ex3.csv"

# Exercise 4
$total_2022 = $jsonContent | jq -c '[.[] | .population_2022] | add'
$total_2020 = $jsonContent | jq -c '[.[] | .population_2020] | add'
$total_2015 = $jsonContent | jq -c '[.[] | .population_2015] | add'
$total_2010 = $jsonContent | jq -c '[.[] | .population_2010] | add'
$total_2000 = $jsonContent | jq -c '[.[] | .population_2000] | add'
$total_1990 = $jsonContent | jq -c '[.[] | .population_1990] | add'
$total_1980 = $jsonContent | jq -c '[.[] | .population_1980] | add'
$total_1970 = $jsonContent | jq -c '[.[] | .population_1970] | add'

$jsonContent | jq --argjson total_1970 "$total_1970" --argjson total_1980 "$total_1980" --argjson total_1990 "$total_1990" --argjson total_2000 "$total_2000" --argjson total_2010 "$total_2010" --argjson total_2015 "$total_2015" --argjson total_2020 "$total_2020" --argjson total_2022 "$total_2022"'
    group_by(.continent) |
    map({
    continent: .[0].continent,
    percentage_1970: (([.[] | .population_1970] | add) / $total_1970),
    percentage_1980: (([.[] | .population_1980] | add) / $total_1980),
    percentage_1990: (([.[] | .population_1990] | add) / $total_1990),
    percentage_2000: (([.[] | .population_2000] | add) / $total_2000),
    percentage_2010: (([.[] | .population_2010] | add) / $total_2010),
    percentage_2015: (([.[] | .population_2015] | add) / $total_2015),
    percentage_2020: (([.[] | .population_2020] | add) / $total_2020),
    percentage_2022: (([.[] | .population_2022] | add) / $total_2022)
    }) |
    (.[0] | keys_unsorted) as $keys |
    $keys,
    map([.[$keys[]]])[] | @csv' > "C:\Users\zoy\Downloads\world-population.json-a6a75504c9e0cda615c60a8127ce8c33\world-population-ex4.csv"

# Exercise 5
$jsonContent | jq '
    group_by(.continent) |
    map({
    continent: .[0].continent,
    percenrage_groei_1980: ((([.[] | .population_1980] | add) - ([.[] | .population_1970] | add)) / ([.[] | .population_1970] | add) * 100),
    percenrage_groei_1990: ((([.[] | .population_1990] | add) - ([.[] | .population_1970] | add)) / ([.[] | .population_1970] | add) * 100),
    percenrage_groei_2000: ((([.[] | .population_2000] | add) - ([.[] | .population_1970] | add)) / ([.[] | .population_1970] | add) * 100),
    percenrage_groei_2010: ((([.[] | .population_2010] | add) - ([.[] | .population_1970] | add)) / ([.[] | .population_1970] | add) * 100),
    percenrage_groei_2015: ((([.[] | .population_2015] | add) - ([.[] | .population_1970] | add)) / ([.[] | .population_1970] | add) * 100),
    percenrage_groei_2020: ((([.[] | .population_2020] | add) - ([.[] | .population_1970] | add)) / ([.[] | .population_1970] | add) * 100),
    percenrage_groei_2022: ((([.[] | .population_2022] | add) - ([.[] | .population_1970] | add)) / ([.[] | .population_1970] | add) * 100)
    }) |
    (.[0] | keys_unsorted) as $keys |
    $keys,
    map([.[$keys[]]])[] | @csv' > "C:\Users\zoy\Downloads\world-population.json-a6a75504c9e0cda615c60a8127ce8c33\world-population-ex5.csv"

# Exercise 7
$jsonContent | jq 'map({
    rank: .rank,
    cca3: .cca3,
    country: .country,
    capital: .capital,
    continent: .continent,
    population: [
    {year: 2022, population: .population_2022},
    {year: 2020, population: .population_2020},
    {year: 2015, population: .population_2015},
    {year: 2010, population: .population_2010},
    {year: 2000, population: .population_2000},
    {year: 1990, population: .population_1990},
    {year: 1980, population: .population_1980},
    {year: 1970, population: .population_1970}],
    area_km2: .area_km2,
    population_density: .population_density,
    population_growth_rate: .population_growth_rate,
    percentage_world_population: .percentage_world_population
    })'
    
# Exercise 8
# Creating a UTF8 doc
$streamWriter = [System.IO.StreamWriter]::new(
    "C:\xampp\htdocs\educom-data-science-1731413973\world-population.json-a6a75504c9e0cda615c60a8127ce8c33\php\population.json",
    $False,
    $utf8NoBomEncoding
    )
        
$jsonContent | jq '[.[] |
    {rank: .rank, year: 2022, population: .population_2022},
    {rank: .rank, year: 2020, population: .population_2020},
    {rank: .rank, year: 2015, population: .population_2015},
    {rank: .rank, year: 2010, population: .population_2010},
    {rank: .rank, year: 2000, population: .population_2000},
    {rank: .rank, year: 1990, population: .population_1990},
    {rank: .rank, year: 1980, population: .population_1980},
    {rank: .rank, year: 1970, population: .population_1970}]' |
    ForEach-Object{
    $streamWriter.WriteLine($_)
    }
        
$streamWriter.close()
  

$streamWriter = [System.IO.StreamWriter]::new(
    "C:\xampp\htdocs\educom-data-science-1731413973\world-population.json-a6a75504c9e0cda615c60a8127ce8c33\php\continent.json",
    $False,
    $utf8NoBomEncoding
    )

$jsonContent | jq '[.[] |
    {rank: .rank, year: 2022, population: .population_2022},
    {rank: .rank, year: 2020, population: .population_2020},
    {rank: .rank, year: 2015, population: .population_2015},
    {rank: .rank, year: 2010, population: .population_2010},
    {rank: .rank, year: 2000, population: .population_2000},
    {rank: .rank, year: 1990, population: .population_1990},
    {rank: .rank, year: 1980, population: .population_1980},
    {rank: .rank, year: 1970, population: .population_1970}]' |
    ForEach-Object{
    $streamWriter.WriteLine($_)
    }

$streamWriter.close()


$streamWriter = [System.IO.StreamWriter]::new(
    "C:\xampp\htdocs\educom-data-science-1731413973\world-population.json-a6a75504c9e0cda615c60a8127ce8c33\php\country.json",
    $False,
    $utf8NoBomEncoding
    )

$continent = $jsonContent | jq 'map(
    .continent)
    | unique
    | [range(0; length) as $i
    | {id: $i, continent: .[$i]}]'
        
$powerShellContent = $jsonContent | ConvertFrom-Json
$continent = $continent | ConvertFrom-Json
$combinedData = @()
        
foreach ($item in $powerShellContent) {
    $id = ($continent | Where-Object {$_.continent -eq $item.continent}).id
    $newItem = [PSCustomObject]@{
    rank = $item.rank
    cca3 = $item.cca3
    country = $item.country
    capital = $item.capital
    area_km2 = $item.area_km2
    id = $id
    }
$combinedData += $newItem
}
        
$jsonCombinedData = $combinedData | ConvertTo-Json -Depth 5
$streamWriter.WriteLine($jsonCombinedData)

$streamWriter.close()