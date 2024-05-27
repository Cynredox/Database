-- TABLE
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL,
    Description TEXT
);
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    ContactInfo VARCHAR(255),
    Preferences TEXT,
    PurchaseHistory TEXT
);
CREATE TABLE demo (ID integer primary key, Name varchar(20), Hint text );
CREATE TABLE Discount (
    DiscountID INT PRIMARY KEY,
    DiscountName VARCHAR(100) NOT NULL,
    Description TEXT,
    DiscountPercentage DECIMAL(5, 2),
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL
);
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    RoleID INT,
    FOREIGN KEY (RoleID) REFERENCES EmployeeRole(RoleID)
);
CREATE TABLE EmployeeRole (
    RoleID INT PRIMARY KEY,
    RoleName VARCHAR(50) NOT NULL,
    Permissions VARCHAR(255)
);
CREATE TABLE LoyaltyProgram (
    ProgramID INT PRIMARY KEY,
    ProgramName VARCHAR(100) NOT NULL,
    Description TEXT,
    PointsEarned INT,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
CREATE TABLE OrderDetail (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES PurchaseOrder(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    TransactionID INT,
    PaymentType VARCHAR(50) NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (TransactionID) REFERENCES SalesTransaction(TransactionID)
);
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    StockLevel INT NOT NULL,
    ReorderThreshold INT NOT NULL,
    CategoryID INT,
    SupplierID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);
CREATE TABLE ProductReview (
    ReviewID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    ReviewDate DATE NOT NULL,
    Rating INT CHECK (Rating >= 1 AND Rating <= 5),
    Comments TEXT,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
CREATE TABLE PurchaseOrder (
    OrderID INT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    SupplierID INT,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);
CREATE TABLE SalesTransaction (
    TransactionID INT PRIMARY KEY,
    TransactionDate DATE NOT NULL,
    EmployeeID INT,
    CustomerID INT,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
CREATE TABLE SalesTransactionDetail (
    TransactionDetailID INT PRIMARY KEY,
    TransactionID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Discount DECIMAL(5, 2),
    Subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (TransactionID) REFERENCES SalesTransaction(TransactionID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
CREATE TABLE Shift (
    ShiftID INT PRIMARY KEY,
    EmployeeID INT,
    ShiftDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(255),
    PerformanceRating DECIMAL(3, 2)
);
 
-- INDEX
 
-- TRIGGER
 
-- VIEW
 
