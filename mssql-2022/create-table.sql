-- create table in MS SQL 2022

WeaponType (
	gunID int identity(1,1) primary key,
	GunType nvarchar(50),
	GunAmmoType nvarchar(50),
);
