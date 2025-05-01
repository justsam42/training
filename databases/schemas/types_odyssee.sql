-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it
-- RAPPEL PSQL Synthax


------------------------ TYPES

-- liste des types liés aux structure info de mes apps 
CREATE TYPE "app_names" AS ENUM('odyssee', 'undefined');


---------- liste des types liés aux features de l'APP

----- Projets

CREATE TYPE "project_nature" AS ENUM('Scenario', 'Book', 'Paper', 'Other', 'Undefined');
CREATE TYPE "project_type" AS ENUM('BD', 'Movie', 'Serial', 'Novel', 'Game', 'Science', 'Other', 'Undefined');
CREATE TYPE "project_status" AS ENUM('Idea', 'Design', 'Developpment', 'Improvement', 'Approved','Undefined');

----- Task

CREATE TYPE "task_nature" AS ENUM('Rendez-vous', 'To-do', 'Meeting', 'Other', 'Undefined');
CREATE TYPE "task_type" AS ENUM('Urgent', 'Important', 'Can wait', 'Standard');
CREATE TYPE "task_status" AS ENUM('Coming', 'Current', 'Done', 'Undefined');

-----  Medias

CREATE TYPE "media_nature" AS ENUM('Document', 'Audio', 'Video', 'Image', 'Webpage','Other', 'Undefined');
--CREATE TYPE "media_type" AS ENUM('Urgent', 'Important', 'Can wait', 'Standard');


----- Ideas

CREATE TYPE "idea_nature" AS ENUM('New project', 'Addition', 'Developpement', 'Other', 'Undefined');
CREATE TYPE "idea_type" AS ENUM('Brilliant', 'Important', 'Can wait', 'Other', 'Random');
CREATE TYPE "idea_status" AS ENUM('Raw', 'To grow', 'Filed');


----------------- Type des entités relatives aux Bibles

----- Environments

CREATE TYPE "environment_nature" AS ENUM('Real', 'Fictionnal', 'Other' 'Undefined');
CREATE TYPE "environment_type" AS ENUM('Univers', 'Continent', 'Country', 'City', 'Area', 'Other', 'Undefined');


-- Events
CREATE TYPE "event_nature" AS ENUM('Real', 'Fictionnal', 'Other' 'Undefined' 'Unknown');
CREATE TYPE "event_origin" AS ENUM('Natural', 'Agent', 'Situation','Unknown', 'Undefined');
CREATE TYPE "event_scope" AS ENUM('Global', 'Local', 'Individual', 'Other','Unknown', 'Undefined');

-- Characters
CREATE TYPE "class_scope" AS ENUM('Global', 'Local', 'Individual', 'Other','Unknown', 'Undefined')

-- Characters
CREATE TYPE "character_nature" AS ENUM('Main', 'Recurrent', 'Irregular', 'Acessory', 'Undefined');
CREATE TYPE "character_scope" AS ENUM('Global', 'Local', 'Individual', 'Other','Unknown', 'Undefined')



----- Items

CREATE TYPE "item_nature" AS ENUM('Untangible', 'Material', 'Other', 'Unknown','Undefined');
CREATE TYPE "item_type" AS ENUM('Information', 'Food', 'Equipment', 'Furniture','Other', 'Undefined');
CREATE TYPE "item_sustainability" AS ENUM( 'Unlimited', 'Unmeasurable', 'Limited','Unknown', 'Undefined' );
CREATE TYPE "item_scope" AS ENUM('Global', 'Local', 'Other','Unknown', 'Undefined');







-- state common choices available for db user across several tables

CREATE TYPE "entry_groundings" AS ENUM('drafting', 'literature review', 'primary data', 'secondary data')
CREATE TYPE "proofs" AS ENUM('to find', 'literature review', 'primary data', 'secondary data')




-- might be a user defined values list cf psql doc


-- state choices related to NEEDS
CREATE TYPE "need_nature" AS ENUM('essential', 'individual', 'casual', 'undefined');
CREATE TYPE "need_type" AS ENUM('possession', 'state', 'undefined');
CREATE TYPE "need_class" AS ENUM('biological', 'social','undefined');
-- might be a user defined values list cf psql doc


-- state choices related to GOALS
CREATE TYPE "goal_nature" AS ENUM('vital', 'individual', 'global', 'ideal', 'undefined');
CREATE TYPE "goal_origin" AS ENUM('internal', 'external', 'undefined');
CREATE TYPE "goal_type" AS ENUM('undefined');
CREATE TYPE "goal_class" AS ENUM('undefined');
-- might be a user defined values list cf psql doc


-- state choices related to MEANS

CREATE TYPE "means_nature" AS ENUM('being', 'material', 'untangible', 'unknown','undefined');
CREATE TYPE "means_type" AS ENUM('tools', 'energy','matter','knowledge', 'timelap', 'undefined');
CREATE TYPE "means_class" AS ENUM('free', 'goods', 'shared', 'situation', 'unknown', 'undefined');

CREATE TYPE "means_sustainability" AS ENUM('sustainable', 'unsustainable', 'illimited', 'immeasurable', 'unknown', 'undefined');


-- might be a user defined values list cf psql doc


-- state choices related to NEEDS
CREATE TYPE "character_event_relationship" AS ENUM('witnessed', 'affected', 'unknown', 'undefined');


