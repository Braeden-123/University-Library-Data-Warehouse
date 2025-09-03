--Project 3 Part 4: Analytical Queries

-- Query 1: Total Loans by Campus and Genre using CUBE
-- Purpose: Calculate the total number of loans, broken down by campus and book genre.
SELECT
    d.campus,
    b.genre,
    SUM(f.loan_count) AS total_loans
FROM
    UL_Loans_Fact f
    JOIN UL_Branches_Dim d ON f.branch_id = d.branch_id
    JOIN UL_Books_Dim b ON f.book_id = b.book_id
GROUP BY
    CUBE(d.campus, b.genre)
ORDER BY
    (GROUPING(d.campus) + GROUPING(b.genre)) DESC, -- 2→grand total, 1→subtotal, 0→detail
    total_loans DESC,
    d.campus,
    b.genre;


-- Query 2: Average Loan Duration by Student Major and Librarian Department using CUBE
-- Purpose: Compute the average loan duration, segmented by student major and librarian department.
SELECT
    s.major,
    l.department,
    ROUND(AVG(f.loan_duration_days), 2) AS avg_loan_duration_days
FROM
    UL_Loans_Fact f
    JOIN UL_Students_Dim s ON f.student_id = s.student_id
    JOIN UL_Librarians_Dim l ON f.librarian_id = l.librarian_id
GROUP BY
    CUBE(s.major, l.department)
ORDER BY
    (GROUPING(s.major) + GROUPING(l.department)) DESC, -- 2 grand total, 1 subtotal, 0 detail
    avg_loan_duration_days DESC,
    s.major,
    l.department;


-- Query 3: Total Loans by Book Genre and Loan Month using CUBE
-- Purpose: Count loans by genre and by the month of the loan date.
SELECT
    b.genre,
    TRUNC(f.loan_date, 'MM') AS loan_month,
    SUM(f.loan_count) AS total_loans
FROM
    UL_Loans_Fact f
    JOIN UL_Books_Dim b ON f.book_id = b.book_id
GROUP BY
    CUBE(b.genre, TRUNC(f.loan_date, 'MM'))
ORDER BY
    (GROUPING(b.genre) + GROUPING(TRUNC(f.loan_date, 'MM'))) DESC, -- 2 grand total, 1 subtotal, 0 detail
    total_loans DESC,
    b.genre,
    loan_month;


-- Query 4: Total Loans by Campus and Branch using ROLLUP
-- Purpose: Sum loans first at the branch level, then roll up to campus, then grand total.
SELECT
    d.campus,
    d.branch_name,
    SUM(f.loan_count) AS total_loans
FROM
    UL_Loans_Fact f
    JOIN UL_Branches_Dim d ON f.branch_id = d.branch_id
GROUP BY
    ROLLUP(d.campus, d.branch_name)
ORDER BY
    GROUPING(d.campus) DESC, -- 1 for grand total & campus subtotals before details
    GROUPING(d.branch_name) DESC,
    total_loans DESC,
    d.campus,
    d.branch_name;