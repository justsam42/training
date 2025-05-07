
-- liste des objets qui ont des chidlren by name
CREATE VIEW "object_children" AS 
    SELECT "name" AS "parentName", "object_related_id" AS "children_id" FROM "objects_relations"
    JOIN "objects" ON "objects"."id" = "object_relations"."object_reference_id" 
    JOIN "object_relations" ON "object_relations"."object_related_id" = "objects"."id"
    WHERE "relation" = 'children' 
    GROUP BY "name"; 


/* 
-- liste des objets qui sont des children by id
SELECT "related_object_id" FROM "objects_relations"
WHERE "relation" = "children";


--trouver le nom de ces cHIldren
SELECT "name" AS "childrenName" FROM "objects"
WHERE "id" IN (
    SELECT "related_object_id" FROM "objects_relations"
    WHERE "relation" = "children"
);


-- liste des paires parents/children

SELECT "reference_object_id", "related_object_id" FROM "objects_relations"
WHERE "relation" = "children"
GROUP BY "reference_object_id"; */