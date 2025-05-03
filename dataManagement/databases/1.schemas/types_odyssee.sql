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

--------- Environments

CREATE TYPE "environment_nature" AS ENUM('Real', 'Fictionnal', 'Other' 'Undefined');
CREATE TYPE "environment_type" AS ENUM('Univers', 'Continent', 'Country', 'City', 'Area', 'Other', 'Undefined');


--------- Events
CREATE TYPE "event_nature" AS ENUM('Real', 'Fictionnal', 'Other' 'Undefined' 'Unknown');
CREATE TYPE "event_origin" AS ENUM('Natural', 'Agent', 'Situation','Unknown', 'Undefined');
CREATE TYPE "event_scope" AS ENUM('Global', 'Local', 'Individual', 'Other','Unknown', 'Undefined');

--------- Characters
CREATE TYPE "character_nature" AS ENUM('Main', 'Recurrent', 'Irregular', 'Acessory', 'Undefined');
CREATE TYPE "character_scope" AS ENUM('Global', 'Local', 'Individual', 'Other','Unknown', 'Undefined')


-------- Classes
CREATE TYPE "class_scope" AS ENUM('Global', 'Local', 'Individual', 'Other','Unknown', 'Undefined')


-------- Identities
--- MBTI
CREATE TYPE "reload_mode" AS ENUM('Extraversion', 'Introversion', 'Unknown','Undefined');
CREATE TYPE "perception_mode" AS ENUM('Sensation','Intuition','Unknown','Undefined');
CREATE TYPE "judgement_mode" AS ENUM('Thinking','Feeling','Unknown','Undefined');
CREATE TYPE "dominant_function" AS ENUM('Judgement','Perception','Unknown','Undefined');

--- OCEAN : https://www.truity.com/blog/page/big-five-personality-traits


--------- Personnaity
--- Enneagram
CREATE TYPE "enneagram_centers" AS ENUM('Emotionnal','Intellectual','Instinctual','Unknown','Undefined'); 
CREATE TYPE "enneagram_types" AS ENUM(
    'Giver - II','Achiever - III','Individualist - IV',
    'Investigator - V','Skeptic - VI','Enthusiast - VII',
    'Challenger - VIII','Peacemaker - IX','Perfectionnist - I',
    'Unknown','Undefined'
);
CREATE TYPE "enneagram_vices" AS ENUM(
    'Pride','Lie','Self-consciousness',
    'Greediness','Fear','Hedonism',
    'Luxury','Passivity','Anger',
    'Unknown','Undefined'
);
CREATE TYPE "enneagram_virtues" AS ENUM(
    'Humility','Truth','Equanimity',
    'Detached','Courage','Temperance',
    'Innocence','Productivity','Serenity',
    'Unknown','Undefined'
);
CREATE TYPE "enneagram_fears" AS ENUM(
    'Rejection','Failure','Being flawed',
    'Being overwhelmed','Uncertainty','Negative emotions',
    'Being powerless','Loneliness','Chaos',
    'Unknown','Undefined'
);
CREATE TYPE "enneagram_desires" AS ENUM(
    'Being loved','Admiration','Authenticity',
    'Intellectual elevation','Security','Fun',
    'Order','Stillness','Perfection',
    'Unknown','Undefined'
);
-- https://www.truity.com/blog/enneagram/what-is-enneagram
--https://cee-enneagramme.eu/enneagramme/les-9-types/


--- Quotient Emmotionnel : 
-- https://en.wikipedia.org/wiki/Reuven_Bar-On
-- https://en.wikipedia.org/wiki/Emotional_intelligence
-- https://en.wikipedia.org/wiki/Mayer%E2%80%93Salovey%E2%80%93Caruso_Emotional_Intelligence_Test
-- https://en.wikipedia.org/wiki/Emotional_competence

/* 
- Self-awareness: precise awareness of self emotions
- Self-regulation: controlled emotional expression
- Motivation: emotional self-motivation
- Empathy: adept at modulating the emotional responses of others and helping them to express their emotions
- Social skills: excellent communication skills
- Personal Competence */



--- Love
CREATE TYPE "dere_types" AS ENUM('Unknown','Undefined');
CREATE TYPE "love_lang_types" AS ENUM('Physical Touch','Words of Affirmation','Acts of Service','Receiving Gifts','Quality Time','Unknown','Undefined');
-- https://www.truity.com/blog/page/seven-love-styles


---------- Behavior
--- DISC : https://www.truity.com/blog/page/about-disc-personality-assessment
CREATE TYPE "drive_types" AS ENUM('Pure Drive', 'Drive & Clarity', 'Drive & Influence','Unknown','Undefined');
CREATE TYPE "influence_types" AS ENUM('Pure Influence', 'Influence & Drive', 'Influence & Support','Unknown','Undefined');
CREATE TYPE "support_types" AS ENUM('Pure Support', 'Support & Clarity', 'Support & Influence','Unknown','Undefined');
CREATE TYPE "clarity_types" AS ENUM('Pure Clarity', 'Clarity & Drive', 'Clarity & Support','Unknown','Undefined');


