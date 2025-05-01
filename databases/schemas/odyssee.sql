-- liste des entités liées à la structure informatique de l'APP

CREATE TABLE IF NOT EXISTS "routes" (
    "id" SERIAL,
    "name" VARCHAR(64) NOT NULL,
    "app" "app_names" NOT NULL DEFAULT 'Undefined',
    -- "style_id" INT,
    PRIMARY KEY("id")
    -- FOREIGN KEY ("style_id") REFERENCES "styles"("id")
);

CREATE TABLE IF NOT EXISTS "pages" (
    "id" SERIAL,
    "name" VARCHAR(64) NOT NULL,
    "app" "app_names" NOT NULL DEFAULT 'Undefined',
    "route_id" INT,
    -- "style_id" INT,
    PRIMARY KEY("id"),
    FOREIGN KEY ("route_id") REFERENCES "routes"("id")
    -- FOREIGN KEY ("style_id") REFERENCES "styles"("id")
);

CREATE TABLE IF NOT EXISTS "views" (
    "id" SERIAL,
    "name" VARCHAR(64) NOT NULL,
    "app" "app_names" NOT NULL DEFAULT 'Undefined',
    "route_id" INT,
    "page_id" INT,
    -- "style_id" INT,
    PRIMARY KEY("id"),
    FOREIGN KEY ("route_id") REFERENCES "routes"("id"),
    FOREIGN KEY ("page_id") REFERENCES "pages"("id")
    -- FOREIGN KEY ("style_id") REFERENCES "styles"("id")
);


-- liste des entités liées aux features de l'APP

------------- gestion de projet : 

CREATE TABLE IF NOT EXISTS "users" (
    "id" SERIAL,
    "username" VARCHAR(64) NOT NULL UNIQUE,
    "password" VARCHAR(128) NOT NULL,
    "email" VARCHAR(128) NOT NULL UNIQUE,
    "birth_date" DATE,
    -- "image" MEDIA, 
    PRIMARY KEY("id")
);

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


------------- contenu des bibles : 

CREATE TABLE IF NOT EXISTS "environments" (
    "id" SERIAL, 
    "name" VARCHAR(128) NOT NULL,
    "nature" "environment_nature" NOT NULL DEFAULT "Undefined",
    "type" "environment_type" NOT NULL DEFAULT "Undefined",
    -- "image" MEDIA,
    -- "location" TBD,
    -- "size" TBD,
    -- "parent_id" INT,
    "creation_date" DATE,
    "creator_id" INT,
    PRIMARY KEY("id"),
    FOREIGN KEY("creator_id") REFERENCES "users"("id")
);

CREATE TABLE IF NOT EXISTS "events" (
    "id" SERIAL,
    "name" VARCHAR(128) NOT NULL DEFAULT 'Undefined event',
    "nature" "event_nature" NOT NULL DEFAULT 'Undefined',
    "origin" "event_origin" NOT NULL DEFAULT 'Undefined',
    "scope" "event_scope" NOT NULL DEFAULT 'Undefined',
    "start_date" DATE,
    "start_time" TIME,
    "end_date" DATE,
    "end_time" TIME,
    "description" VARCHAR(1024) NOT NULL,
    -- "source" "entry_groundings" NOT NULL DEFAULT 'drafting',
    -- "related_resources" TEXT, */
    PRIMARY KEY("id")
);



-- Tables relatives aux characters 
CREATE TABLE IF NOT EXISTS "classes" (
    "id" SERIAL, 
    "name" VARCHAR(128) NOT NULL,
    --"nature" "classe_nature" NOT NULL DEFAULT "Undefined",
    --"type" "class_type" NOT NULL DEFAULT "Undefined", 
    "description" VARCHAR(1024),
    --"scope" "class_scope" NOT NULL DEFAULT "Undefined", 
    "apparition_date" VARCHAR(64) NOT NULL DEFAULT "Undefined",
    "population" INT,
    "project_id" INT,
    "bible_id" INT,
    "entry_date" DATE,
    PRIMARY KEY("id"),
    FOREIGN KEY("owner_id") REFERENCES "characters"("id"),
    FOREIGN KEY("current_possessor_id") REFERENCES "characters"("id"),
    FOREIGN KEY("project_id") REFERENCES "projects"("id"),
    FOREIGN KEY("bible_id") REFERENCES "bibles"("id")
);

