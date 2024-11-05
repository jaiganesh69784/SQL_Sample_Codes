-- Guest Database
CREATE TABLE Guest (
    GuestID INT PRIMARY KEY,
    Name VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address TEXT,
    Nationality VARCHAR(50),
    Preferences TEXT,
    PastStaysFeedback TEXT
);

-- Sample data for Guest Database
INSERT INTO Guest (GuestID, Name, Phone, Email, Address, Nationality, Preferences, PastStaysFeedback)
VALUES 
(1, 'John Doe', '1234567890', 'john.doe@example.com', '123 Elm St, Cityville', 'American', 'Double Room, Vegan Meals', 'Great stay, very comfortable'),
(2, 'Jane Smith', '0987654321', 'jane.smith@example.com', '456 Maple Ave, Townville', 'British', 'Suite, Gluten-Free Meals', 'Enjoyed the spa facilities');

-- Reservation Database
CREATE TABLE Reservation (
    ReservationID INT PRIMARY KEY,
    GuestID INT,
    RoomID INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    ReservationStatus VARCHAR(20),
    PaymentStatus VARCHAR(20),
    SpecialRequests TEXT,
    FOREIGN KEY (GuestID) REFERENCES Guest(GuestID)
);

-- Room Database
CREATE TABLE Room (
    RoomID INT PRIMARY KEY,
    RoomNumber VARCHAR(10),
    RoomType VARCHAR(50),
    AvailabilityStatus VARCHAR(20),
    PricePerNight DECIMAL(10, 2),
    RoomAmenities TEXT,
    HousekeepingStatus VARCHAR(20)
);

-- Employee Database
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50),
    ContactDetails VARCHAR(100),
    WorkSchedule TEXT,
    Salary DECIMAL(10, 2),
    PerformanceReviews TEXT
);

-- Billing/Payment Database
CREATE TABLE BillingPayment (
    TransactionID INT PRIMARY KEY,
    GuestID INT,
    ReservationID INT,
    RoomCharges DECIMAL(10, 2),
    AdditionalServices TEXT,
    PaymentMethod VARCHAR(20),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (GuestID) REFERENCES Guest(GuestID),
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID)
);

-- Inventory/Housekeeping Database
CREATE TABLE InventoryHousekeeping (
    InventoryID INT PRIMARY KEY,
    ItemName VARCHAR(100),
    QuantityAvailable INT,
    RoomStatus VARCHAR(20),
    HousekeepingSchedule TEXT
);

-- Service/Facilities Database
CREATE TABLE ServiceFacilities (
    ServiceID INT PRIMARY KEY,
    ServiceType VARCHAR(50),
    AvailabilityStatus VARCHAR(20),
    PricePerService DECIMAL(10, 2),
    GuestID INT,
    ServiceFeedback TEXT,
    FOREIGN KEY (GuestID) REFERENCES Guest(GuestID)
);

-- Feedback/Review Database
CREATE TABLE FeedbackReview (
    FeedbackID INT PRIMARY KEY,
    GuestID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comments TEXT,
    DateOfFeedback DATE,
    FOREIGN KEY (GuestID) REFERENCES Guest(GuestID)
);

-- Events/Bookings Database
CREATE TABLE EventsBookings (
    EventID INT PRIMARY KEY,
    EventType VARCHAR(50),
    OrganizerContact TEXT,
    EventDateTime DATETIME,
    VenueRoomAllocated VARCHAR(50),
    Charges DECIMAL(10, 2)
);

-- Loyalty/Rewards Program Database
CREATE TABLE LoyaltyRewards (
    GuestID INT PRIMARY KEY,
    PointsEarned INT,
    RewardTier VARCHAR(20),
    DiscountsUsed TEXT,
    FOREIGN KEY (GuestID) REFERENCES Guest(GuestID)
);
