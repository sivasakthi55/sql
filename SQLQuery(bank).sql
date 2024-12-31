create database bank;

use bank;

create table admintable(
				admin_id int identity(1,1) primary key,
				username varchar(100)NOT NULL UNIQUE,
				admin_password varchar(100)NOT NULL,
				admin_name varchar(100),
				date_joined DATETIME DEFAULT GETDATE()
				);

INSERT INTO admintable (username, admin_password, admin_name)
VALUES ('adminuser', 'adminpassword123', 'siva');



CREATE TABLE Staff (
    staff_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    staff_name VARCHAR(100),
    position VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    date_joined DATETIME DEFAULT GETDATE()
);

INSERT INTO Staff (username, password, staff_name, position, email, phone)
VALUES 
('staffuser1', 'staffpassword123', 'prasath', 'Manager', 'prasath@gmail.com', '123-456-7890'),
('staffuser2', 'staffpassword456', 'viswa', 'Teller', 'viswa@gmail.com', '987-654-3210'),
('staffuser3', 'staffpassword789', 'kumar', 'Clerk', 'kumar@mail.com', '111-222-3333'),
('staffuser4', 'staffpassword321', 'santosh', 'Loan Officer', 'santosh@gmail.com', '444-555-6666'),
('staffuser5', 'staffpassword654', 'rahul', 'Customer Service', 'rahul@mail.com', '777-888-9999');



CREATE TABLE Client (
    client_id INT IDENTITY(1,1) PRIMARY KEY,
    client_name VARCHAR(100),
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    address VARCHAR(255),
    date_of_birth DATE,
    date_joined DATETIME DEFAULT GETDATE()
);

INSERT INTO Client (client_name, email, phone, address, date_of_birth)
VALUES
('bala', 'bala@gmil.com', '555-123-4567', '1725 Slough Ave, Scranton, PA', '1970-03-15'),
('sriram', 'sriram@gmail.com', '555-987-6543', '220 Bear Creek Rd, Scranton, PA', '1975-01-20'),
('prem', 'prem@gmail.com', '555-654-3210', '1 Scranton Business Park, Scranton, PA', '1980-10-01'),
('muthu', 'muthu@gmail.com', '555-111-2233', '2 Scranton Business Park, Scranton, PA', '1982-03-23'),
('rayan', 'rayan@gmail.com', '555-432-8765', '3 Scranton Business Park, Scranton, PA', '1984-09-22'),
('rio', 'rio@gmail.com', '555-222-4444', '4 Scranton Business Park, Scranton, PA', '1950-02-15'),
('raja', 'raja@gmail.com', '555-555-6666', '5 Scranton Business Park, Scranton, PA', '1972-11-25'),
('gokul', 'gokul@gmail.com', '555-777-8888', '6 Scranton Business Park, Scranton, PA', '1973-05-12'),
('ram', 'ram@gmail.com', '555-888-9999', '7 Scranton Business Park, Scranton, PA', '1972-07-04'),
('kumar', 'kumar@gmail.com', '555-999-0000', '8 Scranton Business Park, Scranton, PA', '1970-04-01');


CREATE TABLE Account (
    account_id INT IDENTITY(1,1) PRIMARY KEY,
    client_id INT,
    account_type VARCHAR(50), 
    balance DECIMAL(15, 2) DEFAULT 0.00,
    date_opened DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (client_id) REFERENCES Client(client_id) ON DELETE CASCADE
);


INSERT INTO Account (client_id, account_type, balance)
VALUES
(1, 'Savings', 1500.00),
(2, 'Savings', 2000.00),
(3, 'Savings', 2500.00),
(4, 'Savings', 3000.00),
(5, 'Savings', 3500.00),
(6, 'Savings', 4000.00),
(7, 'Savings', 4500.00),
(8, 'Savings', 5000.00),
(9, 'Savings', 5500.00),
(10, 'Savings', 6000.00);


select * from admintable;
select * from staff;
select * from client;
select * from Account;


select client.client_name,account.balance from client
join account on account.account_id=client.client_id
where client.client_name='bala';


