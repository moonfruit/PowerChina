-- LEADER_QIN and CIVILIZATION_CHINA and FIRST_EMPEROR_TRAIT

create table 'PowerLeader_Excluded'
(
    'TraitType' text not null,
    'ModifierId' text not null,
    primary key(TraitType, ModifierId)
);

insert into PowerLeader_Excluded
    (TraitType,                                  ModifierId)
values
    -- 巴比伦                                    尤里卡提供科技的所有科技值。
    ('TRAIT_CIVILIZATION_BABYLON',              'TRAIT_EUREKA_INCREASE'),
    -- 巴比伦                                    每回合的科技值-50%。
    ('TRAIT_CIVILIZATION_BABYLON',              'TRAIT_SCIENCE_DECREASE'),
    -- 加拿大                                    无法对城邦宣战或发动突袭战争。
    ('TRAIT_CIVILIZATION_FACES_OF_PEACE',       'TRAIT_NO_SUPRISE_WAR_FOR_CANADA'),
    -- 高卢                                      特色区域也无法建在市中心旁。
    ('TRAIT_CIVILIZATION_GAUL',                 'TRAIT_CIVILIZATION_GAUL_CITY_NO_ADJACENT_DISTRICT'),
    -- 马里                                      矿山-1生产力。
    ('TRAIT_CIVILIZATION_MALI_GOLD_DESERT',     'TRAIT_MALI_MINES_PRODUCTION'),
    -- 马里                                      建造建筑时-30%生产力。
    ('TRAIT_CIVILIZATION_MALI_GOLD_DESERT',     'TRAIT_LESS_BUILDING_PRODUCTION'),
    -- 马里                                      建造建筑时-30%生产力。
    ('TRAIT_CIVILIZATION_MALI_GOLD_DESERT',     'TRAIT_LESS_UNIT_PRODUCTION'),
    -- 毛利                                      无法收获资源。
    ('TRAIT_CIVILIZATION_MAORI_MANA',           'TRAIT_MAORI_PREVENT_HARVEST'),
    -- 玛雅                                      在淡水和海岸旁定居时不提供额外住房
    ('TRAIT_CIVILIZATION_MAYAB',                'TRAIT_NO_FRESH_WATER_HOUSING'),
    -- 葡萄牙                                    国际贸易路线必须起源于海岸城市，并只能通往处于海岸上或拥有港口的城市。
    ('TRAIT_CIVILIZATION_PORTUGAL',             'TRAIT_FORBID_INTERNATIONAL_LAND_ROUTES'),
    -- 越南                                      所有陆地特色区域只能建造在树林上。
    ('TRAIT_CIVILIZATION_VIETNAM',              'TRAIT_DISTRICTS_FOREST_ONLY'),
    -- 越南                                      所有陆地特色区域只能建造在沼泽上。
    ('TRAIT_CIVILIZATION_VIETNAM',              'TRAIT_DISTRICTS_MARSH_ONLY'),
    -- 越南                                      所有陆地特色区域只能建造在雨林上。
    ('TRAIT_CIVILIZATION_VIETNAM',              'TRAIT_DISTRICTS_JUNGLE_ONLY'),

    -- 巴比伦                                    特色建筑 - 沟渠
    ('TRAIT_CIVILIZATION_BUILDING_PALGUM',      'ANY'),
    -- 毛利                                      特色建筑 - 毛利会堂
    ('TRAIT_CIVILIZATION_BUILDING_MARAE',       'ANY'),
    -- 希腊                                      特色区域 - 卫城 - 替代剧院广场
    ('TRAIT_CIVILIZATION_DISTRICT_ACROPOLIS',   'ANY'),
    -- 腓尼基                                    特色区域 - U型港 - 替代港口
    ('TRAIT_CIVILIZATION_DISTRICT_COTHON',      'ANY'),
    -- 玛雅                                      特色区域 - 天文台 - 替代学院
    -- ('TRAIT_CIVILIZATION_DISTRICT_OBSERVATORY', 'ANY'),
    -- 高卢                                      特色区域 - 奧皮杜姆 - 替代工业区
    ('TRAIT_CIVILIZATION_DISTRICT_OPPIDUM',     'ANY'),
    -- 朝鲜                                      特色区域 - 书院 - 替代学院
    ('TRAIT_CIVILIZATION_DISTRICT_SEOWON',      'ANY'),
    -- 越南                                      特色区域 - 城池 - 替代军营
    ('TRAIT_CIVILIZATION_DISTRICT_THANH',       'ANY'),
    -- 拜占庭                                    特色区域 - 跑马场 - 替代娱乐中心
    ('TRAIT_CIVILIZATION_DISTRICT_HIPPODROME',  'ANY'),
    -- 刚果                                      特色区域 - 姆班赞 - 替代社区
    ('TRAIT_CIVILIZATION_MBANZA',               'ANY'),
    -- 苏格兰                                    特色改良设施 - 高尔夫球场
    -- ('TRAIT_CIVILIZATION_IMPROVEMENT_GOLF_COURSE', 'ANY'),
    -- 印度尼西亚                                特色改良设施 - 甘榜屋
    ('TRAIT_CIVILIZATION_IMPROVEMENT_KAMPUNG',  'ANY'),
    -- 克里                                      特色改良设施 - 棚屋
    -- ('TRAIT_CIVILIZATION_IMPROVEMENT_MEKEWAP',  'ANY'),
    -- 波斯                                      特色改良设施 - 波斯庭院
    -- ('TRAIT_CIVILIZATION_IMPROVEMENT_PAIRIDAEZA', 'ANY'),
    -- 荷兰                                      特色改良设施 - 圩田
    -- ('TRAIT_CIVILIZATION_IMPROVEMENT_POLDER',   'ANY'),
    -- 努比亚                                    特色改良设施 - 努比亚金字塔
    -- ('TRAIT_CIVILIZATION_IMPROVEMENT_PYRAMID',  'ANY'),

    -- 美国 - 亚伯拉罕·林肯                      种植园每回合提供的忠诚度-2
    ('TRAIT_LEADER_LINCOLN',                    'PLANTATION_NEGATIVE_LOYALTY'),
    -- 玛雅 - 六日夫人                           首都6单元格范围外的非首都城市的所有产出-15%。
    ('TRAIT_LEADER_MUTAL',                      'TRAIT_LEADER_NEARBY_CITIES_LOSE_YIELDS'),
    -- 刚果 - 恩津加·姆班德                      和你的首都处于不同大陆的城市-15%产出。
    ('TRAIT_LEADER_NZINGA_MBANDE',              'TRAIT_FOREIGN_CONTINENT_YIELD')
    -- 刚果 - 姆本巴·恩津加                      无法建造圣地区、获得大预言家，或创建宗教。从已成为多数刚果城市信仰的宗教中获得信仰值。
    ('TRAIT_LEADER_RELIGIOUS_CONVERT',          'TRAIT_GAINS_FOUNDER_BELIEF_MAJORITY_RELIGION'),
    -- 日本 - 特色能力                           国际贸易路线的产出和旅游业绩-25%
    ('TRAIT_LEADER_TOKUGAWA',                   'TOKUGAWA_NEGATIVE_INTERNATIONAL_TOURISM'),
    -- 朝鲜 - 善德女王 - 和而不同                非首都且未派遣总督的城市-8忠诚度。
    ('TRAIT_LEADER_HWARANG',                    'HWARANG_LOYALTY_DEBUFF'),
    -- 朝鲜 - 善德女王 - 和而不同                非首都且未派遣总督的城市-2宜居度。
    ('TRAIT_LEADER_HWARANG',                    'HWARANG_AMENITY_DEBUFF'),
    -- 朝鲜 - 善德女王 - 和而不同                非首都且未派遣总督的城市-50%全部产出。
    ('TRAIT_LEADER_HWARANG',                    'HWARANG_ALLDEBUFF');

