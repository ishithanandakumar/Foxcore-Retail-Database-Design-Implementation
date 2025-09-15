-- Create and setup database
CREATE DATABASE IF NOT EXISTS FoxcoreRetailDB;
USE FoxcoreRetailDB;

-- Drop existing tables for clean installation
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Shift;
DROP TABLE IF EXISTS SalesPerson;
DROP TABLE IF EXISTS Booth;
DROP TABLE IF EXISTS Event;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Venue;
