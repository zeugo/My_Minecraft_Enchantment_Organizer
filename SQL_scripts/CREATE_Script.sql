DROP TABLE IF EXISTS Enchantment_category_Category
DROP TABLE IF EXISTS Villager_trade_Item
DROP TABLE IF EXISTS Item
DROP TABLE IF EXISTS Category
DROP TABLE IF EXISTS [Type]
DROP TABLE IF EXISTS Enchantment
DROP TABLE IF EXISTS Villager


CREATE TABLE Enchantment(
	Id INT IDENTITY(1,1),
	[Name] NVARCHAR(255) CONSTRAINT UQ_Enchantment_Name UNIQUE,
	[Description] NVARCHAR(2000),
	[Obtained] INT,
	[MaxLevel] INT,
    [Curse] BIT,
	CONSTRAINT PK_Encahntmnet_Id PRIMARY KEY CLUSTERED (Id)
)
GO

CREATE TABLE [Type](
	Id INT IDENTITY(1,1),
	[Name] NVARCHAR(20),
	CONSTRAINT PK_Type_Id PRIMARY KEY CLUSTERED (Id)
)

CREATE TABLE Category(
	Id INT IDENTITY(1,1),
	[Name] NVARCHAR(255),
	[Id_Type] INT REFERENCES [Type] (Id), 
	CONSTRAINT PK_Category_Id PRIMARY KEY CLUSTERED (Id)
)
GO

CREATE TABLE Enchantment_category_Category(
	Id_Enchantment INT REFERENCES Enchantment (Id),
	Id_Category INT REFERENCES Category (Id),
    CONSTRAINT PK_Enchatment_Category_Ids PRIMARY KEY CLUSTERED (Id_Enchantment, Id_Category)
)
GO

CREATE TABLE Villager(
    Id INT IDENTITY(1,1),
    [Profession] NVARCHAR(50) CONSTRAINT UQ_Villager_Profession UNIQUE,
    [Workstation] NVARCHAR(50) CONSTRAINT UQ_Villager_Workstation UNIQUE,
    CONSTRAINT PK_Villager_Id PRIMARY KEY CLUSTERED (Id)
)
GO

CREATE TABLE Item(
	Id INT IDENTITY(1,1),
	[Name] NVARCHAR(255),
	[Obtained] INT,
	[Id_Category] INT REFERENCES Category (Id),
    CONSTRAINT PK_Item_Id PRIMARY KEY CLUSTERED (Id)
)
GO

CREATE TABLE Villager_trade_Item(
    Id_Villager INT REFERENCES Villager (Id),
    Id_Item INT REFERENCES Item (Id),
    CONSTRAINT PK_Villager_Item_Ids PRIMARY KEY CLUSTERED (Id_Villager, Id_Item)
)

INSERT INTO Enchantment ([Name], [Description], [Obtained], [MaxLevel], [Curse]) VALUES
--All purpose
('Mending', 'Repairs the item when gaining XP orbs.', 1, 1, 0),
('Unbreaking', 'Increases item durability.', 1, 3, 0),
('Curse of Vanishing', 'Item destroyed upon death.', 1, 1, 1),

--Armour
('Aqua Affinity', 'Increase the rate of underwater mining speed.', 1, 1, 0),
('Blast Protection', 'Reduces explosion damage and knockback.', 0, 4, 0),
('Curse of Binding', 'Items cannot be removed from armor slots unless the cause is death or breaking.', 0, 1, 1),
('Depth Strider', 'Increases underwater movement speed.', 1, 3, 0),
('Feather Falling', 'Reduces fall damage.', 1, 4, 0),
('Fire Protection', 'Reduces fire damage and burn time.', 0, 4, 0),
('Frost Walker', 'Changes the water source blocks beneath the player into frosted ice and prevents the damage the player would take from standing on magma blocks.', 0, 2, 0),
('Projectile Protection', 'Reduces projectile damage.', 0, 4, 0),
('Protection', 'Reduces most types of damage by 4% for each level.', 1, 4, 0),
('Respiration', 'Extends underwater breathing time.', 1, 3, 0),
('Soul Speed', 'Increases walking speed on soul sand and soul soil.', -1, 3, 0),
('Thorns', 'Reflects some of the damage taken when hit, at the cost of reducing durability.', 0, 3, 0),
('Swift Sneak', 'Increased player speed when crouching.', -1, 3, 0),

--Melee weapons
('Bane of Arthropods', 'Increases damage and applies Slowness IV to arthropod mobs (spiders, cave spiders, silverfish, endermites and bees).', 0, 5, 0),
('Fire Aspect', 'Sets target on fire.', 0, 2, 0),
('Looting', 'Increases amount of loot earned from mobs.', 1, 3, 0),
('Knockback', 'Knocks back mobs away from you when hit.', 1, 2, 0),
('Sharpness', 'Increases weapon damage.', 1, 5, 0),
('Smite', 'Increases damage to undead mobs.', 1, 5, 0),
('Sweeping Edge', 'Increases sweeping attack damage. Available only in Java Edition', 1, 3, 0),

