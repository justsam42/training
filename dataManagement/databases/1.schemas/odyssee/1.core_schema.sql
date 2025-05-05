-- ce seront les models à retro-create dans Django back App : core


-------------------- liste des entités liées à la structure informatique de l'APP

-- provient de l'API Django core qui est la main database de cette appli
-- maj et svg des users settings preferences with AUth or Sessions Django et Rouer react

CREATE TABLE IF NOT EXISTS "users" (
    "id" SERIAL,
    "username" VARCHAR(64) NOT NULL UNIQUE,
    "password" VARCHAR(128) NOT NULL,
    "email" VARCHAR(128) NOT NULL UNIQUE,
    "birth_date" DATE,
    -- "image" MEDIA, 
    PRIMARY KEY("id")
);


--- objects comme dans DOM ou JSON
CREATE TABLE IF NOT EXISTS "objects" (
    "id" SERIAL, 
    "name" VARCHAR(64) NOT NULL,
    "nature" "object_natures" NOT NULL DEFAULT "Undefined",
    "type" "object_types" NOT NULL DEFAULT "Undefined",
    "classe" "object_classes" NOT NULL DEFAULT "Undefined",
    "description" VARCHAR(256) NOT NULL DEFAULT "TBD",
    PRIMARY KEY("id"),
);


--- relation entre deux objets
CREATE TABLE IF NOT EXISTS "objects_relations"(
    "reference_object_id" INT, 
    "related_object_id" INT,
    "relationship" "objects_relationship" NOT NULL DEFAULT "Undefined",
    FOREIGN KEY ("reference_object_id") REFERENCES "objects"("id"), 
    FOREIGN KEY ("related_object_id") REFERENCES "objects"("id")
);


-- liste des events qui déclenche un "actions" ou dans l'applications . 
CREATE TABLE IF NOT EXISTS "functions" (
    "id" SERIAL,
    "name" VARCHAR(64) NOT NULL DEFAULT 'anonymous function',
    "nature" "function_natures" NOT NULL DEFAULT "Undefined",
    "type" "function_type" NOT NULL DEFAULT "Undefined",
    "scope" "function_scope" NOT NULL DEFAULT "Undefined"
    "description" VARCHAR(256) NOT NULL,
    "trigger_id" INT, 
    "target_id" INT,
    "expected_effect" VARCHAR(256) NOT NULL,
    "asynchronous" BOOLEAN DEFAULT 0,
    PRIMARY KEY("id"),
    FOREIGN KEY("trigger_id") REFERENCES "objects"("id"),
    FOREIGN KEY("target_id") REFERENCES "objects"("id")
);

--- functions requirements & errors handling

CREATE TABLE IF NOT EXISTS "requirements" (
    "function_id" INT,
    "factor_nature" "requirement_natures" NOT NULL DEFAULT "Undefined",
    "factor_type" "requirement_types" NOT NULL DEFAULT "Undefined", 
    "met" BOOLEAN NOT NULL DEFAULT 0,
    "error_mgs" VARCHAR(128), 
    FOREIGN KEY("function_id") REFERENCES "functions"("id")
);



-- liste des entités liées aux features de l'APP
-- c'est du localStorage coté User avec BackUp et Update Login/LoggOut + repeatly at timed


-- idealement géré par la Fonction SESSIONS de DJANGO BACk apres AUth

CREATE TABLE IF NOT EXISTS "projects" (
    "id" SERIAL, 
    "name" VARCHAR(128) NOT NULL,
    "nature" "project_nature" NOT NULL DEFAULT "Undefined",
    "type" "project_type" NOT NULL DEFAULT "Undefined",
    "status" "project_status" NOT NULL DEFAULT "Undefined",
    -- "image" MEDIA,
    "creation_date" DATE,
    "owner_id" INT,
    PRIMARY KEY("id"),
    FOREIGN KEY("owner_id") REFERENCES "users"("id")
);

CREATE TABLE IF NOT EXISTS "tasks" (
    "id" SERIAL, 
    "name" VARCHAR(128) NOT NULL,
    "nature" "task_nature" NOT NULL DEFAULT "Undefined",
    "type" "task_type" NOT NULL DEFAULT "Standard",
    "status" "task_status" NOT NULL DEFAULT "Undefined",
    "creation_date" DATE,
    "start_date" DATE,
    "start_time" TIME,
    "end_date" DATE,
    "end_time" TIME,
    "description" VARCHAR(1024) NOT NULL,
    "user_id" INT,
    "project_id" INT,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("project_id") REFERENCES "projects"("id")
);

CREATE TABLE IF NOT EXISTS "medias" (
    "id" SERIAL, 
    "name" VARCHAR(128) NOT NULL,
    "nature" "media_nature" NOT NULL DEFAULT "Undefined",
    --"type" "media_type" NOT NULL DEFAULT "Undefined", format du media (mp3, txt, ...)
    "import_date" DATE,
    "description" VARCHAR(1024),
    "owner_id" INT,
    "project_id" INT,
    PRIMARY KEY("id"),
    FOREIGN KEY("owner_id") REFERENCES "users"("id"),
    FOREIGN KEY("project_id") REFERENCES "projects"("id")
);

CREATE TABLE IF NOT EXISTS "bibles" (
    "id" SERIAL, 
    "name" VARCHAR(128) NOT NULL,
    "project_id" INT,
    "creation_date" DATE,
    "description" VARCHAR(1024),
    "owner_id" INT,
    PRIMARY KEY("id"),
    FOREIGN KEY("owner_id") REFERENCES "users"("id"),
    FOREIGN KEY("project_id") REFERENCES "projects"("id")
);

CREATE TABLE IF NOT EXISTS "ideas" (
    "id" SERIAL, 
    "name" VARCHAR(128) NOT NULL,
    "nature" "idea_nature" NOT NULL DEFAULT "Undefined",
    "type" "idea_type" NOT NULL DEFAULT "Random",
    "status" "idea_status" NOT NULL DEFAULT "Raw",
    "project_id" INT,
    "description" VARCHAR(1024) NOT NULL,
    "creation_date" DATE,
    "owner_id" INT,
    PRIMARY KEY("id"),
    FOREIGN KEY("owner_id") REFERENCES "users"("id")
);

