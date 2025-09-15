-- Insert sample data into all tables

-- Venue Data
INSERT INTO Venue (VenueID, VenueName, Address, ParkingInstruction) VALUES
(124, 'Maple Leaf Banquet Hall', '100 King St W, Toronto, ON', 'Underground parking available; entrance on King St.'),
(125, 'Pacific Coast Conference Center', '200 Granville St, Vancouver, BC', 'Valet parking available at the entrance.'),
(126, 'Mount Royal Grand Hall', '300 Rue Sherbrooke O, Montreal, QC', 'Limited parking available onsite; street parking may be available nearby.'),
(127, 'Rocky Mountain Event Center', '400 4 Ave SW, Calgary, AB', 'Paid parking available in the building\'s underground garage; entrance on 4th Ave.');

-- Event Data
INSERT INTO Event (EventID, EventName, EventType, StartDate, EndDate, Description, VenueID) VALUES
(1, 'Tech Expo', 'Trade Show', '2024-06-15', '2024-06-17', 'Annual technology exhibition showcasing the latest innovations in the industry.', 125),
(2, 'Summer Rib Festival', 'Rib Fest', '2024-07-20', '2024-07-22', 'Celebration of BBQ ribs with live music, vendors, and family-friendly activities.', 126),
(3, 'Harbor Days', 'Music Festival', '2024-08-10', '2024-08-12', 'Three-day music festival featuring a diverse lineup of artists across multiple stages.', 127),
(4, 'Summer Sounds Festival', 'Music Festival', '2024-09-05', '2024-09-07', 'Three-day music festival featuring a diverse lineup of artists across multiple stages.', 127);

-- Booth Data
INSERT INTO Booth (BoothID, BoothLocation, EventID) VALUES
(3001, 'J1', 1),
(3002, 'K2', 2),
(3003, 'S11', 3),
(3004, 'T14', 4);

-- Product Data
INSERT INTO Product (ProductID, ProductName, WholesaleCost, HigherPrice, MinimumSellingPrice) VALUES
(5, 'Mini Frisbees', 20.00, 49.99, 29.99),
(6, 'Cooling Towel', 70.00, 90.00, 79.99),
(7, 'Bubble Guns', 50.00, 79.99, 69.99),
(9, 'Glow Sticks', 15.00, 25.00, 20.00);

-- SalesPerson Data
INSERT INTO SalesPerson (SalesPersonID, FirstName, LastName, Address, PhoneNo, BoothID) VALUES
(401, 'John', 'Doe', '123 Main St, Cityville, ON', '1234567890', 3001),
(402, 'Jane', 'Smith', '456 Elm St, Townsville, BC', '9876543210', 3002),
(403, 'Mike', 'Johnson', '789 Oak St, Hilltop, QC', '4567890123', 3003),
(404, 'Sarah', 'Williams', '101 Pine St, Seaside, AB', '9870123456', 3004);

-- Shift Data
INSERT INTO Shift (ShiftID, StartTime, EndTime, SalesPersonID) VALUES
(001, '08:00:00', '12:00:00', 401),
(002, '12:00:00', '16:00:00', 402),
(003, '16:00:00', '20:00:00', 403),
(004, '09:00:00', '13:00:00', 404);

-- Sales Data
INSERT INTO Sales (SalesTransactionID, FinalSellingPrice, QuantitySold, ProductID, SalesPersonID) VALUES
(501, 76.00, 10, 7, 402),
(502, 34.99, 20, 5, 404),
(503, 36.99, 15, 5, 403),
(504, 85.00, 5, 6, 401);
