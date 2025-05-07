

-- SOURCES :  - handling DATE and TIME TYPES : https://www.youtube.com/watch?v=pfL-9ntZqnI&ab_channel=RobConery


-- c'est du localStorage coté User avec BackUp et Update Login/LoggOut + repeatly at timed
-- idealement géré par la Fonction SESSIONS de DJANGO BACk apres AUth


------------------------------------------- liste des entités liées aux FEATURES de l'APP

---------------- Projets

CREATE TABLE IF NOT EXISTS "projects" (
    "id" SERIAL, 
    "name" VARCHAR(128) NOT NULL DEFAULT "TBD",
    "nature" "project_nature" NOT NULL DEFAULT "Undefined",
    "type" "project_type" NOT NULL DEFAULT "Undefined",
    "status" "project_status" NOT NULL DEFAULT "Undefined",
    -- "image" MEDIA,
    "creation_date" TIMESTAMPTZ,
    "owner_id" INT,
    PRIMARY KEY("id"),
    FOREIGN KEY("owner_id") REFERENCES "users"("id")
);

---------------- Tasks

CREATE TABLE IF NOT EXISTS "tasks" (
    "id" SERIAL, 
    "name" VARCHAR(128) NOT NULL DEFAULT "Undefined"
    "nature" "task_nature" NOT NULL DEFAULT "Undefined",
    "type" "task_type" NOT NULL DEFAULT "Standard",
    "status" "task_status" NOT NULL DEFAULT "Undefined",
    "creation_date" TIMESTAMPTZ NOT NULL DEFAULT "creation_date"= CURRENT_TIMESTAMP(),
    "start_date" DATE NOT NULL DEFAULT "start_date"= CURRENT_DATE(),
    "start_time" TIME DEFAULT "start_time"= CURRENT_TIME(),
    "end_date" DATE NOT NULL DEFAULT "end_date"= CURRENT_DATE(),
    "end_time" TIME DEFAULT "end_time"= CURRENT_TIME(),
    "description" VARCHAR(1024) NOT NULL DEFAULT "TBD",
    "user_id" INT,
    "project_id" INT,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("project_id") REFERENCES "projects"("id")
);

---------------- Bibles

CREATE TABLE IF NOT EXISTS "bibles" (
    "id" SERIAL, 
    "name" VARCHAR(128) NOT NULL DEFAULT "TBD",
    "project_id" INT,
    "creation_date" TIMESTAMPTZ,
    "description" VARCHAR(1024) NOT NULL DEFAULT "TBD",
    "owner_id" INT,
    PRIMARY KEY("id"),
    FOREIGN KEY("owner_id") REFERENCES "users"("id"),
    FOREIGN KEY("project_id") REFERENCES "projects"("id")
);

---------------- Ideas

CREATE TABLE IF NOT EXISTS "ideas" (
    "id" SERIAL, 
    "name" VARCHAR(128) NOT NULL DEFAULT "No name",
    "nature" "idea_nature" NOT NULL DEFAULT "Undefined",
    "type" "idea_type" NOT NULL DEFAULT "Random",
    "status" "idea_status" NOT NULL DEFAULT "Raw",
    "project_id" INT,
    "description" VARCHAR(1024) NOT NULL DEFAULT "Something to thonk about...",
    "creation_date" TIMESTAMPTZ,
    "owner_id" INT,
    PRIMARY KEY("id"),
    FOREIGN KEY("owner_id") REFERENCES "users"("id")
);

