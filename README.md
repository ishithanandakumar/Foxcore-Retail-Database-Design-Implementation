# Foxcore Retail Database Management System

## 📋 Project Overview
A comprehensive database management system designed for Foxcore Retail, a company specializing in novelty items sold at music festivals and trade shows. This project was developed as part of the Database Design and SQL course at Stuart School of Business, Illinois Institute of Technology.

## 👥 Team
- **Group 6**
- **Member**: Ishitha Nanda Kumar
- **Instructor**: Dr. Dinakar Jayarajan
- **Institution**: Stuart School of Business, Illinois Institute of Technology

## 🎯 Business Problem
Foxcore Retail faced critical inefficiencies in data management due to:
- Fragmented spreadsheet-based tracking
- Manual record-keeping errors
- Lost sales commissions
- Unreliable inventory assessments
- Lack of real-time sales tracking

## 💡 Solution
A scalable, normalized database system featuring:
- Real-time sales and inventory tracking
- Automated transaction processing
- Data integrity and security measures
- Comprehensive reporting capabilities
- Scalable architecture for future growth

## 📊 Database Structure

### Entities
1. **Venue** - Physical locations where events are held
2. **Event** - Festivals and trade shows where Foxcore participates
3. **Booth** - Sales points within events
4. **Product** - Items sold by Foxcore Retail
5. **SalesPerson** - Employees working at booths
6. **Shift** - Working time periods for salespersons
7. **Sales** - Transaction records

### Key Features
- **Normalization**: Database normalized to 3NF (Third Normal Form)
- **Referential Integrity**: Foreign key constraints ensure data consistency
- **Scalability**: Design supports future expansion
- **Performance**: Indexed for optimal query performance

## 🛠️ Technologies Used
- **Database**: MySQL
- **Tools**: MySQL Workbench
- **Design**: Barker's Notation for ER Diagram
- **Visualization**: Lucidchart

## 📁 Repository Structure
```
foxcore-retail-database/
├── README.md
├── LICENSE
├── docs/
│   ├── Project_Report.pdf
│   ├── ER_Diagram.png
│   └── Normalization_Tables.pdf
├── sql/
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   ├── 03_insert_data.sql
│   ├── 04_queries.sql
│   ├── 05_views.sql
│   ├── 06_indexes.sql
│   └── complete_script.sql
├── scripts/
│   ├── backup.sh
│   └── restore.sh
└── sample_data/
    ├── venues.csv
    ├── events.csv
    ├── products.csv
    └── sales.csv
```

## 🚀 Installation & Setup

### Prerequisites
- MySQL Server 5.7+ or MariaDB 10.3+
- MySQL Workbench (optional, for GUI)

### Quick Start
1. Clone the repository:
```bash
git clone https://github.com/yourusername/foxcore-retail-database.git
cd foxcore-retail-database
```

2. Create the database:
```bash
mysql -u root -p < sql/complete_script.sql
```

3. Or run scripts individually:
```bash
mysql -u root -p < sql/01_create_database.sql
mysql -u root -p < sql/02_create_tables.sql
mysql -u root -p < sql/03_insert_data.sql
```

## 📈 Sample Queries

### Sales Performance by Event
```sql
SELECT 
    e.EventName,
    v.VenueName,
    SUM(s.FinalSellingPrice * s.QuantitySold) AS TotalRevenue
FROM Event e
JOIN Venue v ON e.VenueID = v.VenueID
LEFT JOIN Booth b ON e.EventID = b.EventID
LEFT JOIN SalesPerson sp ON b.BoothID = sp.BoothID
LEFT JOIN Sales s ON sp.SalesPersonID = s.SalesPersonID
GROUP BY e.EventID, e.EventName, v.VenueName;
```

### Top Performing Salesperson
```sql
SELECT 
    CONCAT(sp.FirstName, ' ', sp.LastName) AS SalesPersonName,
    SUM(s.FinalSellingPrice * s.QuantitySold) AS TotalRevenue
FROM SalesPerson sp
LEFT JOIN Sales s ON sp.SalesPersonID = s.SalesPersonID
GROUP BY sp.SalesPersonID
ORDER BY TotalRevenue DESC
LIMIT 1;
```

## 📊 Reports Available
1. Sales Transaction Details
2. Event Revenue Analysis
3. Product Performance Metrics
4. Salesperson Commission Reports
5. Inventory Status
6. Shift Management Reports

## 🔄 Database Operations

### Backup
```bash
./scripts/backup.sh
```

### Restore
```bash
./scripts/restore.sh backup_file.sql
```

## 📝 Documentation
- [Full Project Report](docs/Project_Report.pdf)
- [ER Diagram](docs/ER_Diagram.png)
- [Normalization Process](docs/Normalization_Tables.pdf)

## 🤝 Contributing
1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments
- Dr. Dinakar Jayarajan for project guidance
- Stuart School of Business, Illinois Institute of Technology
- MySQL Community for documentation and support

## 🚦 Project Status
✅ Complete - All objectives achieved
- Database design and normalization complete
- All tables created and populated with sample data
- Reporting queries implemented
- Documentation finalized


