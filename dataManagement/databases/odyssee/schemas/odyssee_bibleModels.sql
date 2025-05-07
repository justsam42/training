

-- ce seront les models à retro-create dans Django back App : Bible

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
    FOREIGN KEY("project_id") REFERENCES "projects"("id"),
    FOREIGN KEY("bible_id") REFERENCES "bibles"("id")
);

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


-- resources, goods, actants, etc. 
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




------------- gestion des personnages : 

CREATE TABLE IF NOT EXISTS "identities" (
    "character_id" INT,
    "regeneration" "reload_mode" NOT NULL DEFAULT "Undefined",
    "perception" "perception_mode" NOT NULL DEFAULT "Undefined",
    "reflection" "judgment_mode" NOT NULL DEFAULT "Undefined",
    "direction" "dominant_function" NOT NULL DEFAULT "Undefined",
    "openness" SMALLINT CHECK("openness" BETWEEN 0 AND 5 ),
    "consciousness" SMALLINT CHECK("consciousness" BETWEEN 0 AND 5 ),
    "extraversion" SMALLINT CHECK("extraversion" BETWEEN 0 AND 5 ),
    "agreability" SMALLINT CHECK("agreability" BETWEEN 0 AND 5 ),
    "neuroticism" SMALLINT CHECK("neuroticism" BETWEEN 0 AND 5 ),
    FOREIGN KEY ("character_id") REFERENCES "characters"("id")
);

CREATE TABLE IF NOT EXISTS "experiences" (
    "event_id" INT,
    "character_id" INT,
    "reception" SMALLINT NOT NULL DEFAULT 0 CHECK("reception" BETWEEN -5 AND 5),
    "impact" SMALLINT NOT NULL DEFAULT 0 CHECK("impact" BETWEEN 0 AND 10), -- a quel point il a influencé le character
    "memory_accuracy" SMALLINT NOT NULL DEFAULT 0 CHECK("memory_accuracy" BETWEEN 0 AND 100), -- à quel point souvenir diffère de l'event
    "memory_quality" SMALLINT NOT NULL DEFAULT 0 CHECK("memory_quality" BETWEEN 0 AND 100), 
    FOREIGN KEY ("character_id") REFERENCES "characters"("id"),
    FOREIGN KEY ("event_id") REFERENCES "events"("id")
);  



-- combinaison des differents types de classification des profils (MBTI, dere, enneagram, etc...)
CREATE TABLE IF NOT EXISTS "personnalities" (
    "character_id" INT,
    "intelligence" "enneagram_centers" NOT NULL DEFAULT "Undefined",
    "enne_type" "enneagram_types" NOT NULL DEFAULT "Undefined",
    "vice" "enneagram_vices" NOT NULL DEFAULT "Undefined",
    "virtue" "enneagram_virtue" NOT NULL DEFAULT "Undefined",
    "fear" "enneagram_fear" NOT NULL DEFAULT "Undefined",
    "desire" "enneagram_desire" NOT NULL DEFAULT "Undefined",
    FOREIGN KEY ("character_id") REFERENCES "characters"("id")
); 


-- combinaison des différentes caracteristiques genotypique, phenotypique et biographique
CREATE TABLE IF NOT EXISTS "appearance" (); 




-- Needs satisfait la partie "functionnings" de l'être = 
-- ce qui lui est neceesaire pour exister voire perduret dans un état d'être "ideal" 
CREATE TABLE IF NOT EXISTS "needs" (
    "id" SERIAL,
    "name" VARCHAR(64) NOT NULL UNIQUE,
    "nature" "need_nature" NOT NULL DEFAULT 'Undefined',
    "type" "need_type" NOT NULL DEFAULT 'Undefined',
    "class" "need_class" NOT NULL DEFAULT 'Undefined',
    "description" VARCHAR(1024) NOT NULL,
    "work_cost" INT NOT NULL ,  -- effort pour satisfaire besoins
    "benefits" INT NOT NULL , -- 
    "carency_impact" INT NOT NULL, 
    PRIMARY KEY("id")
); 
-- benefits = apport pour une fonction de l'être  
-- (bonus sur function correspondant à cette classe ou autre de need)
-- impact du manque = effect nég sur des aptitudes ou foinctions de d'être dependant de ce need


CREATE TABLE IF NOT EXISTS "functionnings" (
    "character_id" INT,
    "need_id" INT,
    "satisfied" BOOLEAN DEFAULT 'no',
    --"accessibility" SUM,
    FOREIGN KEY("character_id") REFERENCES "characters"("id"),
    FOREIGN KEY("need_id") REFERENCES "needs"("id")

);

-- liste des elements ou situations qu'un agent veut posseder ou faire advenir
-- Want satisfait la partie "idealiste"/"developpement"/"exploration"/"expansion" de l'être = 
-- ce qqu'il pense aider à faire advenir ce qu'il pense être "ideal" de lui-même, 
-- de son bien-être ou d'une situation. Le concept même du désir repose sur l'avidité (forme viciée)
-- et l'expansion et connaissance de l'être de son environnement ou croissance (forece vertueuse ? )
CREATE TABLE IF NOT EXISTS "wants" (
    "id" SERIAL,
    "name" VARCHAR(64) NOT NULL UNIQUE,
    "nature" "want_nature" NOT NULL DEFAULT 'Undefined',
    "type" "want_type" NOT NULL DEFAULT 'Undefined',
    --"class" "want_class" NOT NULL DEFAULT 'Undefined',
    "description" VARCHAR(1024) NOT NULL, 
    "benefits" INT NOT NULL , -- apport pour le desire de l'être
    "absence_impact" INT NOT NULL, -- impact du manque
    PRIMARY KEY("id")
); 
-- work_cost = effort pour satisfaire want qui aurait impact sur personnalities
-- benefits = apport pour une fonction psycho de l'être ex: ennegream vice/vertue
-- (bonus sur function secondaire correspondant à cette classe ou autre du personnage)
-- impact du manque = effect nég sur la peur dans enneagram


