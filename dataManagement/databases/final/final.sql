-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it
-- RAPPEL PSQL Synthax


------------------------ TYPES

-- state common choices available for db user across several tables

CREATE TYPE "entry_groundings" AS ENUM('drafting', 'literature review', 'primary data', 'secondary data')
CREATE TYPE "proofs" AS ENUM('to find', 'literature review', 'primary data', 'secondary data')


-- state choices related to EVENTS
CREATE TYPE "event_nature" AS ENUM('real', 'fictionnal', 'undefined', 'unknown');
CREATE TYPE "event_origin" AS ENUM('natural', 'human', 'unknown', 'undefined');
CREATE TYPE "event_scope" AS ENUM('global', 'local', 'individual','unknown', 'undefined');


-- state choices related to PERSONS
CREATE TYPE "person_nature" AS ENUM('real', 'fictionnal', 'ideal');
CREATE TYPE "person_type" AS ENUM('persona', 'research subject', 'character', 'user');
CREATE TYPE "person_class" AS ENUM('unknown', 'undefined', 'archetype');
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
CREATE TYPE "person_event_relationship" AS ENUM('witnessed', 'affected', 'unknown', 'undefined');




------------------------ TABLES

-- events occur
CREATE TABLE IF NOT EXISTS "events" (
    "id" SERIAL,
    "name" VARCHAR(128) NOT NULL DEFAULT 'unknown event',
    "start_date" DATE,
    "start_time" TIME,
    "end_date" DATE,
    "end_time" TIME,
    "description" VARCHAR(1000) NOT NULL,
    "nature" "event_nature" NOT NULL DEFAULT 'undefined',
    "origin" "event_origin" NOT NULL DEFAULT 'undefined',
    "scope" "event_scope" NOT NULL DEFAULT 'undefined',
    "source" "entry_groundings" NOT NULL DEFAULT 'drafting',
    "related_resources" TEXT,
    PRIMARY KEY("id")
);


-- differents variants of anthropomorphic beings exists
CREATE TABLE IF NOT EXISTS "persons" (
    "id" SERIAL,
    "nature" "person_nature" NOT NULL,
    "type" "person_type" NOT NULL,
    "class" "person_class" NOT NULL,
    "description" VARCHAR(1000) NOT NULL,
    "first_name" VARCHAR(64) NOT NULL DEFAULT 'anonymous',
    "last_name" VARCHAR(64) NOT NULL DEFAULT 'anonymous',
    "middle_name" VARCHAR(64),
    PRIMARY KEY("id")
);


-- events and persons can be related in different ways
CREATE TABLE IF NOT EXISTS "experiences" (
    "event" INT,
    "person" INT,
    "relation" "person_event_relationship" NOT NULL DEFAULT 'undefined',
    "proof_of_relation" "proofs" NOT NULL DEFAULT 'to find',
    "effect" SMALLINT NOT NULL CHECK("effect" IN (-1, 0, 1, 99)) DEFAULT 99,
    FOREIGN KEY("event") REFERENCES "events"("id"),
    FOREIGN KEY("person") REFERENCES "persons"("id")

);


