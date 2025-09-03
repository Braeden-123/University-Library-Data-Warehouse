--Project 3 Part 2: Create the Star Schema

-- Drop existing tables to ensure a clean start
DROP TABLE UL_Loans_Fact CASCADE CONSTRAINTS;
DROP TABLE UL_Books_Dim CASCADE CONSTRAINTS;
DROP TABLE UL_Students_Dim CASCADE CONSTRAINTS;
DROP TABLE UL_Librarians_Dim CASCADE CONSTRAINTS;
DROP TABLE UL_Branches_Dim CASCADE CONSTRAINTS;

-- Create UL_Students_Dim table: Dimension table for librarian attributes
CREATE TABLE UL_Students_Dim (
    student_id NUMBER PRIMARY KEY,
    student_name VARCHAR2(100),
    major VARCHAR2(50),
    enrollment_year NUMBER
);

-- Create UL_Books_Dim table: Dimension table for librarian attributes
CREATE TABLE UL_Books_Dim (
    book_id NUMBER PRIMARY KEY,
    title VARCHAR2(200),
    genre VARCHAR2(50),
    publication_year NUMBER
);

-- Create UL_Branches_Dim table: Dimension table for librarian attributes
CREATE TABLE UL_Branches_Dim (
    branch_id NUMBER PRIMARY KEY,
    branch_name VARCHAR2(100),
    campus VARCHAR2(50)
);

-- Create UL_Librarians_Dim table: Dimension table for librarian attributes
CREATE TABLE UL_Librarians_Dim (
    librarian_id NUMBER PRIMARY KEY,
    librarian_name VARCHAR2(100),
    department VARCHAR2(50)
);

-- Create UL_Loans_Fact table: Fact table for loan metrics
CREATE TABLE UL_Loans_Fact (
    fact_id NUMBER PRIMARY KEY,
    loan_id NUMBER,
    loan_date DATE,
    return_date DATE, -- NULL if book not yet returned
    student_id NUMBER,
    book_id NUMBER,
    librarian_id NUMBER,
    branch_id NUMBER,
    loan_count NUMBER,
    loan_duration_days NUMBER,
    FOREIGN KEY (student_id) REFERENCES UL_Students_Dim(student_id),
    FOREIGN KEY (book_id) REFERENCES UL_Books_Dim(book_id),
    FOREIGN KEY (librarian_id) REFERENCES UL_Librarians_Dim(librarian_id),
    FOREIGN KEY (branch_id) REFERENCES UL_Branches_Dim(branch_id)
);