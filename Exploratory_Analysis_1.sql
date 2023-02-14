SELECT a.Name as Artist_Name,
	al.Title as Album_Title,
	g.name as Genre,
	t.composer,
	t.Name as Track_Name,
	t.UnitPrice as Track_Price,
	i.InvoiceId,
	il.TrackId as Invoice_TrackId, 
	(il.Quantity * il.UnitPrice) AS Invoice_Track_Price,
	c.SupportRepId,
	e.FirstName || " " || e.LastName as SalesRep_Name,
	e.Title as SalesRep_Title,
	e.City as SalesRep_City,
	e.State as SalesRep_State,
	e.Country as SalesRep_Country,
	c.CustomerId,
	c.FirstName || " " || c.LastName as Customer_Name,
	c.City as Customer_City,
	c.State as Customer_State,
	c.Country as Customer_Country
FROM
	Artist a
LEFT JOIN album al ON
	a.artistID = al.ArtistId
LEFT JOIN track t ON
	t.AlbumId = al.AlbumId
LEFT JOIN genre g ON
	g.GenreId = t.GenreId
LEFT JOIN InvoiceLine il ON
	il.TrackId = t.TrackId 
LEFT JOIN Invoice i ON
	i.InvoiceId = il.InvoiceId 
LEFT JOIN Customer c ON 
	c.CustomerId = i.CustomerId 
LEFT JOIN Employee e ON
	e.EmployeeId = c.SupportRepId 

