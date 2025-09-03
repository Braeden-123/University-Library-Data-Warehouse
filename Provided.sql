-- Operational_Database_Schema.sql
-- Purpose: Creates and populates the operational database for UniLib, a university library system.
-- Tables: UL_Students, UL_Books, UL_Branches, UL_Librarians, UL_Loans
-- Created for students to use as the source for designing a star schema data warehouse.

-- Drop existing tables to ensure a clean start
DROP TABLE UL_Loans CASCADE CONSTRAINTS;
DROP TABLE UL_Books CASCADE CONSTRAINTS;
DROP TABLE UL_Students CASCADE CONSTRAINTS;
DROP TABLE UL_Librarians CASCADE CONSTRAINTS;
DROP TABLE UL_Branches CASCADE CONSTRAINTS;

-- Create UL_Students table: Stores student information
CREATE TABLE UL_Students (
    student_id NUMBER PRIMARY KEY,
    student_name VARCHAR2(100),
    major VARCHAR2(50),
    enrollment_year NUMBER
);

-- Create UL_Books table: Stores book details
CREATE TABLE UL_Books (
    book_id NUMBER PRIMARY KEY,
    title VARCHAR2(200),
    genre VARCHAR2(50),
    publication_year NUMBER
);

-- Create UL_Branches table: Stores library branch details
CREATE TABLE UL_Branches (
    branch_id NUMBER PRIMARY KEY,
    branch_name VARCHAR2(100),
    campus VARCHAR2(50)
);

-- Create UL_Librarians table: Stores librarian information
CREATE TABLE UL_Librarians (
    librarian_id NUMBER PRIMARY KEY,
    librarian_name VARCHAR2(100),
    department VARCHAR2(50)
);

-- Create UL_Loans table: Stores book loan transactions
CREATE TABLE UL_Loans (
    loan_id NUMBER PRIMARY KEY,
    loan_date DATE,
    return_date DATE, -- NULL if book not yet returned
    student_id NUMBER,
    book_id NUMBER,
    librarian_id NUMBER,
    branch_id NUMBER,
    FOREIGN KEY (student_id) REFERENCES UL_Students(student_id),
    FOREIGN KEY (book_id) REFERENCES UL_Books(book_id),
    FOREIGN KEY (librarian_id) REFERENCES UL_Librarians(librarian_id),
    FOREIGN KEY (branch_id) REFERENCES UL_Branches(branch_id)
);

-- Populate UL_Students: 50 records
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (1, 'Emma Carter', 'Computer Science', 2022);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (2, 'Liam Patel', 'Biology', 2021);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (3, 'Olivia Nguyen', 'History', 2023);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (4, 'Noah Kim', 'Engineering', 2020);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (5, 'Ava Thompson', 'English', 2022);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (6, 'William Chen', 'Mathematics', 2021);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (7, 'Sophia Rodriguez', 'Psychology', 2023);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (8, 'James Lee', 'Physics', 2020);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (9, 'Isabella Martinez', 'Chemistry', 2022);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (10, 'Alexander Brown', 'Economics', 2021);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (11, 'Mia Davis', 'Sociology', 2023);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (12, 'Henry Wilson', 'Political Science', 2020);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (13, 'Charlotte Taylor', 'Art History', 2022);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (14, 'Daniel Garcia', 'Business', 2021);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (15, 'Amelia Lopez', 'Education', 2023);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (16, 'Ethan Hernandez', 'Environmental Science', 2020);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (17, 'Harper Adams', 'Philosophy', 2022);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (18, 'Mason Walker', 'Music', 2021);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (19, 'Evelyn Hall', 'Anthropology', 2023);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (20, 'Logan Young', 'Geology', 2020);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (21, 'Abigail King', 'Nursing', 2022);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (22, 'Jackson Scott', 'Statistics', 2021);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (23, 'Sofia Green', 'Linguistics', 2023);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (24, 'Aiden Baker', 'Architecture', 2020);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (25, 'Ella Perez', 'Journalism', 2022);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (26, 'Lucas Rivera', 'Computer Science', 2021);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (27, 'Lily Evans', 'Biology', 2023);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (28, 'Owen Mitchell', 'Engineering', 2020);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (29, 'Grace Collins', 'English', 2022);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (30, 'Caleb Stewart', 'Mathematics', 2021);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (31, 'Zoe Nguyen', 'Psychology', 2023);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (32, 'Nathan Hill', 'Physics', 2020);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (33, 'Hannah Rogers', 'Chemistry', 2022);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (34, 'Isaac Murphy', 'Economics', 2021);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (35, 'Chloe Cook', 'Sociology', 2023);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (36, 'Elijah Bailey', 'Political Science', 2020);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (37, 'Aubrey Ward', 'Art History', 2022);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (38, 'Sebastian Cox', 'Business', 2021);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (39, 'Aria Phillips', 'Education', 2023);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (40, 'Gabriel Reed', 'Environmental Science', 2020);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (41, 'Layla Price', 'Philosophy', 2022);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (42, 'Carter Bell', 'Music', 2021);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (43, 'Madeline Gray', 'Anthropology', 2023);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (44, 'Julian Ross', 'Geology', 2020);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (45, 'Savannah Ford', 'Nursing', 2022);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (46, 'Dylan Hayes', 'Statistics', 2021);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (47, 'Scarlett Long', 'Linguistics', 2023);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (48, 'Wyatt Myers', 'Architecture', 2020);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (49, 'Aurora Fisher', 'Journalism', 2022);
INSERT INTO UL_Students (student_id, student_name, major, enrollment_year) VALUES (50, 'Asher Gordon', 'Computer Science', 2021);