insert or replace into StartBiasTerrains (CivilizationType, TerrainType, Tier)
values ('CIVILIZATION_CHINA', 'TERRAIN_COAST', 3);

insert or replace into LeaderTraits (LeaderType, TraitType)
select 'LEADER_QIN', TraitType
from LeaderTraits
where not (LeaderType in ('LEADER_QIN', 'LEADER_BARBARIAN')
    or LeaderType like 'LEADER_MINOR_%'
    or TraitType in (select TraitType from Traits where InternalOnly = 1)
    or TraitType in (select TraitType from PowerLeader_Excluded));

insert or replace into LeaderTraits (LeaderType, TraitType)
select 'LEADER_QIN', TraitType
from CivilizationTraits
where not (CivilizationType in ('CIVILIZATION_CHINA', 'CIVILIZATION_BARBARIAN')
    or TraitType in (select TraitType from PowerLeader_Excluded));

insert or replace into TraitModifiers (TraitType, ModifierId)
select 'FIRST_EMPEROR_TRAIT', ModifierId
from TraitModifiers
where TraitType in (select TraitType from PowerLeader_Excluded)
  and ModifierId not in (select ModifierId from PowerLeader_Excluded);

-- 越南特性重组 -
insert or ignore into TraitModifiers (TraitType, ModifierId)
select 'FIRST_EMPEROR_TRAIT', 'TRAIT_JUNGLE_VALID_' || DistrictType
from Districts
where DistrictType != 'DISTRICT_CITY_CENTER';
insert or ignore into TraitModifiers (TraitType, ModifierId)
select 'FIRST_EMPEROR_TRAIT', 'TRAIT_MARSH_VALID_' || DistrictType
from Districts
where DistrictType != 'DISTRICT_CITY_CENTER';
insert or ignore into TraitModifiers (TraitType, ModifierId)
select 'FIRST_EMPEROR_TRAIT', 'TRAIT_FOREST_VALID_' || DistrictType
from Districts
where DistrictType != 'DISTRICT_CITY_CENTER';