--Ranged Weapons
('Channeling', 'Trident channels a bolt of lightning toward a hit entity. Functions only during thunderstorms and if the target is unobstructed by opaque blocks.', 0, 1, 0),
('Flame', 'Arrows set targets on fire.', 1, 1, 0),
('Impaling', 'Trident deals additional damage to mobs that spawn naturally in the ocean.', 1, 5, 0),
('Infinity', 'Shooting with projectiles does not consume arrows.', 0, 1, 0),
('Loyalty', 'Trident returns after being thrown. Higher levels reduce the return time.', 0, 3, 0),
('Riptide', 'Trident launches player with itself when thrown. Functions only in water or rain.', 0, 3, 0),
('Multishot', 'Shoot 3 arrows at the cost of one; only one arrow can be recovered.', 0, 1, 0),
('Piercing', 'Arrows pass through multiple entities', 0, 4, 0),
('Power', 'Increases arrow damage.', 1, 5, 0),
('Punch', 'Increases arrow knockback.', 1, 2, 0),
('Quick Charge', 'Decreases crossbow charging time.', 0, 3, 0),

--Tools
('Efficiency', 'Increases mining speed.', 1, 5, 0),
('Fortune', 'Increases certain item drop chances from blocks.', 1, 3, 0),
('Luck of the Sea', 'Increases rate of fishing rare loot (enchanting books, etc.)', 0, 3, 0),
('Lure', 'Decreases wait time until fish/junk/loot “bites”', 0, 3, 0),
('Silk Touch', 'Mined blocks will drop as blocks instead of breaking into other items/blocks.', 1, 1, 0)
GO

INSERT INTO [Type] ([Name]) VALUES
('Armour'),
('Melee Weapons'),
('Ranged Weapons'),
('Tools'),
('Misc')
GO

INSERT INTO Category ([Name], [Id_Type]) VALUES
('Tools', 4),
('Fishing Rod', 4),
('Bow', 3),
('Crossbow', 3),
('Trident', 3),
('Sword', 2),
('Axe', 4),
('Helmet', 1),
('Chestplate', 1),
('Leggings', 1),
('Boots', 1),
('Shield', 5),
('Elytra', 5)
GO

INSERT INTO Enchantment_category_Category VALUES 
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8),
(1,9),
(1,10),
(1,11),
(1,12),
(1,13),
(2,1),
(2,2),
(2,3),
(2,4),
(2,5),
(2,6),
(2,7),
(2,8),
(2,9),
(2,10),
(2,11),
(2,12),
(2,13),
(3,1),
(3,2),
(3,3),
(3,4),
(3,5),
(3,6),
(3,7),
(3,8),
(3,9),
(3,10),
(3,11),
(3,12),
(3,13),
(4,8),
(5,8),
(5,9),
(5,10),
(5,11),
(6,8),
(6,9),
(6,10),
(6,11),
(6,13),
(7,11),
(8,11),
(9,8),
(9,9),
(9,10),
(9,11),
(10,11),
(11,8),
(11,9),
(11,10),
(11,11),
(12,8),
(12,9),
(12,10),
(12,11),
(13,8),
(14,11),
(15,8),
(15,9),
(15,10),
(15,11),
(16,10),
(17,6),
(17,7),
(18,6),
(18,7),
(19,6),
(19,7),
(20,6),
(20,7),
(21,6),
(21,7),
(22,6),
(22,7),
(23,6),
(23,7),
(24,5),
(25,3),
(26,5),
(27,3),
(28,5),
(29,5),
(30,4),
(31,4),
(32,3),
(33,3),
(34,4),
(35,1),
(35,7),
(36,1),
(36,7),
(37,2),
(38,2),
(39,1),
(39,7)
GO

INSERT INTO Villager ([Profession], [Workstation]) VALUES
('Armourer', 'Blast Furnace'),
('Butcher', 'Smoker'),
('Cartographer', 'Cartography Table'),
('Cleric', 'Brewing Stand'),
('Farmer', 'Composter'),
('Fisherman', 'Barrel'),
('Fletcher', 'Fletching Table'),
('Leatherworker', 'Cauldron'),
('Librerian', 'Lectern'),
('Mason', 'Stonecutter'),
('Shepard', 'Loom'),
('Toolsmith', 'Smithing Table'),
('Weaponsmith', 'Grindstone')
GO

INSERT INTO Item([Name], [Obtained], [Id_Category]) VALUES
('Pickaxe', 0, 1),
('Shovel', 0, 1),
('Hoe', 0, 1),
('Axe', 0, 1),
('Sword', 0, 6),
('Bow', 0, 3),
('Crossbow', 0, 4),
('Helmet', 0, 8),
('Chestplate', 0, 9),
('Leggings', 0, 10),
('Boots', 0, 11),
('Shield', 0, 12),
('Elytra', -1, 13)


INSERT INTO Villager_trade_Item([Id_Item], [Id_Villager]) VALUES
(1,12),
(2,12),
(3,12),
(4,12),
(4,13),
(5,13),
(6,7),
(7,7),
(8,1),
(9,1),
(10,1),
(11,1),
(12,1)