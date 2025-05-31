--Query 1: Top 5 Selling Genres--
SELECT genre.name AS Genre, SUM(invoice_line.unit_price*invoice_line.quantity) AS Total_Sales
FROM invoice_line
join track ON invoice_line.track_id=track.track_id
join genre ON genre.genre_id=track.genre_id
GROUP BY genre.name
ORDER BY Total_Sales DESC
LIMIT 5;

--Query 2: Top 5 Customers by Total Spend--
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, SUM(invoice.total) AS total_spent
FROM customer
JOIN invoice ON customer.customer_id=invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total_spent DESC
LIMIT 5;

--Query 3: Revenue by Employee (Sales Agent)--
SELECT CONCAT(employee.first_name,' ',employee.last_name) AS Sales_agent,
SUM(invoice.total) AS Revenue_Generated
FROM invoice
JOIN customer ON invoice.customer_id=customer.customer_id
JOIN employee ON employee.employee_id=customer.support_rep_id
GROUP BY Sales_agent
ORDER BY Revenue_Generated DESC;

--Query 4: Average Invoice Total by Country--
SELECT billing_country, ROUND(AVG(total),2) AS Average_Invoice FROM invoice
GROUP BY billing_country
ORDER BY Average_Invoice  DESC

--Query 5: Transactions per Country--
SELECT billing_country, COUNT(invoice_id) AS Num_of_Transactions
FROM invoice
GROUP BY billing_country
ORDER BY Num_of_Transactions DESC;