-- ces personnes ont des besoins
CREATE TABLE IF NOT EXISTS "needs" (
    "id" SERIAL,
    "name" VARCHAR(64) NOT NULL UNIQUE,
    "nature" "need_nature" NOT NULL DEFAULT 'undefined',
    "type" "need_type" NOT NULL DEFAULT 'undefined',
    "class" "need_class" NOT NULL DEFAULT 'undefined',
    "description" VARCHAR(1000) NOT NULL,
    "source" "entry_groundings" NOT NULL DEFAULT 'drafting',
    "related_resources" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "functionnings" (
    "person" INT,
    "need" INT,
    "satisfied" BOOLEAN DEFAULT 'no',
    FOREIGN KEY("person") REFERENCES "persons"("id"),
    FOREIGN KEY("need") REFERENCES "needs"("id")

);

--leurs besoins font apparaitre des objectifs
CREATE TABLE IF NOT EXISTS "goals" (
    "id" SERIAL,
    "name" VARCHAR(64) NOT NULL DEFAULT 'unnamed goal',
    "nature" "goal_nature" NOT NULL DEFAULT 'undefined',
    "origin" "goal_origin" NOT NULL DEFAULT 'undefined',
    "type" "goal_type" NOT NULL DEFAULT 'undefined',
    "class" "goal_class" NOT NULL DEFAULT 'undefined',
    "description" VARCHAR(1000) NOT NULL,
    PRIMARY KEY("id")
);



-- il existe des moyens de satisfaire ces besoins
CREATE TABLE IF NOT EXISTS "means" (
    "id" SERIAL,
    "name" VARCHAR(64) NOT NULL DEFAULT 'unknown means',
    "nature" "means_nature" NOT NULL DEFAULT 'undefined',
    "type" "means_type" NOT NULL DEFAULT 'undefined',
    "class" "means_class" NOT NULL DEFAULT 'undefined',
    "description" VARCHAR(1000) NOT NULL,
    "scarcity" SMALLINT CHECK("scarcity" BETWEEN 0 AND 100),
    PRIMARY KEY("id")
);


CREATE TABLE IF NOT EXISTS "requirements" (
    "need" INT,
    "mean" INT,
    FOREIGN KEY("need") REFERENCES "needs"("id"),
    FOREIGN KEY("mean") REFERENCES "means"("id")

);


-- ces moyens peuvent avoir un access restreint
CREATE TABLE IF NOT EXISTS "access" (
    "id" SERIAL,
    "name" VARCHAR(64) NOT NULL DEFAULT 'unknown access',
    PRIMARY KEY("id")
)ark


CREATE TABLE IF NOT EXISTS "locks" (
    "mean" INT,
    "access" INT,
    FOREIGN KEY("mean") REFERENCES "means"("id"),
    FOREIGN KEY("access") REFERENCES "access"("id")
);

--certaines personnes ont des access que d'autres s'ont pas
CREATE TABLE IF NOT EXISTS "keys" (
    "person" INT,
    "access" INT,
    "droit_usage" BOOLEAN DEFAULT 'no', --usus
    "droit_exploitation" BOOLEAN DEFAULT 'no', --fructus
    "droit_propriete" BOOLEAN DEFAULT 'no', --abusus (vie ou de mort)
    FOREIGN KEY("person") REFERENCES "persons"("id"),
    FOREIGN KEY("access") REFERENCES "access"("id")
);


-- les personnes prennent donc des decisions
CREATE TABLE IF NOT EXISTS "decisions" (
    "id" SERIAL,
    "name" VARCHAR(64) NOT NULL DEFAULT 'unknown decision',
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "involvement" (
    "person" INT,
    "decision" INT,
    FOREIGN KEY("person") REFERENCES "persons"("id"),
    FOREIGN KEY("decision") REFERENCES "decisions"("id")
);

-- ces decisions conduisent à des plans
CREATE TABLE IF NOT EXISTS "plans" (
    "id" SERIAL,
    "name" VARCHAR(64) NOT NULL DEFAULT 'unknown plan',
    PRIMARY KEY("id")
);


-- ces plans peuvent déboucher sur des actions
CREATE TABLE IF NOT EXISTS "actions" (
    "id" SERIAL,
    "name" VARCHAR(64) NOT NULL DEFAULT 'unknown action',
    PRIMARY KEY("id")
);


-- ces plans peuvent déboucher sur des actions
CREATE TABLE IF NOT EXISTS "steps" (
    "plan" INT,
    "action" INT,
    FOREIGN KEY("plan") REFERENCES "plans"("id"),
    FOREIGN KEY("action") REFERENCES "actions"("id")
);

-- ces actions poursuivent un objectif
CREATE TABLE IF NOT EXISTS "targets" (
    "goal" INT,
    "action" INT,
    FOREIGN KEY("goal") REFERENCES "goals"("id"),
    FOREIGN KEY("action") REFERENCES "actions"("id")
);

-- ces actions déclenchent également d'autres évenements
CREATE TABLE IF NOT EXISTS "triggers" (
    "action" INT,
    "event" INT,
    FOREIGN KEY("event") REFERENCES "events"("id"),
    FOREIGN KEY("action") REFERENCES "actions"("id")
);
