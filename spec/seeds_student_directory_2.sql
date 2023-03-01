TRUNCATE TABLE cohorts RESTART IDENTITY;
TRUNCATE TABLE students RESTART IDENTITY;

INSERT INTO cohorts (name, starting_date) VALUES ('April 22', '04/20/2022');
INSERT INTO cohorts (name, starting_date) VALUES ('June 22', '06/23/2022');
INSERT INTO cohorts (name, starting_date) VALUES ('August 22', '08/27/2022');

INSERT INTO students (name, cohort_id) VALUES ('Mike Tyson', 2);
INSERT INTO students (name, cohort_id) VALUES ('Serena Williams', 1);
INSERT INTO students (name, cohort_id) VALUES ('Novak Djokovic', 3);
INSERT INTO students (name, cohort_id) VALUES ('Maria Sharapova', 3);
INSERT INTO students (name, cohort_id) VALUES ('Ana Ivanovic', 3);
INSERT INTO students (name, cohort_id) VALUES ('Gerald Butler', 2);
