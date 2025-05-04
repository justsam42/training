
-- obtenir la liste de tous les enfants d'un objet par id
SELECT "children_id" FROM "object_chidren" 
WHERE "parentname" = "my chosen object";  -- insert PAREMETERS

-- obtenir la liste de tous les enfants d'un objet par nom
SELECT "name" AS "childrenName" FROM "objects"
JOIN "object_children" ON "objct_children"."id" = "objects"."id"
WHERE "parentname" = "my chosen object";  -- insert PAREMETERS