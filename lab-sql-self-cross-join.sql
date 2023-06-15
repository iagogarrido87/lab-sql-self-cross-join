-- 1. Get all pairs of actors that worked together.
SELECT DISTINCT a1.actor_id, a1.first_name, a1.last_name, a2.actor_id, a2.first_name, a2.last_name
FROM actor a1
JOIN film_actor fa1 ON a1.actor_id = fa1.actor_id
JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
JOIN actor a2 ON fa2.actor_id = a2.actor_id
WHERE a1.actor_id <> a2.actor_id
AND a1.actor_id < a2.actor_id
ORDER BY a1.actor_id, a2.actor_id;

-- 2. Get all pairs of customers that have rented the same film more than 3 times.
SELECT DISTINCT c1.customer_id, c1.first_name, c1.last_name, c2.customer_id, c2.first_name, c2.last_name
FROM customer c1
JOIN rental r1 ON c1.customer_id = r1.customer_id
JOIN rental r2 ON r1.inventory_id = r2.inventory_id
JOIN customer c2 ON r2.customer_id = c2.customer_id
WHERE c1.customer_id <> c2.customer_id
AND c1.customer_id < c2.customer_id
GROUP BY c1.customer_id, c2.customer_id
HAVING COUNT(DISTINCT r1.rental_id) > 3
ORDER BY c1.customer_id, c2.customer_id;

-- 3. Get all possible pairs of actors and films.
SELECT a.actor_id, a.first_name, a.last_name, f.film_id, f.title
FROM actor a
CROSS JOIN film f
ORDER BY a.actor_id, f.film_id;

