/*1. Actores que tienen de primer nombre ‘Scarlett’.*/

SELECT * FROM actor WHERE first_name = 'Scarlett'; 

/*2. Actores que tienen de apellido ‘Johansson’.*/

SELECT * FROM actor WHERE last_name = 'Johansson';

/*3. Actores que contengan una ‘O’ en su nombre.*/

SELECT * FROM actor WHERE first_name LIKE '%o%'; 

/*4. Actores que contengan una ‘O’ en su nombre y en una ‘A’ en su apellido.*/

SELECT * FROM actor WHERE first_name LIKE '%o%' AND last_name LIKE '%a%'; 

/*5. Actores que contengan dos ‘O’ en su nombre y en una ‘A’ en su apellido.*/

SELECT * FROM actor WHERE first_name LIKE '%o%o%' AND last_name LIKE '%a%'; 

/*6. Actores donde su tercera letra sea ‘B’.*/

SELECT * FROM actor WHERE first_name LIKE '__b%'; 

/*7. Ciudades que empiezan por ‘a’.*/

SELECT * FROM city WHERE city.city LIKE 'A%';

/*8. Ciudades que acaban por ‘s’.*/

SELECT * FROM city WHERE city.city LIKE '%S';

/*9. Ciudades del country 61.*/

SELECT * FROM city WHERE city.country_id = 61;

/*10. Ciudades del country ‘Spain’.*/

SELECT a.* FROM city as a
LEFT JOIN country as b 
ON a.country_id = b.country_id 
WHERE b.country = 'Spain';

/*11. Ciudades con nombres compuestos.*/

SELECT * FROM city WHERE city.city LIKE '% %';

/*12. Películas con una duración entre 80 y 100.*/

SELECT * FROM film WHERE length BETWEEN 80 AND 100;

/*13. Peliculas con un rental_rate entre 1 y 3.*/

SELECT * FROM film WHERE rental_rate BETWEEN 1 AND 3;

/*14. Películas con un titulo de más de 12 letras.*/

SELECT * FROM film WHERE LENGTH(title)>12;

/*15. Peliculas con un rating de PG o G.*/

SELECT * FROM film WHERE rating IN ('PG','G');

/*16. Peliculas que no tengan un rating de NC-17.*/

SELECT * FROM film WHERE rating <> 'NC-17';

/*17. Peliculas con un rating PG y duracion de más de 120.*/

SELECT * FROM film WHERE rating = 'PG' AND length > 120;

/*18. ¿Cuantos actores hay?*/

SELECT COUNT(first_name) AS num_actor FROM actor; 

/*19. ¿Cuántas ciudades tiene el country ‘Spain’?*/

SELECT COUNT(*) AS num_cities FROM city as a
LEFT JOIN country as b 
ON a.country_id = b.country_id 
WHERE b.country = 'Spain';

/*20. ¿Cuántos countries hay que empiezan por ‘a’?*/

SELECT COUNT(*) AS num_countries FROM country WHERE country LIKE 'A%';

/*21. Media de duración de peliculas con PG*/

SELECT AVG(length) as media_duracion FROM film WHERE rating = 'PG';
 

/*22. Suma de rental_rate de todas las peliculas.*/

SELECT SUM(rental_rate) AS suma_rental FROM film;

/*23. Pelicula con mayor duración.*/

SELECT MAX(`length`) AS mayor_duracion FROM film;

/*24. Película con menor duración.*/

SELECT MIN(`length`) AS menor_duracion FROM film;

/*25. Mostrar las ciudades del country Spain (multitabla).*/

SELECT a.city, b.country AS num_cities FROM city as a
LEFT JOIN country as b 
ON a.country_id = b.country_id 
WHERE b.country = 'Spain';

/*26. Mostrar el nombre de la película y el nombre de los actores.*/

SELECT F.title, A.first_name, A.last_name FROM film_actor AS B
LEFT JOIN actor AS A
ON A.actor_id = B.actor_id 
LEFT JOIN film AS F
ON B.film_id = F.film_id ;

/*27. Mostrar el nombre de la película y el de sus categorías.*/

SELECT f.title, c.name as category FROM film_category fc
LEFT JOIN category c
ON c.category_id = fc.category_id 
LEFT JOIN film f
ON f.film_id = fc.film_id;

/*28. Mostrar el country, la ciudad y dirección de cada miembro del staff.*/

SELECT co.country, c.city, a.address, a.address2, s.first_name, s.last_name FROM staff s
LEFT JOIN address a ON s.address_id = a.address_id
LEFT JOIN city c ON a.city_id = c.city_id
LEFT JOIN country co ON co.country_id = c.country_id;

/*29. Mostrar el country, la ciudad y dirección de cada customer.*/

SELECT c.customer_id, c.first_name, c.last_name, co.country, ci.city, a.address  FROM customer c 
LEFT JOIN address a ON a.address_id = c.address_id 
LEFT JOIN city ci ON ci.city_id = a.city_id 
LEFT JOIN country co ON co.country_id = ci.country_id ;

/*30. Numero de películas de cada rating*/

SELECT rating, COUNT(*) as numero_peliculas FROM film f
GROUP BY rating ;

/*31. Cuantas películas ha realizado el actor ED CHASE.*/

SELECT a.first_name, a.last_name, COUNT(*) as numero_peliculas FROM film f
JOIN film_actor fa ON fa.film_id = f.film_id 
JOIN actor a ON a.actor_id = fa.actor_id 
WHERE a.first_name = 'ED' AND a.last_name = 'CHASE'
GROUP BY a.first_name, a.last_name;


/*32. Media de duración de las películas cada categoría.*/

SELECT c.name, AVG(f.`length`) as media_duracion FROM film f 
JOIN film_category fc ON fc.film_id = f.film_id 
JOIN category c ON c.category_id = fc.category_id 
GROUP BY c.name;
