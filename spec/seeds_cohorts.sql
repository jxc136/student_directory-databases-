TRUNCATE TABLE cohorts RESTART IDENTITY CASCADE;
TRUNCATE TABLE students RESTART IDENTITY;
-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO cohorts (name, starting_date) VALUES ('April', '2022-04-01');
INSERT INTO cohorts (name, starting_date) VALUES ('May', '2022-05-01');
INSERT INTO cohorts (name, starting_date) VALUES ('November', '2022-11-01');

INSERT INTO students (name, cohort_id) VALUES ('David', '1');
INSERT INTO students (name, cohort_id) VALUES ('Anna', '2');
INSERT INTO students (name, cohort_id) VALUES ('Josh', '3');
INSERT INTO students (name, cohort_id) VALUES ('Daisy', '3');
INSERT INTO students (name, cohort_id) VALUES ('Jude', '3');

