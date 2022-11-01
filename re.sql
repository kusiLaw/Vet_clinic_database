
-- spices
 id |  name   
----+---------
  1 | Pokemon
  2 | Digimon
(2 rows)



-- specializations
 species_id | vets_id 
------------+---------
          1 |       1
          2 |       3
          1 |       3
          2 |       4
(4 rows)

-- vets
 id |       name       | age | date_of_graduation 
----+------------------+-----+--------------------
  1 | William Tatcher  |  45 | 2000-04-23
  2 | Maisy Smith      |  26 | 2019-01-17
  3 | Stephanie Mendez |  64 | 1981-05-04
  4 | Jack Harkness    |  38 | 2008-06-08
(4 rows)
, 

SELECT animals.name , species.name FROM animals INNER JOIN visits ON 
animals.id = visits.animals_id INNER JOIN
vets ON vets.id = visits.vets_id LEFT JOIN species
on species.id = animals.species_id
WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_visited ;





 
-- animals
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species_id | owner_id 
----+------------+---------------+-----------------+----------+-----------+------------+----------
  8 | Agumon     | 2020-02-03    |               0 | t        |     10.23 |          2 |        1
  9 | Gabumon    | 2018-11-15    |               2 | t        |         8 |          2 |        2
 10 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 |          1 |        2
  2 | Plantmon   | 2021-11-15    |               2 | t        |       5.7 |          2 |        3
 11 | Devimon    | 2017-05-12    |               5 | t        |        11 |          2 |        3
  6 | Blossom    | 1998-10-13    |               3 | t        |        17 |          1 |        4
  1 | Charmander | 2020-02-08    |               0 | f        |        11 |          1 |        4
  3 | Squirtle   | 1993-04-02    |               3 | f        |     12.13 |          1 |        4
  5 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 |          2 |        5
  4 | Angemon    | 2005-06-12    |               1 | t        |        45 |          2 |        5
(10 rows)

-- visits table
 animals_id | vets_id | date_visited 
------------+---------+--------------
          8 |       1 | 2020-05-24
          8 |       3 | 2020-07-22
          9 |       4 | 2021-02-02
         10 |       2 | 2020-01-05
         10 |       2 | 2020-03-08
         10 |       2 | 2020-05-14
         11 |       3 | 2021-05-04
          1 |       4 | 2021-02-24
          2 |       2 | 2019-12-21
          2 |       1 | 2020-08-10
          2 |       2 | 2021-04-07
          3 |       3 | 2019-09-29
          4 |       4 | 2020-10-03
          4 |       4 | 2020-11-04
          5 |       2 | 2019-01-24
          5 |       2 | 2019-05-15
          5 |       2 | 2020-02-27
          5 |       2 | 2020-08-03
          6 |       3 | 2020-05-24
          6 |       1 | 2021-01-11
(20 rows)



-- owners
 id |    full_name    | age 
----+-----------------+-----
  1 | Sam Smith       |  34
  2 | Jennifer Orwell |  19
  4 | Melody Pond     |  77
  5 | Dean Winchester |  14
  6 | Jodie Whittaker |  38
  3 | Bob             |  45
(6 rows)
