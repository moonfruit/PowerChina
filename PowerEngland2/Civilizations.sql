--
-- Ignore
--
CREATE TABLE 'MyIgnoreTraits' ('TraitType' TEXT NOT NULL);

INSERT INTO MyIgnoreTraits VALUES
-- Leaders
('TRAIT_LEADER_RELIGIOUS_CONVERT'),
-- Civilization Unique Infrastructures
('TRAIT_CIVILIZATION_DISTRICT_ACROPOLIS'),
('TRAIT_CIVILIZATION_DISTRICT_COTHON'),
('TRAIT_CIVILIZATION_DISTRICT_SEOWON'),
('TRAIT_CIVILIZATION_MBANZA'),
-- ('TRAIT_CIVILIZATION_BUILDING_STAVE_CHURCH'),
('TRAIT_CIVILIZATION_IMPROVEMENT_GOLF_COURSE'),
('TRAIT_CIVILIZATION_IMPROVEMENT_KAMPUNG'),
('TRAIT_CIVILIZATION_IMPROVEMENT_MEKEWAP'),
('TRAIT_CIVILIZATION_IMPROVEMENT_PAIRIDAEZA'),
('TRAIT_CIVILIZATION_IMPROVEMENT_POLDER'),
-- Civilization Units
-- ('TRAIT_CIVILIZATION_UNIT_HYPASPIST'),
-- ('TRAIT_CIVILIZATION_UNIT_ROMAN_LEGION'),
-- ('TRAIT_CIVILIZATION_UNIT_KONGO_SHIELD_BEARER'),
-- ('TRAIT_CIVILIZATION_UNIT_MAORI_TOA'),
-- ('TRAIT_CIVILIZATION_UNIT_SPANISH_CONQUISTADOR'),
-- ('TRAIT_CIVILIZATION_UNIT_HUNGARY_HUSZAR'),
-- ('TRAIT_CIVILIZATION_UNIT_ARABIAN_MAMLUK'),
-- ('TRAIT_CIVILIZATION_UNIT_INDONESIAN_JONG'),
-- ('TRAIT_CIVILIZATION_UNIT_OTTOMAN_BARBARY_CORSAIR'),
-- ('TRAIT_CIVILIZATION_UNIT_PHOENICIA_NUMIDIAN_CAVALRY'),
-- Civilizations
('TRAIT_BARBARIAN');


--
-- Civilizations
--
CREATE TABLE 'MyCivilizationTraits' ('CivilizationType' TEXT NOT NULL, 'TraitType' TEXT NOT NULL);

INSERT INTO MyCivilizationTraits (CivilizationType, TraitType)
SELECT CivilizationType, TraitType FROM CivilizationTraits
 WHERE CivilizationType IN (SELECT CivilizationType FROM Civilizations WHERE RandomCityNameDepth > 1)
   AND TraitType NOT IN (SELECT TraitType FROM MyIgnoreTraits);

INSERT INTO CivilizationTraits (CivilizationType, TraitType)
SELECT 'CIVILIZATION_ENGLAND', TraitType FROM MyCivilizationTraits
 WHERE CivilizationType <> 'CIVILIZATION_ENGLAND';


--
-- Leaders
--
CREATE TABLE 'MyLeaderTraits' ('LeaderType' TEXT NOT NULL, 'TraitType' TEXT NOT NULL);

INSERT INTO MyLeaderTraits (LeaderType, TraitType)
SELECT LeaderType, TraitType FROM LeaderTraits
 WHERE LeaderType IN (SELECT LeaderType FROM Leaders WHERE SceneLayers = 4)
   AND TraitType IN (SELECT TraitType FROM Traits WHERE NAME IS NOT NULL)
   AND TraitType NOT IN (SELECT TraitType FROM MyIgnoreTraits);

INSERT INTO LeaderTraits (LeaderType, TraitType)
SELECT DISTINCT 'LEADER_VICTORIA', TraitType FROM MyLeaderTraits
 WHERE LeaderType <> 'LEADER_VICTORIA';


--
-- Clean
--
DROP TABLE 'MyLeaderTraits';
DROP TABLE 'MyCivilizationTraits';
DROP TABLE 'MyIgnoreTraits';