-- liste des ressources mobilisables ou actionnables ou utilisables pour réaliser une action, atteindre un objectifs ou satisfaire un besoin/desir
CREATE TABLE IF NOT EXISTS "means" (
    "id" SERIAL,
    "name" VARCHAR(64) NOT NULL UNIQUE,
    "nature" "means_nature" NOT NULL DEFAULT 'Undefined',
    "type" "means_type" NOT NULL DEFAULT 'Undefined',
    "class" "means_class" NOT NULL DEFAULT 'Undefined',
    "description" VARCHAR(1024) NOT NULL,
    "work_cost" INT NOT NULL ,
    "benefits" INT NOT NULL , -- 
    "carency_impact" INT NOT NULL, 
    PRIMARY KEY("id")
); 


-- liste des events qu'un agent peut ou veut ou doit mettre en actes. 
CREATE TABLE IF NOT EXISTS "actions" (
    "id" SERIAL,
    "name" VARCHAR(64) NOT NULL DEFAULT 'unknown action',
    "nature" "action_nature" NOT NULL DEFAULT "Undefined",
    "cause" "action_origin" NOT NULL DEFAULT "Undefined",
    "type" "action_type" NOT NULL DEFAULT "Undefined",
    "description" VARCHAR(256) NOT NULL,
    "trigger_id" INT, 
    "target_id" INT,
    "message" VARCHAR(128),
    
    PRIMARY KEY("id")
);


-- objectif que veut ou doit atteindre un agent
CREATE TABLE IF NOT EXISTS "quests" (
    "id" SERIAL,
    "name" VARCHAR(64) NOT NULL DEFAULT 'unnamed quest',
    "nature" "quest_nature" NOT NULL DEFAULT 'undefined',
    "origin" "quest_origin" NOT NULL DEFAULT 'undefined',
    "type" "quest_type" NOT NULL DEFAULT 'undefined',
    "class" "quest_class" NOT NULL DEFAULT 'undefined',
    "description" VARCHAR(1000) NOT NULL,
    "nature" "want_bonus_nature" NOT NULL DEFAULT 'Undefined',
    "type" "want_bonus_type" NOT NULL DEFAULT 'Undefined',
    "class" "want_bonus_class" NOT NULL DEFAULT 'Undefined',
    "description" VARCHAR(1024) NOT NULL,
    "attention_cost" SMALLINT NOT NULL DEFAULT 0 CHECK("attention_cost" BETWEEN 0 AND 100) ,  -- place de ce desir dans la vie
    "life_impact" "want_malus_types" NOT NULL , -- apport pour une fonction de l'être
    "accessibility" SMALLINT NOT NULL DEFAULT 0 CHECK("attention_cost" BETWEEN 0 AND 100) , --distance entre situation A
    PRIMARY KEY("id")
); 


-- combinaisons des éléments qui composent les valeurs, motivations et principes d'un agent


CREATE TABLE IF NOT EXISTS "beliefs" (
    "character_id" INT,
    "event_id" INT,
    "truth" BOOLEAN DEFAULT 1, 
    "root" INT,
    FOREIGN KEY ("character_id") REFERENCES "characters"("id"),
    FOREIGN KEY ("event_id") REFERENCES "events"("id"),
    FOREIGN KEY ("root") REFERENCES "experiences"("id")
); 





-- combinaison des differents actions et réactions
CREATE TABLE IF NOT EXISTS "behaviors" (
    "character_id" INT,
    "drive" "drive_types" NOT NULL DEFAULT "Undefined",
    "influence" "influence_types" NOT NULL DEFAULT "Undefined",
    "support" "support_types" NOT NULL DEFAULT "Undefined",
    "clarity" "drive_types" NOT NULL DEFAULT "Undefined",
    --"action_id" INT,
    --"means_id" INT
    FOREIGN KEY ("character_id") REFERENCES "characters"("id")
); 



-- trajectoires des agents
CREATE TABLE IF NOT EXISTS "journeys" (
    "character_id" INT,
    "quest_id" INT,
    "event_id" INT,
    --"action_id" INT,
    --"means_id" INT,
    FOREIGN KEY ("character_id") REFERENCES "characters"("id")
    FOREIGN KEY("quest_id") REFERENCES "quests"("id"),
    FOREIGN KEY ("event_id") REFERENCES "events"("id")
    --FOREIGN KEY("action_id") REFERENCES "actions"("id")
);



CREATE TABLE IF NOT EXISTS "stories" (); -- recit composé des états et situations des ETANTS entre deux EVENTS ; il est stucturé selon une logique narrative





------------- gestion des trajectoires ou JOURNEYS des étants : 