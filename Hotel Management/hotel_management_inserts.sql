-- Guest Database
INSERT INTO Guest (GuestID, Name, Phone, Email, Address, Nationality, Preferences, PastStaysFeedback)
VALUES 
(1, 'Amit Sharma', '9876543210', 'amit.sharma@example.com', '21 MG Road, Mumbai', 'Indian', 'Suite, Vegetarian Meals', 'Excellent stay, loved the view'),
(2, 'Priya Menon', '9876543211', 'priya.menon@example.com', '55 Ashok Nagar, Bangalore', 'Indian', 'Double Room, Vegan Meals', 'Good service, but room was small'),
(3, 'Ravi Kumar', '9876543212', 'ravi.kumar@example.com', '12 Park Street, Kolkata', 'Indian', 'Single Room, Non-Veg Meals', 'Comfortable stay with quick service'),
(4, 'Sangeeta Verma', '9876543213', 'sangeeta.verma@example.com', '45 Sector 22, New Delhi', 'Indian', 'Suite, Jain Meals', 'Amazing amenities and friendly staff');

-- Reservation Database
INSERT INTO Reservation (ReservationID, GuestID, RoomID, CheckInDate, CheckOutDate, ReservationStatus, PaymentStatus, SpecialRequests)
VALUES 
(1, 1, 101, '2024-11-10', '2024-11-15', 'Confirmed', 'Paid', 'Extra pillows, airport pickup'),
(2, 2, 102, '2024-11-12', '2024-11-14', 'Pending', 'Unpaid', 'Early check-in'),
(3, 3, 103, '2024-11-15', '2024-11-20', 'Confirmed', 'Paid', 'High floor room'),
(4, 4, 104, '2024-11-18', '2024-11-22', 'Canceled', 'Refunded', 'Wheelchair accessible room');

-- Room Database
INSERT INTO Room (RoomID, RoomNumber, RoomType, AvailabilityStatus, PricePerNight, RoomAmenities, HousekeepingStatus)
VALUES 
(101, '101', 'Suite', 'Occupied', 5000.00, 'Wi-Fi, Air Conditioning, TV, Minibar', 'Clean'),
(102, '102', 'Double', 'Available', 3000.00, 'Wi-Fi, Air Conditioning, TV', 'Clean'),
(103, '103', 'Single', 'Occupied', 2000.00, 'Wi-Fi, Air Conditioning', 'Dirty'),
(104, '104', 'Suite', 'Available', 5000.00, 'Wi-Fi, Air Conditioning, TV, Minibar', 'Under Maintenance');

-- Employee Database
INSERT INTO Employee (EmployeeID, Name, Role, ContactDetails, WorkSchedule, Salary, PerformanceReviews)
VALUES 
(1, 'Rajesh Singh', 'Manager', '9876543215', 'Mon-Fri, 9am-5pm', 60000.00, 'Excellent leadership and customer service skills'),
(2, 'Meera Joshi', 'Housekeeping', '9876543216', 'Mon-Sat, 6am-2pm', 20000.00, 'Consistently thorough and reliable'),
(3, 'Anil Thakur', 'Front Desk', '9876543217', 'Mon-Fri, 2pm-10pm', 25000.00, 'Polite and efficient, with excellent guest feedback'),
(4, 'Pooja Patel', 'Room Service', '9876543218', 'Wed-Sun, 10am-6pm', 22000.00, 'Attentive to guest needs, very punctual');

-- Billing/Payment Database
INSERT INTO BillingPayment (TransactionID, GuestID, ReservationID, RoomCharges, AdditionalServices, PaymentMethod, PaymentStatus)
VALUES 
(1, 1, 1, 25000.00, 'Room Service, Laundry', 'Credit Card', 'Paid'),
(2, 2, 2, 6000.00, 'Room Service', 'Cash', 'Pending'),
(3, 3, 3, 10000.00, 'Spa, Mini Bar', 'Debit Card', 'Paid'),
(4, 4, 4, 5000.00, 'Early Check-in', 'Credit Card', 'Refunded');

-- Inventory/Housekeeping Database
INSERT INTO InventoryHousekeeping (InventoryID, ItemName, QuantityAvailable, RoomStatus, HousekeepingSchedule)
VALUES 
(1, 'Towels', 50, 'Clean', 'Daily'),
(2, 'Toiletries', 100, 'Clean', 'Daily'),
(3, 'Linens', 30, 'Dirty', 'Every 2 Days'),
(4, 'Pillows', 25, 'Under Maintenance', 'Weekly');

-- Service/Facilities Database
INSERT INTO ServiceFacilities (ServiceID, ServiceType, AvailabilityStatus, PricePerService, GuestID, ServiceFeedback)
VALUES 
(1, 'Room Service', 'Available', 500.00, 1, 'Prompt and polite'),
(2, 'Laundry', 'Available', 300.00, 2, 'Quick but could be better'),
(3, 'Spa', 'Available', 1500.00, 3, 'Relaxing experience'),
(4, 'Gym', 'Under Maintenance', 0.00, NULL, NULL);

-- Feedback/Review Database
INSERT INTO FeedbackReview (FeedbackID, GuestID, Rating, Comments, DateOfFeedback)
VALUES 
(1, 1, 5, 'Wonderful stay, would highly recommend!', '2024-11-16'),
(2, 2, 4, 'Good but room was a bit small', '2024-11-15'),
(3, 3, 5, 'Perfect experience, very relaxing', '2024-11-20'),
(4, 4, 3, 'Room was comfortable but noisy', '2024-11-18');

-- Events/Bookings Database
INSERT INTO EventsBookings (EventID, EventType, OrganizerContact, EventDateTime, VenueRoomAllocated, Charges)
VALUES 
(1, 'Wedding', 'Rahul Agarwal, 9876543220', '2024-12-10 18:00:00', 'Banquet Hall', 100000.00),
(2, 'Conference', 'TechMeet Inc., 9876543221', '2024-11-25 09:00:00', 'Conference Room 1', 50000.00),
(3, 'Birthday Party', 'Anita Kapoor, 9876543222', '2024-12-01 19:00:00', 'Garden Area', 30000.00),
(4, 'Workshop', 'SkillsUp Org., 9876543223', '2024-12-05 10:00:00', 'Conference Room 2', 20000.00);

-- Loyalty/Rewards Program Database
INSERT INTO LoyaltyRewards (GuestID, PointsEarned, RewardTier, DiscountsUsed)
VALUES 
(1, 120, 'Gold', '5% off on room service'),
(2, 90, 'Silver', '10% off on laundry'),
(3, 150, 'Platinum', '20% off on spa'),
(4, 80, 'Silver', 'Free early check-in');
