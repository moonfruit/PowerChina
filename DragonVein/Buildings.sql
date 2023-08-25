-- 伟人点数
insert into Building_GreatPersonPoints (BuildingType, GreatPersonClassType, PointsPerTurn)
select 'BUILDING_DRAGON', GreatPersonClassType, 1
from GreatPersonClasses;

-- 巨作槽位
insert into Building_GreatWorks (BuildingType, GreatWorkSlotType, NumSlots)
select 'BUILDING_DRAGON', GreatWorkSlotType, 10
from GreatWorkSlotTypes;

-- 全地形
insert into Building_ValidTerrains (BuildingType, TerrainType)
select 'BUILDING_DRAGON', TerrainType
from Terrains;

-- 忽略要素
create table Building_Dragon_Ignore
(
    Item TEXT PRIMARY KEY
);
insert into Building_Dragon_Ignore
values ('SLOT_DIPLOMATIC'),     -- 外交政策槽位: 游戏早期无外交政策填充
       ('SLOT_GREAT_PERSON');   -- 未知政策槽位

-- 政策槽位
insert into Modifiers (ModifierId, ModifierType, RunOnce, Permanent)
select 'TRAIT_DRAGON_GOVERNMENT_' || GovernmentSlotType, 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER', 1, 1
from GovernmentSlots
where GovernmentSlotType not in (select Item from Building_Dragon_Ignore);

insert into ModifierArguments (ModifierId, Name, Value)
select 'TRAIT_DRAGON_GOVERNMENT_' || GovernmentSlotType, 'GovernmentSlotType', GovernmentSlotType
from GovernmentSlots
where GovernmentSlotType not in (select Item from Building_Dragon_Ignore);

-- 免费资源
insert into Modifiers (ModifierId, ModifierType, RunOnce, Permanent)
select 'TRAIT_DRAGON_RESOURCE_' || ResourceType, 'MODIFIER_SINGLE_CITY_ADJUST_FREE_RESOURCE_EXTRACTION', 1, 1
from Resources
where ResourceClassType = 'RESOURCECLASS_STRATEGIC';

insert into ModifierArguments (ModifierId, Name, Value)
select 'TRAIT_DRAGON_RESOURCE_' || ResourceType, 'ResourceType', ResourceType
from Resources
where ResourceClassType = 'RESOURCECLASS_STRATEGIC';

insert into ModifierArguments (ModifierId, Name, Value)
select 'TRAIT_DRAGON_RESOURCE_' || ResourceType, 'Amount', 2
from Resources
where ResourceClassType = 'RESOURCECLASS_STRATEGIC';

-- 建筑特性
insert into BuildingModifiers (BuildingType, ModifierId)
select 'BUILDING_DRAGON', ModifierId
from Modifiers
where ModifierId like 'TRAIT_DRAGON_%';

-- 清理环境
drop table Building_Dragon_Ignore;