CREATE TABLE IF NOT EXISTS "identities" (
    "id" SERIAL,
);




-- agents
CREATE TABLE IF NOT EXISTS "characters" (
    "id" SERIAL,
    "first_name" VARCHAR(64) NOT NULL DEFAULT 'anonymous',
    "last_name" VARCHAR(64) NOT NULL DEFAULT 'anonymous',
    "middle_name" VARCHAR(64),
    "nature" "character_nature" NOT NULL DEFAULT 'Undefined', -- par rapport à l'univers ou la bible (TBD) auquel il appartient
    "scope" "character_scope" NOT NULL DEFAULT 'Undefined', -- ses apparitions par rapport à tous les univers ou bible/histoire
    "class_id" INT,
    "description" VARCHAR(1000) NOT NULL,
    "project_id" INT,
    "bible_id" INT,
    "entry_date" DATE,
    PRIMARY KEY("id"), 
    FOREIGN KEY("class_id") REFERENCES "classes"("id")
    FOREIGN KEY("project_id") REFERENCES "projects"("id"),
    FOREIGN KEY("bible_id") REFERENCES "bibles"("id")
); 


-- needs, goods, actants, etc. 
CREATE TABLE IF NOT EXISTS "items" (
    "id" SERIAL, 
    "name" VARCHAR(128) NOT NULL,
    "nature" "item_nature" NOT NULL DEFAULT "Undefined",
    "type" "item_type" NOT NULL DEFAULT "Undefined", 
    "description" VARCHAR(1024),
    "scope" "item_scope" NOT NULL DEFAULT "Undefined", 
    "apparition_date" VARCHAR(64) NOT NULL DEFAULT "Undefined",
    "sustainability" "item_sustainability" NOT NULL DEFAULT "Undefined",
    "owner_id" INT,
    "current_possessor_id" INT,
    "project_id" INT,
    "bible_id" INT,
    "entry_date" DATE,
    PRIMARY KEY("id"),
    FOREIGN KEY("owner_id") REFERENCES "characters"("id"),
    FOREIGN KEY("current_possessor_id") REFERENCES "characters"("id"),
    FOREIGN KEY("project_id") REFERENCES "projects"("id"),
    FOREIGN KEY("bible_id") REFERENCES "bibles"("id")
); 


-- trajectoires des agents
CREATE TABLE IF NOT EXISTS "journeys" (

); 

CREATE TABLE IF NOT EXISTS "quests" (); -- objectif que veut ou doit atteindre un agent

CREATE TABLE IF NOT EXISTS "stories" (); -- recit composé des états et situations des ETANTS entre deux EVENTS ; il est stucturé selon une logique narrative


------------- gestion des personnages : 

CREATE TABLE IF NOT EXISTS "appearance" (); -- combinaison des différentes caracteristiques genotypique, phenotypique et biographique

CREATE TABLE IF NOT EXISTS "personnalities" (); -- combinaison des differents types de classification des profils (MBTI, dere, enneagram, etc...)

CREATE TABLE IF NOT EXISTS "beliefs" (); -- combinaisons des éléments qui composent les valeurs, motivations et principes d'un agent

CREATE TABLE IF NOT EXISTS "needs" (); -- liste des elements essentiels à la persistence/existence d'une entité

CREATE TABLE IF NOT EXISTS "wants" (); -- liste des elements ou situations qu'un agent veut posseder ou faire advenir

CREATE TABLE IF NOT EXISTS "actions" (); -- liste des events qu'un agent peut ou veut ou doit mettre en actes. 

CREATE TABLE IF NOT EXISTS "means" (); -- liste des ressources mobilisables ou actionnables ou utilisables pour réaliser une action, atteindre un objectifs ou satisfaire un besoin/desir



------------- gestion des trajectoires ou JOURNEYS des étants : 