-- state choices related to NEEDS
CREATE TYPE "need_nature" AS ENUM('Essential', 'Vital', 'Peculiar', 'Unusual','Casual', 'Other', 'Unknown' 'Undefined');
CREATE TYPE "need_type" AS ENUM('Possession', 'State', 'Other', 'Unknown','Undefined');
CREATE TYPE "need_class" AS ENUM('Physical', 'Social', 'Mental', 'Other', 'Unknown','Undefined');
-- might be a user defined values list cf psql doc


-- state choices related to WANTS
CREATE TYPE "want_nature" AS ENUM('Materialist', 'Physical', 'Psychological','Intellectual', 'Other', 'Unknown' 'Undefined');
CREATE TYPE "want_type" AS ENUM('Commun', 'Global', 'Individual', 'Local', 'Other', 'Unknown','Undefined');
--CREATE TYPE "want_class" AS ENUM('Passional', 'Ethical', 'Vain', 'Other', 'Unknown','Undefined');


-- state choices related to MEANS
CREATE TYPE "means_nature" AS ENUM('being', 'material', 'untangible', 'unknown','undefined');
CREATE TYPE "means_type" AS ENUM('tools', 'energy','matter','knowledge', 'timelap', 'undefined');
CREATE TYPE "means_class" AS ENUM('free', 'goods', 'shared', 'situation', 'unknown', 'undefined');

CREATE TYPE "means_sustainability" AS ENUM('sustainable', 'unsustainable', 'illimited', 'immeasurable', 'unknown', 'undefined');








-- state choices related to questS
CREATE TYPE "quest_nature" AS ENUM('vital', 'individual', 'global', 'ideal', 'undefined');
CREATE TYPE "quest_origin" AS ENUM('internal', 'external', 'undefined');
CREATE TYPE "quest_type" AS ENUM('undefined');
CREATE TYPE "quest_class" AS ENUM('undefined');






--------- Items

CREATE TYPE "item_nature" AS ENUM('Untangible', 'Material', 'Other', 'Unknown','Undefined');
CREATE TYPE "item_type" AS ENUM('Information', 'Food', 'Equipment', 'Furniture','Other', 'Undefined');
CREATE TYPE "item_sustainability" AS ENUM( 'Unlimited', 'Unmeasurable', 'Limited','Unknown', 'Undefined' );
CREATE TYPE "item_scope" AS ENUM('Global', 'Local', 'Other','Unknown', 'Undefined');







-- state common choices available for db user across several tables

CREATE TYPE "entry_groundings" AS ENUM('drafting', 'literature review', 'primary data', 'secondary data')
CREATE TYPE "proofs" AS ENUM('to find', 'literature review', 'primary data', 'secondary data')




-- might be a user defined values list cf psql doc





-- state choices related to questS
CREATE TYPE "quest_nature" AS ENUM('vital', 'individual', 'global', 'ideal', 'undefined');
CREATE TYPE "quest_origin" AS ENUM('internal', 'external', 'undefined');
CREATE TYPE "quest_type" AS ENUM('undefined');
CREATE TYPE "quest_class" AS ENUM('undefined');
-- might be a user defined values list cf psql doc



-- might be a user defined values list cf psql doc


-- state choices related to NEEDS
CREATE TYPE "character_event_relationship" AS ENUM('witnessed', 'affected', 'unknown', 'undefined');


GENRE_UNIVERS=[
    ("FANTASY", "fantasy"),
    ("REEL", "Réel")
]

PENDANT_TYPE =[
    ("MIR","Miroir"),
    ("OPP", "Opposé"),
    ("JUM", "Jumeau"),
]

STORY_TYPE =[
    ("FILM","Film"),
    ("SERIE", "Série"),
    ("JEU", "Jeu Video"),
    ("BD", "Bande dessinée"),
    ("NOUV", "Nouvelle"),
    ("RMN", "Roman")
]

EVENTS_TYPE = [
    ("LORE", "Lore"),
    ("ETAPE D'UN VOYAGE", "Etape d'un voyage"), 
    ("BACKSTORY", "Backstory"),
    ("TRIGGER", "Element déclencheur"),
    ("RESULT", "Conséquence")
]

LOCATION_TYPE =[
    ("ROOM","Pièce particulière"),
    ("EXT", "Extérieur indéfini"),
    ("VIL", "Ville"),
    ("PAYS", "Pays"),
    ("CONT", "Continent")
]