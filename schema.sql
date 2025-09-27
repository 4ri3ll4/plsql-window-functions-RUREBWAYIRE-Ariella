CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    region VARCHAR2(50)
);


CREATE TABLE accounts (
    account_id NUMBER PRIMARY KEY,
    customer_id NUMBER REFERENCES customers(customer_id),
    account_type VARCHAR2(20)
);


CREATE TABLE transactions (
    transaction_id NUMBER PRIMARY KEY,
    account_id NUMBER REFERENCES accounts(account_id),
    transaction_date DATE,
    amount NUMBER
);


INSERT INTO customers VALUES (1001, 'Ariella Ampoze', 'Kigali');
INSERT INTO customers VALUES (1002, 'Jane Mbabazi', 'Huye');
INSERT INTO customers VALUES (1003, 'Eric Nshuti', 'Musanze');
INSERT INTO customers VALUES (1004, 'Aline Uwase', 'Rubavu');
INSERT INTO customers VALUES (1005, 'Claude Mugisha', 'Nyagatare');
INSERT INTO customers VALUES (1006, 'Diane Mukamana', 'Butare');
INSERT INTO customers VALUES (1007, 'Patrick Habimana', 'Rusizi');
INSERT INTO customers VALUES (1008, 'Grace Ingabire', 'Gisenyi');
INSERT INTO customers VALUES (1009, 'Samuel Hakizimana', 'Kayonza');
INSERT INTO customers VALUES (1010, 'Ange Uwimana', 'Bugesera');


INSERT INTO accounts VALUES (2001, 1001, 'Savings');
INSERT INTO accounts VALUES (2002, 1002, 'Savings');
INSERT INTO accounts VALUES (2003, 1003, 'Loan');
INSERT INTO accounts VALUES (2004, 1004, 'Savings');
INSERT INTO accounts VALUES (2005, 1005, 'Loan');
INSERT INTO accounts VALUES (2006, 1006, 'Savings');
INSERT INTO accounts VALUES (2007, 1007, 'Savings');
INSERT INTO accounts VALUES (2008, 1008, 'Loan');
INSERT INTO accounts VALUES (2009, 1009, 'Savings');
INSERT INTO accounts VALUES (2010, 1010, 'Savings');


INSERT INTO transactions VALUES (3001, 2001, DATE '2025-01-15', 50000);
INSERT INTO transactions VALUES (3002, 2001, DATE '2025-02-10', 20000);
INSERT INTO transactions VALUES (3003, 2002, DATE '2025-02-15', 30000);
INSERT INTO transactions VALUES (3004, 2003, DATE '2025-03-01', 40000);
INSERT INTO transactions VALUES (3005, 2004, DATE '2025-01-20', 15000);
INSERT INTO transactions VALUES (3006, 2005, DATE '2025-01-25', 25000);
INSERT INTO transactions VALUES (3007, 2006, DATE '2025-02-05', 10000);
INSERT INTO transactions VALUES (3008, 2007, DATE '2025-02-18', 35000);
INSERT INTO transactions VALUES (3009, 2008, DATE '2025-03-02', 40000);
INSERT INTO transactions VALUES (3010, 2009, DATE '2025-03-20', 22000);
INSERT INTO transactions VALUES (3011, 2010, DATE '2025-04-01', 27000);
INSERT INTO transactions VALUES (3012, 2004, DATE '2025-04-15', 18000);
INSERT INTO transactions VALUES (3013, 2005, DATE '2025-05-03', 32000);
INSERT INTO transactions VALUES (3014, 2006, DATE '2025-05-22', 29000);
INSERT INTO transactions VALUES (3015, 2007, DATE '2025-06-10', 31000);
INSERT INTO transactions VALUES (3016, 2008, DATE '2025-06-25', 45000);

COMMIT;
