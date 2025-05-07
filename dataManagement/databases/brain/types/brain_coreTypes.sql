-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it
-- RAPPEL PSQL Synthax


----------------------------------------------------------- liste des types liés aux structures informatiques de mes apps 
CREATE TYPE "app_names" AS ENUM('odyssee', 'undefined');


CREATE TYPE "object_natures" AS ENUM('Foundation', 'Template', 'Interactif', 'Display','Other','Unknown', 'Undefined');
CREATE TYPE "object_types" AS ENUM('Media', 'Feature','Style', 'Path', 'Trigger', 'Effect','Data', 'UI', 'Other','Undefined' 'Unknown');
CREATE TYPE "object_classes" AS ENUM('Text', 'Action', 'Route', 'Page', 'View', 'Section','Component','Other', 'Unknown', 'Undefined');
CREATE TYPE "objects_relationship" AS ENUM('Parent', 'Children','Other','Trigger', 'Target')


CREATE TYPE "function_natures" AS ENUM('Interface-related', 'User-related', 'Features-related', 'Content-related', 'Other', 'Undefined' 'Unknown');
CREATE TYPE "function_types" AS ENUM('SideEffect', 'Styling', 'Displaying', 'Transforming', 'Data mangagement','Preferences','Unknown', 'Undefined');
CREATE TYPE "function_scopes" AS ENUM('Global', 'Local', 'Individual', 'Other','Unknown', 'Undefined');

CREATE TYPE "requirement_natures" AS ENUM('Undefined' 'Unknown');
CREATE TYPE "requirement_types" AS ENUM('Undefined' 'Unknown');


-----  Medias

CREATE TYPE "media_nature" AS ENUM('Document', 'Audio', 'Video', 'Image', 'Webpage','Other', 'Undefined');
CREATE TYPE "media_type" AS ENUM('App Asset', 'Global asset','User content', 'Other', 'Undefined');
CREATE TYPE "media_classe" AS ENUM('UI', 'data', 'Other', 'Undefined');
CREATE TYPE "medias_relationship"  AS ENUM('Attribute', 'Children', 'Other', 'Undefined')
