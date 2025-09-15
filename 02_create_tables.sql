-- Create all tables with proper relationships

-- Venue Table
CREATE TABLE Venue (
    VenueID INTEGER NOT NULL,
    VenueName VARCHAR(25) NOT NULL,
    Address VARCHAR(30) NOT NULL,
    ParkingInstruction TEXT,
    CONSTRAINT Venue_PK PRIMARY KEY (VenueID)
);

-- Event Table
CREATE TABLE Event (
    EventID INTEGER NOT NULL,
    EventName VARCHAR(40) NOT NULL,
    EventType VARCHAR(30) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    Description TEXT,
    VenueID INTEGER NOT NULL,
    CONSTRAINT Event_PK PRIMARY KEY (EventID),
    CONSTRAINT Event_FK FOREIGN KEY (VenueID) REFERENCES Venue(VenueID)
);

-- Booth Table
CREATE TABLE Booth (
    BoothID INTEGER NOT NULL,
    BoothLocation VARCHAR(50),
    EventID INTEGER,
    CONSTRAINT Booth_PK PRIMARY KEY (BoothID),
    CONSTRAINT Booth_FK1 FOREIGN KEY (EventID) REFERENCES Event(EventID)
);

-- Product Table
CREATE TABLE Product (
    ProductID INTEGER NOT NULL,
    ProductName VARCHAR(30),
    WholesaleCost DECIMAL(6, 2),
    HigherPrice DECIMAL(6, 2),
    MinimumSellingPrice DECIMAL(6, 2),
    CONSTRAINT Product_PK PRIMARY KEY (ProductID)
);

-- SalesPerson Table
CREATE TABLE SalesPerson (
    SalesPersonID INTEGER NOT NULL,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Address VARCHAR(100),
    PhoneNo VARCHAR(10),
    BoothID INTEGER NOT NULL,
    CONSTRAINT SalesPerson_PK PRIMARY KEY (SalesPersonID),
    CONSTRAINT SalesPerson_FK1 FOREIGN KEY (BoothID) REFERENCES Booth(BoothID)
);

-- Shift Table
CREATE TABLE Shift (
    ShiftID INTEGER NOT NULL,
    StartTime TIME,
    EndTime TIME,
    SalesPersonID INTEGER,
    CONSTRAINT Shift_PK PRIMARY KEY (ShiftID),
    CONSTRAINT Shift_FK2 FOREIGN KEY (SalesPersonID) REFERENCES SalesPerson(SalesPersonID)
);

-- Sales Table
CREATE TABLE Sales (
    SalesTransactionID INTEGER NOT NULL,
    FinalSellingPrice DECIMAL(10, 2),
    QuantitySold INTEGER,
    ProductID INTEGER,
    SalesPersonID INTEGER,
    CONSTRAINT Sales_PK PRIMARY KEY (SalesTransactionID),
    CONSTRAINT Sales_FK1 FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    CONSTRAINT Sales_FK2 FOREIGN KEY (SalesPersonID) REFERENCES SalesPerson(SalesPersonID)
);
