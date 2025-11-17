-- Create Database
CREATE DATABASE IF NOT EXISTS apiuser;
USE apiuser;

-- Create admin table
CREATE TABLE IF NOT EXISTS admin (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL
);

-- Create apikey table
CREATE TABLE IF NOT EXISTS apikey (
  id INT AUTO_INCREMENT PRIMARY KEY,
  key_value VARCHAR(255) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  expires_at TIMESTAMP NULL,
  status ENUM('active', 'inactive') DEFAULT 'active',
  INDEX idx_status (status)
);

-- Create user table
CREATE TABLE IF NOT EXISTS user (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL,
  apikey_id INT NOT NULL,
  FOREIGN KEY (apikey_id) REFERENCES apikey(id) ON DELETE CASCADE,
  INDEX idx_apikey_id (apikey_id)
);
