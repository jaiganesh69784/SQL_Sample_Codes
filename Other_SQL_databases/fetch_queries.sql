-- Query 1: Get all guest details with Suite room preferences
SELECT * FROM Guest WHERE Preferences LIKE '%Suite%' AND Preferences LIKE '%Vegetarian%';

-- Query 2: List all confirmed reservations with future check-in dates
SELECT * FROM Reservation WHERE ReservationStatus = 'Confirmed' AND CheckInDate >= CURDATE();

-- Query 3: Get names and roles of employees working on Friday
SELECT Name, Role FROM Employee WHERE WorkSchedule LIKE '%Fri%';

-- Query 4: Fetch available room details (Room Number, Room Type, Price)
SELECT RoomNumber, RoomType, PricePerNight FROM Room WHERE AvailabilityStatus = 'Available';

-- Query 5: Find guests who gave a rating of 4 or higher in their feedback
SELECT g.Name, f.Rating, f.Comments
FROM Guest g
JOIN FeedbackReview f ON g.GuestID = f.GuestID
WHERE f.Rating >= 4;

-- Query 6: List all services availed by a specific guest (GuestID = 1)
SELECT s.ServiceType, s.PricePerService
FROM ServiceFacilities s
WHERE s.GuestID = 1;

-- Query 7: Calculate the total room charges for a specific reservation (ReservationID = 1)
SELECT RoomCharges + COALESCE(SUM(AdditionalServices), 0) AS TotalCharges
FROM BillingPayment
WHERE ReservationID = 1
GROUP BY ReservationID;

-- Query 8: Fetch guest names and contact details for those who booked a "Suite" room
SELECT g.Name, g.Phone, g.Email
FROM Guest g
JOIN Reservation r ON g.GuestID = r.GuestID
JOIN Room ro ON r.RoomID = ro.RoomID
WHERE ro.RoomType = 'Suite';

-- Query 9: Find employees with performance reviews mentioning "excellent"
SELECT Name, Role FROM Employee WHERE PerformanceReviews LIKE '%excellent%';

-- Query 10: List reservations with pending payment status, along with guest names
SELECT g.Name, r.ReservationID, r.CheckInDate, r.CheckOutDate
FROM Guest g
JOIN Reservation r ON g.GuestID = r.GuestID
WHERE r.PaymentStatus = 'Pending';

-- Query 11: Retrieve the number of rooms available by room type
SELECT RoomType, COUNT(*) AS AvailableRooms
FROM Room
WHERE AvailabilityStatus = 'Available'
GROUP BY RoomType;

-- Query 12: List all inventory items that are under maintenance
SELECT ItemName, QuantityAvailable FROM InventoryHousekeeping WHERE RoomStatus = 'Under Maintenance';

-- Query 13: Find the top 3 employees with the highest salaries
SELECT Name, Role, Salary
FROM Employee
ORDER BY Salary DESC
LIMIT 3;

-- Query 14: Get the average rating given by each guest in feedback
SELECT GuestID, AVG(Rating) AS AverageRating
FROM FeedbackReview
GROUP BY GuestID;

-- Query 15: List all upcoming events sorted by date
SELECT EventType, EventDateTime, VenueRoomAllocated
FROM EventsBookings
WHERE EventDateTime >= CURDATE()
ORDER BY EventDateTime ASC;

-- Query 16: Retrieve guests who have earned more than 100 loyalty points
SELECT g.Name, l.PointsEarned, l.RewardTier
FROM Guest g
JOIN LoyaltyRewards l ON g.GuestID = l.GuestID
WHERE l.PointsEarned > 100;

-- Query 17: Find all rooms where housekeeping status is “Dirty”
SELECT RoomNumber, RoomType FROM Room WHERE HousekeepingStatus = 'Dirty';

-- Query 18: Fetch guest names and their special requests for upcoming reservations
SELECT g.Name, r.SpecialRequests
FROM Guest g
JOIN Reservation r ON g.GuestID = r.GuestID
WHERE r.CheckInDate >= CURDATE() AND r.SpecialRequests IS NOT NULL;

-- Query 19: Show total revenue generated from confirmed reservations
SELECT SUM(RoomCharges + COALESCE(AdditionalServices, 0)) AS TotalRevenue
FROM BillingPayment
JOIN Reservation r ON BillingPayment.ReservationID = r.ReservationID
WHERE r.ReservationStatus = 'Confirmed';

-- Query 20: Get details of events involving external organizers (no GuestID)
SELECT EventType, OrganizerContact, EventDateTime, VenueRoomAllocated
FROM EventsBookings
WHERE GuestID IS NULL;