-- Populate UL_Books: 100 records
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (1, 'Introduction to Algorithms', 'Textbook', 2009);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (2, 'Pride and Prejudice', 'Fiction', 1813);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (3, 'Sapiens: A Brief History of Humankind', 'Non-Fiction', 2014);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (4, 'Oxford English Dictionary', 'Reference', 2020);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (5, 'Calculus: Early Transcendentals', 'Textbook', 2016);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (6, '1984', 'Fiction', 1949);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (7, 'The Immortal Life of Henrietta Lacks', 'Non-Fiction', 2010);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (8, 'Encyclopedia of Physics', 'Reference', 2018);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (9, 'Organic Chemistry', 'Textbook', 2014);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (10, 'The Great Gatsby', 'Fiction', 1925);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (11, 'Educated', 'Non-Fiction', 2018);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (12, 'APA Publication Manual', 'Reference', 2019);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (13, 'Linear Algebra and Its Applications', 'Textbook', 2015);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (14, 'To Kill a Mockingbird', 'Fiction', 1960);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (15, 'Becoming', 'Non-Fiction', 2018);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (16, 'Merriam-Webster Dictionary', 'Reference', 2021);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (17, 'Microeconomics', 'Textbook', 2017);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (18, 'Brave New World', 'Fiction', 1932);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (19, 'The Wright Brothers', 'Non-Fiction', 2015);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (20, 'Chicago Manual of Style', 'Reference', 2017);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (21, 'Fundamentals of Physics', 'Textbook', 2013);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (22, 'Jane Eyre', 'Fiction', 1847);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (23, 'Guns, Germs, and Steel', 'Non-Fiction', 1997);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (24, 'Encyclopedia of Biology', 'Reference', 2019);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (25, 'Psychology: Themes and Variations', 'Textbook', 2016);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (26, 'The Catcher in the Rye', 'Fiction', 1951);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (27, 'A Brief History of Time', 'Non-Fiction', 1988);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (28, 'MLA Handbook', 'Reference', 2021);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (29, 'Data Structures and Algorithms', 'Textbook', 2018);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (30, 'Moby-Dick', 'Fiction', 1851);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (31, 'The Sixth Extinction', 'Non-Fiction', 2014);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (32, 'Encyclopedia of Literature', 'Reference', 2020);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (33, 'Principles of Macroeconomics', 'Textbook', 2019);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (34, 'Animal Farm', 'Fiction', 1945);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (35, 'The Gene: An Intimate History', 'Non-Fiction', 2016);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (36, 'Oxford Handbook of Sociology', 'Reference', 2018);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (37, 'Introduction to Sociology', 'Textbook', 2017);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (38, 'Wuthering Heights', 'Fiction', 1847);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (39, 'Thinking, Fast and Slow', 'Non-Fiction', 2011);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (40, 'Encyclopedia of Psychology', 'Reference', 2019);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (41, 'Biochemistry', 'Textbook', 2015);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (42, 'The Hobbit', 'Fiction', 1937);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (43, 'Outliers', 'Non-Fiction', 2008);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (44, 'Encyclopedia of History', 'Reference', 2020);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (45, 'Engineering Mechanics', 'Textbook', 2016);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (46, 'Lord of the Flies', 'Fiction', 1954);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (47, 'The Emperor of All Maladies', 'Non-Fiction', 2010);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (48, 'Oxford Handbook of Economics', 'Reference', 2018);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (49, 'Introduction to Statistics', 'Textbook', 2017);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (50, 'The Bell Jar', 'Fiction', 1963);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (51, 'Freakonomics', 'Non-Fiction', 2005);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (52, 'Encyclopedia of Mathematics', 'Reference', 2019);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (53, 'Environmental Science', 'Textbook', 2018);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (54, 'Catch-22', 'Fiction', 1961);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (55, 'The Selfish Gene', 'Non-Fiction', 1976);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (56, 'Oxford Handbook of Political Science', 'Reference', 2020);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (57, 'Introduction to Philosophy', 'Textbook', 2016);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (58, 'The Handmaid''s Tale', 'Fiction', 1985);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (59, 'Born a Crime', 'Non-Fiction', 2016);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (60, 'Encyclopedia of Art', 'Reference', 2018);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (61, 'Electrical Engineering 101', 'Textbook', 2017);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (62, 'The Road', 'Fiction', 2006);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (63, 'The Black Swan', 'Non-Fiction', 2007);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (64, 'Oxford Handbook of Education', 'Reference', 2019);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (65, 'General Chemistry', 'Textbook', 2015);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (66, 'Beloved', 'Fiction', 1987);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (67, 'The Tipping Point', 'Non-Fiction', 2000);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (68, 'Encyclopedia of Music', 'Reference', 2020);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (69, 'Introduction to Geology', 'Textbook', 2018);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (70, 'One Hundred Years of Solitude', 'Fiction', 1967);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (71, 'The Innovators', 'Non-Fiction', 2014);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (72, 'Oxford Handbook of Anthropology', 'Reference', 2019);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (73, 'Art History', 'Textbook', 2016);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (74, 'The Color Purple', 'Fiction', 1982);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (75, 'Homo Deus', 'Non-Fiction', 2016);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (76, 'Encyclopedia of Philosophy', 'Reference', 2018);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (77, 'Introduction to Nursing', 'Textbook', 2017);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (78, 'Invisible Man', 'Fiction', 1952);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (79, 'The World Is Flat', 'Non-Fiction', 2005);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (80, 'Oxford Handbook of Journalism', 'Reference', 2020);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (81, 'Principles of Marketing', 'Textbook', 2019);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (82, 'Slaughterhouse-Five', 'Fiction', 1969);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (83, 'Why We Sleep', 'Non-Fiction', 2017);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (84, 'Encyclopedia of Linguistics', 'Reference', 2018);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (85, 'Introduction to Architecture', 'Textbook', 2016);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (86, 'Their Eyes Were Watching God', 'Fiction', 1937);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (87, 'The Shallows', 'Non-Fiction', 2010);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (88, 'Oxford Handbook of Statistics', 'Reference', 2019);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (89, 'Molecular Biology', 'Textbook', 2018);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (90, 'The Alchemist', 'Fiction', 1988);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (91, 'The Age of Surveillance Capitalism', 'Non-Fiction', 2019);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (92, 'Encyclopedia of Business', 'Reference', 2020);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (93, 'Introduction to Psychology', 'Textbook', 2017);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (94, 'Dune', 'Fiction', 1965);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (95, 'The Souls of Black Folk', 'Non-Fiction', 1903);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (96, 'Oxford Handbook of Environmental Science', 'Reference', 2018);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (97, 'Introduction to Music Theory', 'Textbook', 2016);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (98, 'A Clockwork Orange', 'Fiction', 1962);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (99, 'The End of History', 'Non-Fiction', 1992);
INSERT INTO UL_Books (book_id, title, genre, publication_year) VALUES (100, 'Modern Physics', 'Textbook', 2015);

-- Populate UL_Branches: 10 records
-- Represents library branches across different campuses
INSERT INTO UL_Branches (branch_id, branch_name, campus) VALUES (1, 'Main Library', 'Central Campus');
INSERT INTO UL_Branches (branch_id, branch_name, campus) VALUES (2, 'Science Library', 'North Campus');
INSERT INTO UL_Branches (branch_id, branch_name, campus) VALUES (3, 'Humanities Library', 'Central Campus');
INSERT INTO UL_Branches (branch_id, branch_name, campus) VALUES (4, 'Engineering Library', 'North Campus');
INSERT INTO UL_Branches (branch_id, branch_name, campus) VALUES (5, 'Business Library', 'South Campus');
INSERT INTO UL_Branches (branch_id, branch_name, campus) VALUES (6, 'Medical Library', 'East Campus');
INSERT INTO UL_Branches (branch_id, branch_name, campus) VALUES (7, 'Law Library', 'South Campus');
INSERT INTO UL_Branches (branch_id, branch_name, campus) VALUES (8, 'Arts Library', 'Central Campus');
INSERT INTO UL_Branches (branch_id, branch_name, campus) VALUES (9, 'Social Sciences Library', 'North Campus');
INSERT INTO UL_Branches (branch_id, branch_name, campus) VALUES (10, 'Education Library', 'East Campus');

-- Populate UL_Librarians: 20 records
-- Includes librarians from various departments for analysis
INSERT INTO UL_Librarians (librarian_id, librarian_name, department) VALUES (1, 'Alice Brown', 'Reference');
INSERT INTO UL_Librarians (librarian_id, librarian_name, department) VALUES (2, 'Bob Davis', 'Circulation');
INSERT INTO UL_Librarians (librarian_id, librarian_name, department) VALUES (3, 'Carol White', 'Archives');
INSERT INTO UL_Librarians (librarian_id, librarian_name, department) VALUES (4, 'David Green', 'Technical Services');
INSERT INTO UL_Librarians (librarian_id, librarian_name, department) VALUES (5, 'Emma Clark', 'Reference');
INSERT INTO UL_Librarians (librarian_id, librarian_name, department) VALUES (6, 'Frank Harris', 'Circulation');
INSERT INTO UL_Librarians (librarian_id, librarian_name, department) VALUES (7, 'Grace Lee', 'Archives');
INSERT INTO UL_Librarians (librarian_id, librarian_name, department) VALUES (8, 'Henry Moore', 'Technical Services');
INSERT INTO UL_Librarians (librarian_id, librarian_name, department) VALUES (9, 'Isabella Walker', 'Reference');
INSERT INTO UL_Librarians (librarian_id, librarian_name, department) VALUES (10, 'James Taylor', 'Circulation');
INSERT INTO UL_Librarians (librarian_id, librarian_name, department) VALUES (11, 'Kelly Adams', 'Archives');
INSERT INTO UL_Librarians (librarian_id, librarian_name, department) VALUES (12, 'Liam Johnson', 'Technical Services');
INSERT INTO UL_Librarians (librarian_id, librarian_name, department) VALUES (13, 'Mia Thompson', 'Reference');
INSERT INTO UL_Librarians (librarian_id, librarian_name, department) VALUES (14, 'Noah Martinez', 'Circulation');
INSERT INTO UL_Librarians (librarian_id, librarian_name, department) VALUES (15, 'Olivia Wright', 'Archives');
INSERT INTO UL_Librarians (librarian_id, librarian_name, department) VALUES (16, 'Peter King', 'Technical Services');
INSERT INTO UL_Librarians (librarian_id, librarian_name, department) VALUES (17, 'Quinn Nelson', 'Reference');
INSERT INTO UL_Librarians (librarian_id, librarian_name, department) VALUES (18, 'Rachel Young', 'Circulation');
INSERT INTO UL_Librarians (librarian_id, librarian_name, department) VALUES (19, 'Samuel Hill', 'Archives');
INSERT INTO UL_Librarians (librarian_id, librarian_name, department) VALUES (20, 'Tara Scott', 'Technical Services');

