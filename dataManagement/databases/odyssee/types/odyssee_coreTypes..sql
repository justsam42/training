-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it
-- RAPPEL PSQL Synthax


---------------------------------------------------------- liste des types liés aux features de l'app ODYSSEE

----- Projets

CREATE TYPE "project_nature" AS ENUM('Scenario', 'Book', 'Paper', 'Other', 'Undefined');
CREATE TYPE "project_type" AS ENUM('Graphic', 'Movie', 'Serial', 'Novel', 'Game', 'Science', 'Other', 'Undefined');
CREATE TYPE "project_status" AS ENUM('Idea', 'Design', 'Developpment', 'Improvement', 'Approved','Suspended', 'Abordted', 'Pivoting','Undefined');

----- Task

CREATE TYPE "task_nature" AS ENUM('Rendez-vous', 'To-do', 'Meeting', 'To Contact','Other', 'Undefined');
CREATE TYPE "task_type" AS ENUM('Urgent', 'Important', 'Can wait', 'Standard');
CREATE TYPE "task_status" AS ENUM('Coming', 'Current', 'Done', 'Undefined');


----- Ideas

CREATE TYPE "idea_nature" AS ENUM('New project', 'Addition', 'Developpement', 'Other', 'Undefined');
CREATE TYPE "idea_type" AS ENUM('Priority','Brilliant', 'Important', 'Can wait', 'Other', 'Random');
CREATE TYPE "idea_status" AS ENUM('Raw', 'To grow', 'Filed');
