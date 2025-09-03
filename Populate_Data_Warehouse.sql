--Project 3 Part 3: Populate the Data Warehouse

-- Populate UL_Students_Dim from UL_Students
INSERT INTO UL_Students_Dim (student_id, student_name, major, enrollment_year)
SELECT student_id, student_name, major, enrollment_year
FROM UL_Students;

-- Populate UL_Books_Dim from UL_Books
INSERT INTO UL_Books_Dim (book_id, title, genre, publication_year)
SELECT book_id, title, genre, publication_year
FROM UL_Books;

-- Populate UL_Branches_Dim from UL_Branches
INSERT INTO UL_Branches_Dim (branch_id, branch_name, campus)
SELECT branch_id, branch_name, campus
FROM UL_Branches;

-- Populate UL_Librarians_Dim from UL_Librarians
INSERT INTO UL_Librarians_Dim (librarian_id, librarian_name, department)
SELECT librarian_id, librarian_name, department
FROM UL_Librarians;

-- Populate UL_Loans_Fact
-- ROW_NUMBER() generates a unique fact_id for each fact record
INSERT INTO UL_Loans_Fact (fact_id, loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id, loan_count, loan_duration_days)
SELECT
    ROW_NUMBER() OVER (ORDER BY loan_id) AS fact_id, -- Unique ID for fact table
    loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id,
    1 AS loan_count,
        CASE 
        WHEN return_date IS NOT NULL THEN 
            return_date - loan_date
        ELSE NULL
    END AS loan_duration_days
FROM UL_Loans;

-- Commit all inserts to save data to the warehouse
COMMIT;