insert or ignore into Modifiers (ModifierId, ModifierType)
select 'TRAIT_JUNGLE_VALID_' || DistrictType, 'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS'
from Districts
where DistrictType != 'DISTRICT_CITY_CENTER';
insert or ignore into Modifiers (ModifierId, ModifierType)
select 'TRAIT_MARSH_VALID_' || DistrictType, 'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS'
from Districts
where DistrictType != 'DISTRICT_CITY_CENTER';
insert or ignore into Modifiers (ModifierId, ModifierType)
select 'TRAIT_FOREST_VALID_' || DistrictType, 'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS'
from Districts
where DistrictType != 'DISTRICT_CITY_CENTER';

insert or ignore into ModifierArguments (ModifierId, Name, Value)
select 'TRAIT_JUNGLE_VALID_' || DistrictType, 'DistrictType', DistrictType
from Districts
where DistrictType != 'DISTRICT_CITY_CENTER';
insert or ignore into ModifierArguments (ModifierId, Name, Value)
select 'TRAIT_MARSH_VALID_' || DistrictType, 'DistrictType', DistrictType
from Districts
where DistrictType != 'DISTRICT_CITY_CENTER';
insert or ignore into ModifierArguments (ModifierId, Name, Value)
select 'TRAIT_FOREST_VALID_' || DistrictType, 'DistrictType', DistrictType
from Districts
where DistrictType != 'DISTRICT_CITY_CENTER';
insert or ignore into ModifierArguments (ModifierId, Name, Value)
select 'TRAIT_JUNGLE_VALID_' || DistrictType, 'FeatureType', 'FEATURE_JUNGLE'
from Districts
where DistrictType != 'DISTRICT_CITY_CENTER';
insert or ignore into ModifierArguments (ModifierId, Name, Value)
select 'TRAIT_MARSH_VALID_' || DistrictType, 'FeatureType', 'FEATURE_MARSH'
from Districts
where DistrictType != 'DISTRICT_CITY_CENTER';
insert or ignore into ModifierArguments (ModifierId, Name, Value)
select 'TRAIT_FOREST_VALID_' || DistrictType, 'FeatureType', 'FEATURE_FOREST'
from Districts
where DistrictType != 'DISTRICT_CITY_CENTER';

drop table PowerLeader_Excluded;