-- Populate UL_Loans: 300 records
-- Represents book loans from Jan 1, 2024, to Jun 30, 2024, with some books not yet returned (NULL return_date)
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (1, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-15', 'YYYY-MM-DD'), 1, 1, 1, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (2, TO_DATE('2024-01-02', 'YYYY-MM-DD'), NULL, 2, 2, 2, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (3, TO_DATE('2024-01-03', 'YYYY-MM-DD'), TO_DATE('2024-01-17', 'YYYY-MM-DD'), 3, 3, 3, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (4, TO_DATE('2024-01-04', 'YYYY-MM-DD'), TO_DATE('2024-01-18', 'YYYY-MM-DD'), 4, 4, 4, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (5, TO_DATE('2024-01-05', 'YYYY-MM-DD'), NULL, 5, 5, 5, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (6, TO_DATE('2024-01-06', 'YYYY-MM-DD'), TO_DATE('2024-01-20', 'YYYY-MM-DD'), 6, 6, 6, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (7, TO_DATE('2024-01-07', 'YYYY-MM-DD'), TO_DATE('2024-01-21', 'YYYY-MM-DD'), 7, 7, 7, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (8, TO_DATE('2024-01-08', 'YYYY-MM-DD'), NULL, 8, 8, 8, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (9, TO_DATE('2024-01-09', 'YYYY-MM-DD'), TO_DATE('2024-01-23', 'YYYY-MM-DD'), 9, 9, 9, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (10, TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-01-24', 'YYYY-MM-DD'), 10, 10, 10, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (11, TO_DATE('2024-01-11', 'YYYY-MM-DD'), NULL, 11, 11, 11, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (12, TO_DATE('2024-01-12', 'YYYY-MM-DD'), TO_DATE('2024-01-26', 'YYYY-MM-DD'), 12, 12, 12, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (13, TO_DATE('2024-01-13', 'YYYY-MM-DD'), TO_DATE('2024-01-27', 'YYYY-MM-DD'), 13, 13, 13, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (14, TO_DATE('2024-01-14', 'YYYY-MM-DD'), NULL, 14, 14, 14, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (15, TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2024-01-29', 'YYYY-MM-DD'), 15, 15, 15, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (16, TO_DATE('2024-01-16', 'YYYY-MM-DD'), TO_DATE('2024-01-30', 'YYYY-MM-DD'), 16, 16, 16, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (17, TO_DATE('2024-01-17', 'YYYY-MM-DD'), NULL, 17, 17, 17, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (18, TO_DATE('2024-01-18', 'YYYY-MM-DD'), TO_DATE('2024-02-01', 'YYYY-MM-DD'), 18, 18, 18, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (19, TO_DATE('2024-01-19', 'YYYY-MM-DD'), TO_DATE('2024-02-02', 'YYYY-MM-DD'), 19, 19, 19, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (20, TO_DATE('2024-01-20', 'YYYY-MM-DD'), NULL, 20, 20, 20, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (21, TO_DATE('2024-01-21', 'YYYY-MM-DD'), TO_DATE('2024-02-04', 'YYYY-MM-DD'), 21, 21, 1, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (22, TO_DATE('2024-01-22', 'YYYY-MM-DD'), NULL, 22, 22, 2, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (23, TO_DATE('2024-01-23', 'YYYY-MM-DD'), TO_DATE('2024-02-06', 'YYYY-MM-DD'), 23, 23, 3, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (24, TO_DATE('2024-01-24', 'YYYY-MM-DD'), TO_DATE('2024-02-07', 'YYYY-MM-DD'), 24, 24, 4, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (25, TO_DATE('2024-01-25', 'YYYY-MM-DD'), NULL, 25, 25, 5, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (26, TO_DATE('2024-01-26', 'YYYY-MM-DD'), TO_DATE('2024-02-09', 'YYYY-MM-DD'), 26, 26, 6, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (27, TO_DATE('2024-01-27', 'YYYY-MM-DD'), TO_DATE('2024-02-10', 'YYYY-MM-DD'), 27, 27, 7, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (28, TO_DATE('2024-01-28', 'YYYY-MM-DD'), NULL, 28, 28, 8, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (29, TO_DATE('2024-01-29', 'YYYY-MM-DD'), TO_DATE('2024-02-12', 'YYYY-MM-DD'), 29, 29, 9, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (30, TO_DATE('2024-01-30', 'YYYY-MM-DD'), TO_DATE('2024-02-13', 'YYYY-MM-DD'), 30, 30, 10, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (31, TO_DATE('2024-01-31', 'YYYY-MM-DD'), NULL, 31, 31, 11, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (32, TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-15', 'YYYY-MM-DD'), 32, 32, 12, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (33, TO_DATE('2024-02-02', 'YYYY-MM-DD'), TO_DATE('2024-02-16', 'YYYY-MM-DD'), 33, 33, 13, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (34, TO_DATE('2024-02-03', 'YYYY-MM-DD'), NULL, 34, 34, 14, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (35, TO_DATE('2024-02-04', 'YYYY-MM-DD'), TO_DATE('2024-02-18', 'YYYY-MM-DD'), 35, 35, 15, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (36, TO_DATE('2024-02-05', 'YYYY-MM-DD'), TO_DATE('2024-02-19', 'YYYY-MM-DD'), 36, 36, 16, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (37, TO_DATE('2024-02-06', 'YYYY-MM-DD'), NULL, 37, 37, 17, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (38, TO_DATE('2024-02-07', 'YYYY-MM-DD'), TO_DATE('2024-02-21', 'YYYY-MM-DD'), 38, 38, 18, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (39, TO_DATE('2024-02-08', 'YYYY-MM-DD'), TO_DATE('2024-02-22', 'YYYY-MM-DD'), 39, 39, 19, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (40, TO_DATE('2024-02-09', 'YYYY-MM-DD'), NULL, 40, 40, 20, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (41, TO_DATE('2024-02-10', 'YYYY-MM-DD'), TO_DATE('2024-02-24', 'YYYY-MM-DD'), 41, 41, 1, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (42, TO_DATE('2024-02-11', 'YYYY-MM-DD'), NULL, 42, 42, 2, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (43, TO_DATE('2024-02-12', 'YYYY-MM-DD'), TO_DATE('2024-02-26', 'YYYY-MM-DD'), 43, 43, 3, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (44, TO_DATE('2024-02-13', 'YYYY-MM-DD'), TO_DATE('2024-02-27', 'YYYY-MM-DD'), 44, 44, 4, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (45, TO_DATE('2024-02-14', 'YYYY-MM-DD'), NULL, 45, 45, 5, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (46, TO_DATE('2024-02-15', 'YYYY-MM-DD'), TO_DATE('2024-03-01', 'YYYY-MM-DD'), 46, 46, 6, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (47, TO_DATE('2024-02-16', 'YYYY-MM-DD'), TO_DATE('2024-03-02', 'YYYY-MM-DD'), 47, 47, 7, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (48, TO_DATE('2024-02-17', 'YYYY-MM-DD'), NULL, 48, 48, 8, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (49, TO_DATE('2024-02-18', 'YYYY-MM-DD'), TO_DATE('2024-03-04', 'YYYY-MM-DD'), 49, 49, 9, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (50, TO_DATE('2024-02-19', 'YYYY-MM-DD'), TO_DATE('2024-03-05', 'YYYY-MM-DD'), 50, 50, 10, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (51, TO_DATE('2024-02-20', 'YYYY-MM-DD'), NULL, 1, 51, 11, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (52, TO_DATE('2024-02-21', 'YYYY-MM-DD'), TO_DATE('2024-03-07', 'YYYY-MM-DD'), 2, 52, 12, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (53, TO_DATE('2024-02-22', 'YYYY-MM-DD'), TO_DATE('2024-03-08', 'YYYY-MM-DD'), 3, 53, 13, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (54, TO_DATE('2024-02-23', 'YYYY-MM-DD'), NULL, 4, 54, 14, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (55, TO_DATE('2024-02-24', 'YYYY-MM-DD'), TO_DATE('2024-03-10', 'YYYY-MM-DD'), 5, 55, 15, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (56, TO_DATE('2024-02-25', 'YYYY-MM-DD'), TO_DATE('2024-03-11', 'YYYY-MM-DD'), 6, 56, 16, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (57, TO_DATE('2024-02-26', 'YYYY-MM-DD'), NULL, 7, 57, 17, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (58, TO_DATE('2024-02-27', 'YYYY-MM-DD'), TO_DATE('2024-03-13', 'YYYY-MM-DD'), 8, 58, 18, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (59, TO_DATE('2024-02-28', 'YYYY-MM-DD'), TO_DATE('2024-03-14', 'YYYY-MM-DD'), 9, 59, 19, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (60, TO_DATE('2024-02-29', 'YYYY-MM-DD'), NULL, 10, 60, 20, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (61, TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-15', 'YYYY-MM-DD'), 11, 61, 1, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (62, TO_DATE('2024-03-02', 'YYYY-MM-DD'), NULL, 12, 62, 2, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (63, TO_DATE('2024-03-03', 'YYYY-MM-DD'), TO_DATE('2024-03-17', 'YYYY-MM-DD'), 13, 63, 3, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (64, TO_DATE('2024-03-04', 'YYYY-MM-DD'), TO_DATE('2024-03-18', 'YYYY-MM-DD'), 14, 64, 4, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (65, TO_DATE('2024-03-05', 'YYYY-MM-DD'), NULL, 15, 65, 5, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (66, TO_DATE('2024-03-06', 'YYYY-MM-DD'), TO_DATE('2024-03-20', 'YYYY-MM-DD'), 16, 66, 6, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (67, TO_DATE('2024-03-07', 'YYYY-MM-DD'), TO_DATE('2024-03-21', 'YYYY-MM-DD'), 17, 67, 7, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (68, TO_DATE('2024-03-08', 'YYYY-MM-DD'), NULL, 18, 68, 8, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (69, TO_DATE('2024-03-09', 'YYYY-MM-DD'), TO_DATE('2024-03-23', 'YYYY-MM-DD'), 19, 69, 9, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (70, TO_DATE('2024-03-10', 'YYYY-MM-DD'), TO_DATE('2024-03-24', 'YYYY-MM-DD'), 20, 70, 10, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (71, TO_DATE('2024-03-11', 'YYYY-MM-DD'), NULL, 21, 71, 11, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (72, TO_DATE('2024-03-12', 'YYYY-MM-DD'), TO_DATE('2024-03-26', 'YYYY-MM-DD'), 22, 72, 12, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (73, TO_DATE('2024-03-13', 'YYYY-MM-DD'), TO_DATE('2024-03-27', 'YYYY-MM-DD'), 23, 73, 13, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (74, TO_DATE('2024-03-14', 'YYYY-MM-DD'), NULL, 24, 74, 14, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (75, TO_DATE('2024-03-15', 'YYYY-MM-DD'), TO_DATE('2024-03-29', 'YYYY-MM-DD'), 25, 75, 15, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (76, TO_DATE('2024-03-16', 'YYYY-MM-DD'), TO_DATE('2024-03-30', 'YYYY-MM-DD'), 26, 76, 16, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (77, TO_DATE('2024-03-17', 'YYYY-MM-DD'), NULL, 27, 77, 17, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (78, TO_DATE('2024-03-18', 'YYYY-MM-DD'), TO_DATE('2024-04-01', 'YYYY-MM-DD'), 28, 78, 18, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (79, TO_DATE('2024-03-19', 'YYYY-MM-DD'), TO_DATE('2024-04-02', 'YYYY-MM-DD'), 29, 79, 19, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (80, TO_DATE('2024-03-20', 'YYYY-MM-DD'), NULL, 30, 80, 20, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (81, TO_DATE('2024-03-21', 'YYYY-MM-DD'), TO_DATE('2024-04-04', 'YYYY-MM-DD'), 31, 81, 1, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (82, TO_DATE('2024-03-22', 'YYYY-MM-DD'), NULL, 32, 82, 2, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (83, TO_DATE('2024-03-23', 'YYYY-MM-DD'), TO_DATE('2024-04-06', 'YYYY-MM-DD'), 33, 83, 3, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (84, TO_DATE('2024-03-24', 'YYYY-MM-DD'), TO_DATE('2024-04-07', 'YYYY-MM-DD'), 34, 84, 4, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (85, TO_DATE('2024-03-25', 'YYYY-MM-DD'), NULL, 35, 85, 5, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (86, TO_DATE('2024-03-26', 'YYYY-MM-DD'), TO_DATE('2024-04-09', 'YYYY-MM-DD'), 36, 86, 6, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (87, TO_DATE('2024-03-27', 'YYYY-MM-DD'), TO_DATE('2024-04-10', 'YYYY-MM-DD'), 37, 87, 7, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (88, TO_DATE('2024-03-28', 'YYYY-MM-DD'), NULL, 38, 88, 8, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (89, TO_DATE('2024-03-29', 'YYYY-MM-DD'), TO_DATE('2024-04-12', 'YYYY-MM-DD'), 39, 89, 9, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (90, TO_DATE('2024-03-30', 'YYYY-MM-DD'), TO_DATE('2024-04-13', 'YYYY-MM-DD'), 40, 90, 10, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (91, TO_DATE('2024-03-31', 'YYYY-MM-DD'), NULL, 41, 91, 11, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (92, TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-04-15', 'YYYY-MM-DD'), 42, 92, 12, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (93, TO_DATE('2024-04-02', 'YYYY-MM-DD'), TO_DATE('2024-04-16', 'YYYY-MM-DD'), 43, 93, 13, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (94, TO_DATE('2024-04-03', 'YYYY-MM-DD'), NULL, 44, 94, 14, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (95, TO_DATE('2024-04-04', 'YYYY-MM-DD'), TO_DATE('2024-04-18', 'YYYY-MM-DD'), 45, 95, 15, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (96, TO_DATE('2024-04-05', 'YYYY-MM-DD'), TO_DATE('2024-04-19', 'YYYY-MM-DD'), 46, 96, 16, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (97, TO_DATE('2024-04-06', 'YYYY-MM-DD'), NULL, 47, 97, 17, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (98, TO_DATE('2024-04-07', 'YYYY-MM-DD'), TO_DATE('2024-04-21', 'YYYY-MM-DD'), 48, 98, 18, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (99, TO_DATE('2024-04-08', 'YYYY-MM-DD'), TO_DATE('2024-04-22', 'YYYY-MM-DD'), 49, 99, 19, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (100, TO_DATE('2024-04-09', 'YYYY-MM-DD'), NULL, 50, 100, 20, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (101, TO_DATE('2024-04-10', 'YYYY-MM-DD'), TO_DATE('2024-04-24', 'YYYY-MM-DD'), 1, 1, 1, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (102, TO_DATE('2024-04-11', 'YYYY-MM-DD'), NULL, 2, 2, 2, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (103, TO_DATE('2024-04-12', 'YYYY-MM-DD'), TO_DATE('2024-04-26', 'YYYY-MM-DD'), 3, 3, 3, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (104, TO_DATE('2024-04-13', 'YYYY-MM-DD'), TO_DATE('2024-04-27', 'YYYY-MM-DD'), 4, 4, 4, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (105, TO_DATE('2024-04-14', 'YYYY-MM-DD'), NULL, 5, 5, 5, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (106, TO_DATE('2024-04-15', 'YYYY-MM-DD'), TO_DATE('2024-04-29', 'YYYY-MM-DD'), 6, 6, 6, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (107, TO_DATE('2024-04-16', 'YYYY-MM-DD'), TO_DATE('2024-04-30', 'YYYY-MM-DD'), 7, 7, 7, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (108, TO_DATE('2024-04-17', 'YYYY-MM-DD'), NULL, 8, 8, 8, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (109, TO_DATE('2024-04-18', 'YYYY-MM-DD'), TO_DATE('2024-05-02', 'YYYY-MM-DD'), 9, 9, 9, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (110, TO_DATE('2024-04-19', 'YYYY-MM-DD'), TO_DATE('2024-05-03', 'YYYY-MM-DD'), 10, 10, 10, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (111, TO_DATE('2024-04-20', 'YYYY-MM-DD'), NULL, 11, 11, 11, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (112, TO_DATE('2024-04-21', 'YYYY-MM-DD'), TO_DATE('2024-05-05', 'YYYY-MM-DD'), 12, 12, 12, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (113, TO_DATE('2024-04-22', 'YYYY-MM-DD'), TO_DATE('2024-05-06', 'YYYY-MM-DD'), 13, 13, 13, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (114, TO_DATE('2024-04-23', 'YYYY-MM-DD'), NULL, 14, 14, 14, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (115, TO_DATE('2024-04-24', 'YYYY-MM-DD'), TO_DATE('2024-05-08', 'YYYY-MM-DD'), 15, 15, 15, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (116, TO_DATE('2024-04-25', 'YYYY-MM-DD'), TO_DATE('2024-05-09', 'YYYY-MM-DD'), 16, 16, 16, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (117, TO_DATE('2024-04-26', 'YYYY-MM-DD'), NULL, 17, 17, 17, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (118, TO_DATE('2024-04-27', 'YYYY-MM-DD'), TO_DATE('2024-05-11', 'YYYY-MM-DD'), 18, 18, 18, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (119, TO_DATE('2024-04-28', 'YYYY-MM-DD'), TO_DATE('2024-05-12', 'YYYY-MM-DD'), 19, 19, 19, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (120, TO_DATE('2024-04-29', 'YYYY-MM-DD'), NULL, 20, 20, 20, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (121, TO_DATE('2024-04-30', 'YYYY-MM-DD'), TO_DATE('2024-05-14', 'YYYY-MM-DD'), 21, 21, 1, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (122, TO_DATE('2024-05-01', 'YYYY-MM-DD'), NULL, 22, 22, 2, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (123, TO_DATE('2024-05-02', 'YYYY-MM-DD'), TO_DATE('2024-05-16', 'YYYY-MM-DD'), 23, 23, 3, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (124, TO_DATE('2024-05-03', 'YYYY-MM-DD'), TO_DATE('2024-05-17', 'YYYY-MM-DD'), 24, 24, 4, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (125, TO_DATE('2024-05-04', 'YYYY-MM-DD'), NULL, 25, 25, 5, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (126, TO_DATE('2024-05-05', 'YYYY-MM-DD'), TO_DATE('2024-05-19', 'YYYY-MM-DD'), 26, 26, 6, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (127, TO_DATE('2024-05-06', 'YYYY-MM-DD'), TO_DATE('2024-05-20', 'YYYY-MM-DD'), 27, 27, 7, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (128, TO_DATE('2024-05-07', 'YYYY-MM-DD'), NULL, 28, 28, 8, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (129, TO_DATE('2024-05-08', 'YYYY-MM-DD'), TO_DATE('2024-05-22', 'YYYY-MM-DD'), 29, 29, 9, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (130, TO_DATE('2024-05-09', 'YYYY-MM-DD'), TO_DATE('2024-05-23', 'YYYY-MM-DD'), 30, 30, 10, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (131, TO_DATE('2024-05-10', 'YYYY-MM-DD'), NULL, 31, 31, 11, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (132, TO_DATE('2024-05-11', 'YYYY-MM-DD'), TO_DATE('2024-05-25', 'YYYY-MM-DD'), 32, 32, 12, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (133, TO_DATE('2024-05-12', 'YYYY-MM-DD'), TO_DATE('2024-05-26', 'YYYY-MM-DD'), 33, 33, 13, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (134, TO_DATE('2024-05-13', 'YYYY-MM-DD'), NULL, 34, 34, 14, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (135, TO_DATE('2024-05-14', 'YYYY-MM-DD'), TO_DATE('2024-05-28', 'YYYY-MM-DD'), 35, 35, 15, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (136, TO_DATE('2024-05-15', 'YYYY-MM-DD'), TO_DATE('2024-05-29', 'YYYY-MM-DD'), 36, 36, 16, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (137, TO_DATE('2024-05-16', 'YYYY-MM-DD'), NULL, 37, 37, 17, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (138, TO_DATE('2024-05-17', 'YYYY-MM-DD'), TO_DATE('2024-05-31', 'YYYY-MM-DD'), 38, 38, 18, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (139, TO_DATE('2024-05-18', 'YYYY-MM-DD'), TO_DATE('2024-06-01', 'YYYY-MM-DD'), 39, 39, 19, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (140, TO_DATE('2024-05-19', 'YYYY-MM-DD'), NULL, 40, 40, 20, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (141, TO_DATE('2024-05-20', 'YYYY-MM-DD'), TO_DATE('2024-06-03', 'YYYY-MM-DD'), 41, 41, 1, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (142, TO_DATE('2024-05-21', 'YYYY-MM-DD'), NULL, 42, 42, 2, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (143, TO_DATE('2024-05-22', 'YYYY-MM-DD'), TO_DATE('2024-06-05', 'YYYY-MM-DD'), 43, 43, 3, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (144, TO_DATE('2024-05-23', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), 44, 44, 4, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (145, TO_DATE('2024-05-24', 'YYYY-MM-DD'), NULL, 45, 45, 5, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (146, TO_DATE('2024-05-25', 'YYYY-MM-DD'), TO_DATE('2024-06-08', 'YYYY-MM-DD'), 46, 46, 6, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (147, TO_DATE('2024-05-26', 'YYYY-MM-DD'), TO_DATE('2024-06-09', 'YYYY-MM-DD'), 47, 47, 7, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (148, TO_DATE('2024-05-27', 'YYYY-MM-DD'), NULL, 48, 48, 8, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (149, TO_DATE('2024-05-28', 'YYYY-MM-DD'), TO_DATE('2024-06-11', 'YYYY-MM-DD'), 49, 49, 9, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (150, TO_DATE('2024-05-29', 'YYYY-MM-DD'), TO_DATE('2024-06-12', 'YYYY-MM-DD'), 50, 50, 10, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (151, TO_DATE('2024-05-30', 'YYYY-MM-DD'), NULL, 1, 51, 11, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (152, TO_DATE('2024-05-31', 'YYYY-MM-DD'), TO_DATE('2024-06-14', 'YYYY-MM-DD'), 2, 52, 12, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (153, TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_DATE('2024-06-15', 'YYYY-MM-DD'), 3, 53, 13, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (154, TO_DATE('2024-06-02', 'YYYY-MM-DD'), NULL, 4, 54, 14, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (155, TO_DATE('2024-06-03', 'YYYY-MM-DD'), TO_DATE('2024-06-17', 'YYYY-MM-DD'), 5, 55, 15, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (156, TO_DATE('2024-06-04', 'YYYY-MM-DD'), TO_DATE('2024-06-18', 'YYYY-MM-DD'), 6, 56, 16, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (157, TO_DATE('2024-06-05', 'YYYY-MM-DD'), NULL, 7, 57, 17, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (158, TO_DATE('2024-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-20', 'YYYY-MM-DD'), 8, 58, 18, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (159, TO_DATE('2024-06-07', 'YYYY-MM-DD'), TO_DATE('2024-06-21', 'YYYY-MM-DD'), 9, 59, 19, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (160, TO_DATE('2024-06-08', 'YYYY-MM-DD'), NULL, 10, 60, 20, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (161, TO_DATE('2024-06-09', 'YYYY-MM-DD'), TO_DATE('2024-06-23', 'YYYY-MM-DD'), 11, 61, 1, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (162, TO_DATE('2024-06-10', 'YYYY-MM-DD'), NULL, 12, 62, 2, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (163, TO_DATE('2024-06-11', 'YYYY-MM-DD'), TO_DATE('2024-06-25', 'YYYY-MM-DD'), 13, 63, 3, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (164, TO_DATE('2024-06-12', 'YYYY-MM-DD'), TO_DATE('2024-06-26', 'YYYY-MM-DD'), 14, 64, 4, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (165, TO_DATE('2024-06-13', 'YYYY-MM-DD'), NULL, 15, 65, 5, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (166, TO_DATE('2024-06-14', 'YYYY-MM-DD'), TO_DATE('2024-06-28', 'YYYY-MM-DD'), 16, 66, 6, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (167, TO_DATE('2024-06-15', 'YYYY-MM-DD'), TO_DATE('2024-06-29', 'YYYY-MM-DD'), 17, 67, 7, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (168, TO_DATE('2024-06-16', 'YYYY-MM-DD'), NULL, 18, 68, 8, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (169, TO_DATE('2024-06-17', 'YYYY-MM-DD'), TO_DATE('2024-07-01', 'YYYY-MM-DD'), 19, 69, 9, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (170, TO_DATE('2024-06-18', 'YYYY-MM-DD'), TO_DATE('2024-07-02', 'YYYY-MM-DD'), 20, 70, 10, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (171, TO_DATE('2024-06-19', 'YYYY-MM-DD'), NULL, 21, 71, 11, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (172, TO_DATE('2024-06-20', 'YYYY-MM-DD'), TO_DATE('2024-07-04', 'YYYY-MM-DD'), 22, 72, 12, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (173, TO_DATE('2024-06-21', 'YYYY-MM-DD'), TO_DATE('2024-07-05', 'YYYY-MM-DD'), 23, 73, 13, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (174, TO_DATE('2024-06-22', 'YYYY-MM-DD'), NULL, 24, 74, 14, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (175, TO_DATE('2024-06-23', 'YYYY-MM-DD'), TO_DATE('2024-07-07', 'YYYY-MM-DD'), 25, 75, 15, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (176, TO_DATE('2024-06-24', 'YYYY-MM-DD'), TO_DATE('2024-07-08', 'YYYY-MM-DD'), 26, 76, 16, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (177, TO_DATE('2024-06-25', 'YYYY-MM-DD'), NULL, 27, 77, 17, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (178, TO_DATE('2024-06-26', 'YYYY-MM-DD'), TO_DATE('2024-07-10', 'YYYY-MM-DD'), 28, 78, 18, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (179, TO_DATE('2024-06-27', 'YYYY-MM-DD'), TO_DATE('2024-07-11', 'YYYY-MM-DD'), 29, 79, 19, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (180, TO_DATE('2024-06-28', 'YYYY-MM-DD'), NULL, 30, 80, 20, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (181, TO_DATE('2024-06-29', 'YYYY-MM-DD'), TO_DATE('2024-07-13', 'YYYY-MM-DD'), 31, 81, 1, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (182, TO_DATE('2024-06-30', 'YYYY-MM-DD'), NULL, 32, 82, 2, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (183, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-15', 'YYYY-MM-DD'), 33, 83, 3, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (184, TO_DATE('2024-01-02', 'YYYY-MM-DD'), TO_DATE('2024-01-16', 'YYYY-MM-DD'), 34, 84, 4, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (185, TO_DATE('2024-01-03', 'YYYY-MM-DD'), NULL, 35, 85, 5, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (186, TO_DATE('2024-01-04', 'YYYY-MM-DD'), TO_DATE('2024-01-18', 'YYYY-MM-DD'), 36, 86, 6, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (187, TO_DATE('2024-01-05', 'YYYY-MM-DD'), TO_DATE('2024-01-19', 'YYYY-MM-DD'), 37, 87, 7, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (188, TO_DATE('2024-01-06', 'YYYY-MM-DD'), NULL, 38, 88, 8, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (189, TO_DATE('2024-01-07', 'YYYY-MM-DD'), TO_DATE('2024-01-21', 'YYYY-MM-DD'), 39, 89, 9, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (190, TO_DATE('2024-01-08', 'YYYY-MM-DD'), TO_DATE('2024-01-22', 'YYYY-MM-DD'), 40, 90, 10, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (191, TO_DATE('2024-01-09', 'YYYY-MM-DD'), NULL, 41, 91, 11, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (192, TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-01-24', 'YYYY-MM-DD'), 42, 92, 12, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (193, TO_DATE('2024-01-11', 'YYYY-MM-DD'), TO_DATE('2024-01-25', 'YYYY-MM-DD'), 43, 93, 13, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (194, TO_DATE('2024-01-12', 'YYYY-MM-DD'), NULL, 44, 94, 14, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (195, TO_DATE('2024-01-13', 'YYYY-MM-DD'), TO_DATE('2024-01-27', 'YYYY-MM-DD'), 45, 95, 15, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (196, TO_DATE('2024-01-14', 'YYYY-MM-DD'), TO_DATE('2024-01-28', 'YYYY-MM-DD'), 46, 96, 16, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (197, TO_DATE('2024-01-15', 'YYYY-MM-DD'), NULL, 47, 97, 17, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (198, TO_DATE('2024-01-16', 'YYYY-MM-DD'), TO_DATE('2024-01-30', 'YYYY-MM-DD'), 48, 98, 18, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (199, TO_DATE('2024-01-17', 'YYYY-MM-DD'), TO_DATE('2024-01-31', 'YYYY-MM-DD'), 49, 99, 19, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (200, TO_DATE('2024-01-18', 'YYYY-MM-DD'), NULL, 50, 100, 20, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (201, TO_DATE('2024-01-19', 'YYYY-MM-DD'), TO_DATE('2024-02-02', 'YYYY-MM-DD'), 1, 1, 1, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (202, TO_DATE('2024-01-20', 'YYYY-MM-DD'), NULL, 2, 2, 2, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (203, TO_DATE('2024-01-21', 'YYYY-MM-DD'), TO_DATE('2024-02-04', 'YYYY-MM-DD'), 3, 3, 3, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (204, TO_DATE('2024-01-22', 'YYYY-MM-DD'), TO_DATE('2024-02-05', 'YYYY-MM-DD'), 4, 4, 4, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (205, TO_DATE('2024-01-23', 'YYYY-MM-DD'), NULL, 5, 5, 5, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (206, TO_DATE('2024-01-24', 'YYYY-MM-DD'), TO_DATE('2024-02-07', 'YYYY-MM-DD'), 6, 6, 6, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (207, TO_DATE('2024-01-25', 'YYYY-MM-DD'), TO_DATE('2024-02-08', 'YYYY-MM-DD'), 7, 7, 7, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (208, TO_DATE('2024-01-26', 'YYYY-MM-DD'), NULL, 8, 8, 8, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (209, TO_DATE('2024-01-27', 'YYYY-MM-DD'), TO_DATE('2024-02-10', 'YYYY-MM-DD'), 9, 9, 9, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (210, TO_DATE('2024-01-28', 'YYYY-MM-DD'), TO_DATE('2024-02-11', 'YYYY-MM-DD'), 10, 10, 10, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (211, TO_DATE('2024-01-29', 'YYYY-MM-DD'), NULL, 11, 11, 11, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (212, TO_DATE('2024-01-30', 'YYYY-MM-DD'), TO_DATE('2024-02-13', 'YYYY-MM-DD'), 12, 12, 12, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (213, TO_DATE('2024-01-31', 'YYYY-MM-DD'), TO_DATE('2024-02-14', 'YYYY-MM-DD'), 13, 13, 13, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (214, TO_DATE('2024-02-01', 'YYYY-MM-DD'), NULL, 14, 14, 14, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (215, TO_DATE('2024-02-02', 'YYYY-MM-DD'), TO_DATE('2024-02-16', 'YYYY-MM-DD'), 15, 15, 15, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (216, TO_DATE('2024-02-03', 'YYYY-MM-DD'), TO_DATE('2024-02-17', 'YYYY-MM-DD'), 16, 16, 16, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (217, TO_DATE('2024-02-04', 'YYYY-MM-DD'), NULL, 17, 17, 17, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (218, TO_DATE('2024-02-05', 'YYYY-MM-DD'), TO_DATE('2024-02-19', 'YYYY-MM-DD'), 18, 18, 18, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (219, TO_DATE('2024-02-06', 'YYYY-MM-DD'), TO_DATE('2024-02-20', 'YYYY-MM-DD'), 19, 19, 19, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (220, TO_DATE('2024-02-07', 'YYYY-MM-DD'), NULL, 20, 20, 20, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (221, TO_DATE('2024-02-08', 'YYYY-MM-DD'), TO_DATE('2024-02-22', 'YYYY-MM-DD'), 21, 21, 1, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (222, TO_DATE('2024-02-09', 'YYYY-MM-DD'), NULL, 22, 22, 2, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (223, TO_DATE('2024-02-10', 'YYYY-MM-DD'), TO_DATE('2024-02-24', 'YYYY-MM-DD'), 23, 23, 3, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (224, TO_DATE('2024-02-11', 'YYYY-MM-DD'), TO_DATE('2024-02-25', 'YYYY-MM-DD'), 24, 24, 4, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (225, TO_DATE('2024-02-12', 'YYYY-MM-DD'), NULL, 25, 25, 5, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (226, TO_DATE('2024-02-13', 'YYYY-MM-DD'), TO_DATE('2024-02-27', 'YYYY-MM-DD'), 26, 26, 6, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (227, TO_DATE('2024-02-14', 'YYYY-MM-DD'), TO_DATE('2024-02-28', 'YYYY-MM-DD'), 27, 27, 7, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (228, TO_DATE('2024-02-15', 'YYYY-MM-DD'), NULL, 28, 28, 8, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (229, TO_DATE('2024-02-16', 'YYYY-MM-DD'), TO_DATE('2024-03-02', 'YYYY-MM-DD'), 29, 29, 9, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (230, TO_DATE('2024-02-17', 'YYYY-MM-DD'), TO_DATE('2024-03-03', 'YYYY-MM-DD'), 30, 30, 10, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (231, TO_DATE('2024-02-18', 'YYYY-MM-DD'), NULL, 31, 31, 11, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (232, TO_DATE('2024-02-19', 'YYYY-MM-DD'), TO_DATE('2024-03-05', 'YYYY-MM-DD'), 32, 32, 12, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (233, TO_DATE('2024-02-20', 'YYYY-MM-DD'), TO_DATE('2024-03-06', 'YYYY-MM-DD'), 33, 33, 13, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (234, TO_DATE('2024-02-21', 'YYYY-MM-DD'), NULL, 34, 34, 14, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (235, TO_DATE('2024-02-22', 'YYYY-MM-DD'), TO_DATE('2024-03-08', 'YYYY-MM-DD'), 35, 35, 15, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (236, TO_DATE('2024-02-23', 'YYYY-MM-DD'), TO_DATE('2024-03-09', 'YYYY-MM-DD'), 36, 36, 16, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (237, TO_DATE('2024-02-24', 'YYYY-MM-DD'), NULL, 37, 37, 17, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (238, TO_DATE('2024-02-25', 'YYYY-MM-DD'), TO_DATE('2024-03-11', 'YYYY-MM-DD'), 38, 38, 18, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (239, TO_DATE('2024-02-26', 'YYYY-MM-DD'), TO_DATE('2024-03-12', 'YYYY-MM-DD'), 39, 39, 19, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (240, TO_DATE('2024-02-27', 'YYYY-MM-DD'), NULL, 40, 40, 20, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (241, TO_DATE('2024-02-28', 'YYYY-MM-DD'), TO_DATE('2024-03-14', 'YYYY-MM-DD'), 41, 41, 1, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (242, TO_DATE('2024-02-29', 'YYYY-MM-DD'), NULL, 42, 42, 2, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (243, TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-15', 'YYYY-MM-DD'), 43, 43, 3, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (244, TO_DATE('2024-03-02', 'YYYY-MM-DD'), TO_DATE('2024-03-16', 'YYYY-MM-DD'), 44, 44, 4, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (245, TO_DATE('2024-03-03', 'YYYY-MM-DD'), NULL, 45, 45, 5, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (246, TO_DATE('2024-03-04', 'YYYY-MM-DD'), TO_DATE('2024-03-18', 'YYYY-MM-DD'), 46, 46, 6, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (247, TO_DATE('2024-03-05', 'YYYY-MM-DD'), TO_DATE('2024-03-19', 'YYYY-MM-DD'), 47, 47, 7, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (248, TO_DATE('2024-03-06', 'YYYY-MM-DD'), NULL, 48, 48, 8, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (249, TO_DATE('2024-03-07', 'YYYY-MM-DD'), TO_DATE('2024-03-21', 'YYYY-MM-DD'), 49, 49, 9, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (250, TO_DATE('2024-03-08', 'YYYY-MM-DD'), TO_DATE('2024-03-22', 'YYYY-MM-DD'), 50, 50, 10, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (251, TO_DATE('2024-03-09', 'YYYY-MM-DD'), NULL, 1, 51, 11, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (252, TO_DATE('2024-03-10', 'YYYY-MM-DD'), TO_DATE('2024-03-24', 'YYYY-MM-DD'), 2, 52, 12, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (253, TO_DATE('2024-03-11', 'YYYY-MM-DD'), TO_DATE('2024-03-25', 'YYYY-MM-DD'), 3, 53, 13, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (254, TO_DATE('2024-03-12', 'YYYY-MM-DD'), NULL, 4, 54, 14, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (255, TO_DATE('2024-03-13', 'YYYY-MM-DD'), TO_DATE('2024-03-27', 'YYYY-MM-DD'), 5, 55, 15, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (256, TO_DATE('2024-03-14', 'YYYY-MM-DD'), TO_DATE('2024-03-28', 'YYYY-MM-DD'), 6, 56, 16, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (257, TO_DATE('2024-03-15', 'YYYY-MM-DD'), NULL, 7, 57, 17, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (258, TO_DATE('2024-03-16', 'YYYY-MM-DD'), TO_DATE('2024-03-30', 'YYYY-MM-DD'), 8, 58, 18, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (259, TO_DATE('2024-03-17', 'YYYY-MM-DD'), TO_DATE('2024-03-31', 'YYYY-MM-DD'), 9, 59, 19, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (260, TO_DATE('2024-03-18', 'YYYY-MM-DD'), NULL, 10, 60, 20, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (261, TO_DATE('2024-03-19', 'YYYY-MM-DD'), TO_DATE('2024-04-02', 'YYYY-MM-DD'), 11, 61, 1, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (262, TO_DATE('2024-03-20', 'YYYY-MM-DD'), NULL, 12, 62, 2, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (263, TO_DATE('2024-03-21', 'YYYY-MM-DD'), TO_DATE('2024-04-04', 'YYYY-MM-DD'), 13, 63, 3, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (264, TO_DATE('2024-03-22', 'YYYY-MM-DD'), TO_DATE('2024-04-05', 'YYYY-MM-DD'), 14, 64, 4, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (265, TO_DATE('2024-03-23', 'YYYY-MM-DD'), NULL, 15, 65, 5, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (266, TO_DATE('2024-03-24', 'YYYY-MM-DD'), TO_DATE('2024-04-07', 'YYYY-MM-DD'), 16, 66, 6, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (267, TO_DATE('2024-03-25', 'YYYY-MM-DD'), TO_DATE('2024-04-08', 'YYYY-MM-DD'), 17, 67, 7, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (268, TO_DATE('2024-03-26', 'YYYY-MM-DD'), NULL, 18, 68, 8, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (269, TO_DATE('2024-03-27', 'YYYY-MM-DD'), TO_DATE('2024-04-10', 'YYYY-MM-DD'), 19, 69, 9, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (270, TO_DATE('2024-03-28', 'YYYY-MM-DD'), TO_DATE('2024-04-11', 'YYYY-MM-DD'), 20, 70, 10, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (271, TO_DATE('2024-03-29', 'YYYY-MM-DD'), NULL, 21, 71, 11, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (272, TO_DATE('2024-03-30', 'YYYY-MM-DD'), TO_DATE('2024-04-13', 'YYYY-MM-DD'), 22, 72, 12, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (273, TO_DATE('2024-03-31', 'YYYY-MM-DD'), TO_DATE('2024-04-14', 'YYYY-MM-DD'), 23, 73, 13, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (274, TO_DATE('2024-04-01', 'YYYY-MM-DD'), NULL, 24, 74, 14, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (275, TO_DATE('2024-04-02', 'YYYY-MM-DD'), TO_DATE('2024-04-16', 'YYYY-MM-DD'), 25, 75, 15, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (276, TO_DATE('2024-04-03', 'YYYY-MM-DD'), TO_DATE('2024-04-17', 'YYYY-MM-DD'), 26, 76, 16, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (277, TO_DATE('2024-04-04', 'YYYY-MM-DD'), NULL, 27, 77, 17, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (278, TO_DATE('2024-04-05', 'YYYY-MM-DD'), TO_DATE('2024-04-19', 'YYYY-MM-DD'), 28, 78, 18, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (279, TO_DATE('2024-04-06', 'YYYY-MM-DD'), TO_DATE('2024-04-20', 'YYYY-MM-DD'), 29, 79, 19, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (280, TO_DATE('2024-04-07', 'YYYY-MM-DD'), NULL, 30, 80, 20, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (281, TO_DATE('2024-04-08', 'YYYY-MM-DD'), TO_DATE('2024-04-22', 'YYYY-MM-DD'), 31, 81, 1, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (282, TO_DATE('2024-04-09', 'YYYY-MM-DD'), NULL, 32, 82, 2, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (283, TO_DATE('2024-04-10', 'YYYY-MM-DD'), TO_DATE('2024-04-24', 'YYYY-MM-DD'), 33, 83, 3, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (284, TO_DATE('2024-04-11', 'YYYY-MM-DD'), TO_DATE('2024-04-25', 'YYYY-MM-DD'), 34, 84, 4, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (285, TO_DATE('2024-04-12', 'YYYY-MM-DD'), NULL, 35, 85, 5, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (286, TO_DATE('2024-04-13', 'YYYY-MM-DD'), TO_DATE('2024-04-27', 'YYYY-MM-DD'), 36, 86, 6, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (287, TO_DATE('2024-04-14', 'YYYY-MM-DD'), TO_DATE('2024-04-28', 'YYYY-MM-DD'), 37, 87, 7, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (288, TO_DATE('2024-04-15', 'YYYY-MM-DD'), NULL, 38, 88, 8, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (289, TO_DATE('2024-04-16', 'YYYY-MM-DD'), TO_DATE('2024-04-30', 'YYYY-MM-DD'), 39, 89, 9, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (290, TO_DATE('2024-04-17', 'YYYY-MM-DD'), TO_DATE('2024-05-01', 'YYYY-MM-DD'), 40, 90, 10, 10);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (291, TO_DATE('2024-04-18', 'YYYY-MM-DD'), NULL, 41, 91, 11, 1);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (292, TO_DATE('2024-04-19', 'YYYY-MM-DD'), TO_DATE('2024-05-03', 'YYYY-MM-DD'), 42, 92, 12, 2);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (293, TO_DATE('2024-04-20', 'YYYY-MM-DD'), TO_DATE('2024-05-04', 'YYYY-MM-DD'), 43, 93, 13, 3);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (294, TO_DATE('2024-04-21', 'YYYY-MM-DD'), NULL, 44, 94, 14, 4);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (295, TO_DATE('2024-04-22', 'YYYY-MM-DD'), TO_DATE('2024-05-06', 'YYYY-MM-DD'), 45, 95, 15, 5);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (296, TO_DATE('2024-04-23', 'YYYY-MM-DD'), TO_DATE('2024-05-07', 'YYYY-MM-DD'), 46, 96, 16, 6);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (297, TO_DATE('2024-04-24', 'YYYY-MM-DD'), NULL, 47, 97, 17, 7);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (298, TO_DATE('2024-04-25', 'YYYY-MM-DD'), TO_DATE('2024-05-09', 'YYYY-MM-DD'), 48, 98, 18, 8);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (299, TO_DATE('2024-04-26', 'YYYY-MM-DD'), TO_DATE('2024-05-10', 'YYYY-MM-DD'), 49, 99, 19, 9);
INSERT INTO UL_Loans (loan_id, loan_date, return_date, student_id, book_id, librarian_id, branch_id) 
VALUES (300, TO_DATE('2024-04-27', 'YYYY-MM-DD'), NULL, 50, 100, 20, 10);

-- Commit all changes to save the data
COMMIT;