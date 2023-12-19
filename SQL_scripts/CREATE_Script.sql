DROP TABLE IF EXISTS Enchantment_category_Category
DROP TABLE IF EXISTS [Type]
DROP TABLE IF EXISTS Enchantment 
DROP TABLE IF EXISTS Category


CREATE TABLE Enchantment(
	Id INT IDENTITY(1,1),
	[Name] NVARCHAR(255) CONSTRAINT UQ_Enchantment_Name UNIQUE,
	[Description] NVARCHAR(2000),
	[Obtained] INT,
	[MaxLevel] INT,
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
	Id_Category INT REFERENCES Category (Id)
)
GO

CREATE TABLE Item(
	Id INT IDENTITY(1,1),
	[Name] NVARCHAR(255),
	[Obtained] INT,
	[Type] NVARCHAR(20),
	[Id_Category] INT REFERENCES Category (Id)

)

INSERT INTO Enchantment ([Name], [Description], [Obtained], [MaxLevel]) VALUES
--All purpose
('Mending', 'Repairs the item when gaining XP orbs.', 1, 1),
('Unbreaking', 'Increases item durability.', 1, 3),
('Curse of Vanishing', 'Item destroyed upon death.', 1, 1),

--Armour
('Aqua Affinity', 'Increase the rate of underwater mining speed.', 1, 1),
('Blast Protection', 'Reduces explosion damage and knockback.', 0, 4),
('Curse of Binding', 'Items cannot be removed from armor slots unless the cause is death or breaking.', 0, 1),
('Depth Strider', 'Increases underwater movement speed.', 1, 3),
('Feather Falling', 'Reduces fall damage.', 1, 4),
('Fire Protection', 'Reduces fire damage and burn time.', 0, 4),
('Frost Walker', 'Changes the water source blocks beneath the player into frosted ice and prevents the damage the player would take from standing on magma blocks.', 0, 2),
('Projectile Protection', 'Reduces projectile damage.', 0, 4),
('Protection', 'Reduces most types of damage by 4% for each level.', 1, 4),
('Respiration', 'Extends underwater breathing time.', 1, 3),
('Soul Speed', 'Increases walking speed on soul sand and soul soil.', -1, 3),
('Thorns', 'Reflects some of the damage taken when hit, at the cost of reducing durability.', 0, 3),
('Swift Sneak', 'Increased player speed when crouching.', -1, 3),

--Melee weapons
('Bane of Arthropods', 'Increases damage and applies Slowness IV to arthropod mobs (spiders, cave spiders, silverfish, endermites and bees).', 0, 5),
('Fire Aspect', 'Sets target on fire.', 0, 2),
('Looting', 'Increases amount of loot earned from mobs.', 1, 3),
('Knockback', 'Knocks back mobs away from you when hit.', 1, 2),
('Sharpness', 'Increases weapon damage.', 1, 5),
('Smite', 'Increases damage to undead mobs.', 1, 5),
('Sweeping Edge', 'Increases sweeping attack damage. Available only in Java Edition', 1, 3),

--Ranged Weapons
('Channeling', 'Trident channels a bolt of lightning toward a hit entity. Functions only during thunderstorms and if the target is unobstructed by opaque blocks.', 0, 1),
('Flame', 'Arrows set targets on fire.', 1, 1),
('Impaling', 'Trident deals additional damage to mobs that spawn naturally in the ocean.', 1, 5),
('Infinity', 'Shooting with projectiles does not consume arrows.', 0, 1),
('Loyalty', 'Trident returns after being thrown. Higher levels reduce the return time.', 0, 3),
('Riptide', 'Trident launches player with itself when thrown. Functions only in water or rain.', 0, 3),
('Multishot', 'Shoot 3 arrows at the cost of one; only one arrow can be recovered.', 0, 1),
('Piercing', 'Arrows pass through multiple entities', 0, 4),
('Power', 'Increases arrow damage.', 1, 5),
('Punch', 'Increases arrow knockback.', 1, 2),
('Quick Charge', 'Decreases crossbow charging time.', 0, 3),

--Tools
('Efficiency', 'Increases mining speed.', 1, 5),
('Fortune', 'Increases certain item drop chances from blocks.', 1, 3),
('Luck of the Sea', 'Increases rate of fishing rare loot (enchanting books, etc.)', 0, 3),
('Lure', 'Decreases wait time until fish/junk/loot “bites”', 0, 3),
('Silk Touch', 'Mined blocks will drop as blocks instead of breaking into other items/blocks.', 1, 1)
GO

INSERT INTO 

INSERT INTO Category ([Name]) VALUES
('Tools'),
('Fishing Rod'),
('Bow'),
('Crossbow'),
('Trident'),
('Sword'),
('Axe'),
('Helmet'),
('Chestplate'),
('Leggings'),
('Boots'),
('Shield'),
('Elytra')
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