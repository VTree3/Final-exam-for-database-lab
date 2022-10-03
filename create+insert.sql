USE [master]
GO
CREATE DATABASE [LugiOh]
GO
USE [LugiOh]
GO
CREATE TABLE [dbo].[CardType](
	[CardTypeID] [char](5) NOT NULL PRIMARY KEY CHECK (([CardTypeID] like 'CT[0-9][0-9][0-9]')),
	[CardTypeName] [varchar](50) NULL,
)
GO
CREATE TABLE [dbo].[Cards](
	[CardsID] [char](5) NOT NULL PRIMARY KEY CHECK (([CardsID] like 'CA[0-9][0-9][0-9]')),
	[CardTypeID] [char](5) NOT NULL REFERENCES CardType(CardTypeID) ON UPDATE CASCADE ON DELETE CASCADE,
	[CardName] [varchar](100) NOT NULL,
	[CardElement] [varchar](20) NOT NULL,
	[CardLevel] [int] NULL,
	[CardAttack] [int] NULL,
	[CardDefense] [int] NULL,
	[CardPrice] [int] NULL
)
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [char](5) NOT NULL PRIMARY KEY CHECK (([CustomerID] like 'CU[0-9][0-9][0-9]')),
	[CustomerName] [varchar](50) NOT NULL,
	[CustomerGender] [varchar](10) NOT NULL,
	[CustomerPhone] [varchar](15) NOT NULL,
	[CustomerAddress] [varchar](100) NOT NULL,
	[CustomerDOB] [date] NULL,
)
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [char](5) NOT NULL PRIMARY KEY CHECK (([StaffID] like 'ST[0-9][0-9][0-9]')),
	[StaffName] [varchar](50) NOT NULL,
	[StaffGender] [varchar](10) NOT NULL,
	[StaffPhone] [varchar](15) NOT NULL,
	[StaffAddress] [varchar](100) NOT NULL,
	[StaffDOB] [date] NULL
) 
GO
CREATE TABLE [dbo].[HeaderTransaction](
	[TransactionID] [char](5) NOT NULL PRIMARY KEY CHECK (([TransactionID] like 'HT[0-9][0-9][0-9]')),
	[CustomerID] [char](5) NOT NULL FOREIGN KEY REFERENCES Customer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE,
	[StaffID] [char](5) NOT NULL FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
	[TransactionDate] [date] NULL
)
GO
CREATE TABLE [dbo].[DetailTransaction](
	[TransactionID] [char](5) NOT NULL FOREIGN KEY REFERENCES HeaderTransaction(TransactionID) ON UPDATE CASCADE ON DELETE CASCADE,
	[CardsID] [char](5) NOT NULL FOREIGN KEY REFERENCES Cards(CardsID) ON UPDATE CASCADE ON DELETE CASCADE,
	[Quantity] [int] NULL,
	PRIMARY KEY(TransactionID, CardsID)
)
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT002', N'Beast')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT003', N'Beast-Warrior')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT004', N'Creator God')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT005', N'Cyverse')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT006', N'Dinosaur')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT007', N'Divine-Beast')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT008', N'Dragon')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT009', N'Fairy')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT010', N'Fiend')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT011', N'Fish')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT012', N'Insect')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT013', N'Machine')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT014', N'Plant')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT015', N'Psychic')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT016', N'Pyro')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT017', N'Reptile')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT018', N'Rock')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT019', N'Sea Serpent')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT020', N'Spellcaster')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT021', N'Thunder')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT022', N'Warrior')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT023', N'Winged Beast')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT024', N'Wyrm')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT025', N'Zombie')
GO
INSERT [dbo].[CardType] ([CardTypeID], [CardTypeName]) VALUES (N'CT001', N'Aqua')
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA001', N'CT001', N'Mermail Abyssgaios', N'Water', 7, 2800, 1600, 50000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA002', N'CT016', N'Flame Cerberus', N'Fire', 6, 2100, 1800, 120000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA003', N'CT007', N'Slifer the Sky Dragon', N'Divine', 10, 20000, 20000, 500000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA004', N'CT007', N'The Sun Dragon Ra', N'Divine', 10, 18999, 18999, 475000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA005', N'CT007', N'Obelisk the Tormentor', N'Divine', 10, 4000, 4000, 460000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA006', N'CT002', N'Diamond Dire Wolf', N'Earth', 4, 2000, 1200, 150000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA007', N'CT020', N'Exodia The Forbidden One', N'Dark', 3, 1000, 1000, 75000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA008', N'CT008', N'Gaia the Dragon Champion', N'Wind', 7, 2600, 2100, 180000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA009', N'CT010', N'Kuriboh', N'Dark', 1, 300, 200, 10000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA010', N'CT006', N'Mammoth Graveyard', N'Earth', 3, 1200, 800, 30000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA011', N'CT008', N'Blue Eyes White Dragon', N'Light', 8, 3000, 2500, 1000000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA012', N'CT012', N'Killer Needle', N'Wind', 4, 1200, 1000, 110000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA013', N'CT008', N'Red Eyes Black Dragon', N'Dark', 7, 2400, 2000, 700000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA014', N'CT013', N'Ancient Tool', N'Dark', 5, 1700, 1400, 85000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA015', N'CT021', N'LaLa Li-Oon', N'Wind', 2, 600, 600, 47000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA016', N'CT020', N'Dark Magician', N'Dark', 7, 2500, 2100, 600000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA017', N'CT015', N'Metalfoes Adamante', N'Fire', 5, 2500, 2500, 220000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA018', N'CT022', N'Black Luster Soldier - Envoy of the Beginning', N'Light', 8, 3000, 2500, 375000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA019', N'CT022', N'Gate Guardian', N'Dark', 11, 3750, 3400, 310000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA020', N'CT008', N'Five-Headed Dragon', N'Dark', 12, 5000, 5000, 490000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA021', N'CT025', N'Reaper on the Nightmare', N'Dark', 5, 800, 600, 190000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA022', N'CT009', N'Thethys, Goddess of Light', N'Light', 6, 2400, 1800, 69000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA023', N'CT009', N'Archlord Kristya', N'Light', 8, 2800, 2300, 99000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA024', N'CT011', N'Gishki Abyss', N'Water', 2, 800, 500, 78000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA025', N'CT017', N'King of the Feral Imps', N'Dark', 4, 2300, 2000, 179000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA026', N'CT019', N'Brionac, Dragon of the Ice Barrier', N'Water', 3, 200, 2100, 400000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA027', N'CT014', N'Aromaseraphy Rosemary', N'Light', 5, 2000, 900, 420000)
GO
INSERT [dbo].[Cards] ([CardsID], [CardTypeID], [CardName], [CardElement], [CardLevel], [CardAttack], [CardDefense], [CardPrice]) VALUES (N'CA028', N'CT014', N'Traptrix Rafflesia', N'Earth', 4, 300, 2500, 389000)
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerGender], [CustomerPhone], [CustomerAddress], [CustomerDOB]) VALUES (N'CU001', N'Luciana Dian Santami', N'Female', N'081243253451', N'Jl. Anggur no. 8', CAST(N'1997-04-17' AS Date))
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerGender], [CustomerPhone], [CustomerAddress], [CustomerDOB]) VALUES (N'CU002', N'Adrian Lukito Lo', N'Male', N'081283572226', N'Jl. Loving Hut no. 506', CAST(N'1997-05-08' AS Date))
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerGender], [CustomerPhone], [CustomerAddress], [CustomerDOB]) VALUES (N'CU003', N'Mario Viegash', N'Male', N'082189127788', N'Jl. Keluarga no. 12', CAST(N'1996-09-02' AS Date))
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerGender], [CustomerPhone], [CustomerAddress], [CustomerDOB]) VALUES (N'CU004', N'Misita Pontiasa', N'Female', N'087888812123', N'Jl. Syahdan no. 20', CAST(N'1996-12-11' AS Date))
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerGender], [CustomerPhone], [CustomerAddress], [CustomerDOB]) VALUES (N'CU005', N'Peter Hartawan Suherman', N'Male', N'089898123442', N'Jl. Kuning no. 10', CAST(N'1997-06-03' AS Date))
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerGender], [CustomerPhone], [CustomerAddress], [CustomerDOB]) VALUES (N'CU006', N'Philip Andreas Nugraha', N'Male', N'081355660900', N'Jl. Binus Square', CAST(N'1997-10-14' AS Date))
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerGender], [CustomerPhone], [CustomerAddress], [CustomerDOB]) VALUES (N'CU007', N'Renaldi', N'Male', N'087788357154', N'Jl. Brownis no. 30', CAST(N'1997-03-30' AS Date))
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerGender], [CustomerPhone], [CustomerAddress], [CustomerDOB]) VALUES (N'CU008', N'Kevin Surya Wahyudi', N'Male', N'089247213351', N'Jl. Sudut Panjang no. 19', CAST(N'1997-01-26' AS Date))
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerGender], [CustomerPhone], [CustomerAddress], [CustomerDOB]) VALUES (N'CU009', N'Thomas Asril', N'Male', N'081209541176', N'Jl. Tanjung Duren no. 22', CAST(N'1998-04-05' AS Date))
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerGender], [CustomerPhone], [CustomerAddress], [CustomerDOB]) VALUES (N'CU010', N'Wimpi Jonathan', N'Male', N'082146770101', N'Jl. Cengkareng no. 51', CAST(N'1998-01-05' AS Date))
GO
INSERT [dbo].[Staff] ([StaffID], [StaffName], [StaffGender], [StaffPhone], [StaffAddress], [StaffDOB]) VALUES (N'ST001', N'Albert', N'Male', N'081266781208', N'Jl. Medan no. 11', CAST(N'1997-12-02' AS Date))
GO
INSERT [dbo].[Staff] ([StaffID], [StaffName], [StaffGender], [StaffPhone], [StaffAddress], [StaffDOB]) VALUES (N'ST002', N'Alven Gemini Julio', N'Male', N'087832328879', N'Jl. Tunangan no. 32', CAST(N'1996-06-03' AS Date))
GO
INSERT [dbo].[Staff] ([StaffID], [StaffName], [StaffGender], [StaffPhone], [StaffAddress], [StaffDOB]) VALUES (N'ST003', N'Bagas Prakoso', N'Male', N'081240092216', N'Jl. Mengapa Begini no. 22', CAST(N'1997-09-06' AS Date))
GO
INSERT [dbo].[Staff] ([StaffID], [StaffName], [StaffGender], [StaffPhone], [StaffAddress], [StaffDOB]) VALUES (N'ST004', N'Christian Adianto', N'Male', N'081255893145', N'Jl. Bandeng no. 17', CAST(N'1997-04-18' AS Date))
GO
INSERT [dbo].[Staff] ([StaffID], [StaffName], [StaffGender], [StaffPhone], [StaffAddress], [StaffDOB]) VALUES (N'ST005', N'Tedy Junaidi', N'Male', N'081223428080', N'Jl. Lampung no. 65', CAST(N'1997-07-15' AS Date))
GO
INSERT [dbo].[Staff] ([StaffID], [StaffName], [StaffGender], [StaffPhone], [StaffAddress], [StaffDOB]) VALUES (N'ST006', N'Evy Maria', N'Female', N'081231129999', N'Jl. Cimcim no.3', CAST(N'1997-12-16' AS Date))
GO
INSERT [dbo].[Staff] ([StaffID], [StaffName], [StaffGender], [StaffPhone], [StaffAddress], [StaffDOB]) VALUES (N'ST007', N'Giovan Saputra', N'Male', N'087865782525', N'Jl. Kuningan no.17', CAST(N'1996-10-19' AS Date))
GO
INSERT [dbo].[Staff] ([StaffID], [StaffName], [StaffGender], [StaffPhone], [StaffAddress], [StaffDOB]) VALUES (N'ST008', N'Kelvin Asclepius Minor', N'Male', N'081210108945', N'Jl. Sasuke no.10', CAST(N'1995-05-12' AS Date))
GO
INSERT [dbo].[Staff] ([StaffID], [StaffName], [StaffGender], [StaffPhone], [StaffAddress], [StaffDOB]) VALUES (N'ST009', N'Jordan Leonardi', N'Male', N'081233225974', N'Jl. Brownis no. 32', CAST(N'1997-08-01' AS Date))
GO
INSERT [dbo].[HeaderTransaction] ([TransactionID], [CustomerID], [StaffID], [TransactionDate]) VALUES (N'HT001', N'CU001', N'ST008', CAST(N'2017-05-22' AS Date))
GO
INSERT [dbo].[HeaderTransaction] ([TransactionID], [CustomerID], [StaffID], [TransactionDate]) VALUES (N'HT002', N'CU002', N'ST006', CAST(N'2017-04-10' AS Date))
GO
INSERT [dbo].[HeaderTransaction] ([TransactionID], [CustomerID], [StaffID], [TransactionDate]) VALUES (N'HT003', N'CU006', N'ST003', CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[HeaderTransaction] ([TransactionID], [CustomerID], [StaffID], [TransactionDate]) VALUES (N'HT004', N'CU005', N'ST004', CAST(N'2017-03-17' AS Date))
GO
INSERT [dbo].[HeaderTransaction] ([TransactionID], [CustomerID], [StaffID], [TransactionDate]) VALUES (N'HT005', N'CU004', N'ST008', CAST(N'2017-05-18' AS Date))
GO
INSERT [dbo].[HeaderTransaction] ([TransactionID], [CustomerID], [StaffID], [TransactionDate]) VALUES (N'HT006', N'CU009', N'ST001', CAST(N'2017-06-01' AS Date))
GO
INSERT [dbo].[HeaderTransaction] ([TransactionID], [CustomerID], [StaffID], [TransactionDate]) VALUES (N'HT007', N'CU010', N'ST009', CAST(N'2017-10-19' AS Date))
GO
INSERT [dbo].[HeaderTransaction] ([TransactionID], [CustomerID], [StaffID], [TransactionDate]) VALUES (N'HT008', N'CU008', N'ST002', CAST(N'2017-09-11' AS Date))
GO
INSERT [dbo].[HeaderTransaction] ([TransactionID], [CustomerID], [StaffID], [TransactionDate]) VALUES (N'HT009', N'CU007', N'ST005', CAST(N'2017-04-15' AS Date))
GO
INSERT [dbo].[HeaderTransaction] ([TransactionID], [CustomerID], [StaffID], [TransactionDate]) VALUES (N'HT010', N'CU003', N'ST007', CAST(N'2017-05-30' AS Date))
GO
INSERT [dbo].[HeaderTransaction] ([TransactionID], [CustomerID], [StaffID], [TransactionDate]) VALUES (N'HT011', N'CU002', N'ST009', CAST(N'2017-08-12' AS Date))
GO
INSERT [dbo].[HeaderTransaction] ([TransactionID], [CustomerID], [StaffID], [TransactionDate]) VALUES (N'HT012', N'CU002', N'ST006', CAST(N'2017-07-03' AS Date))
GO
INSERT [dbo].[DetailTransaction] ([TransactionID], [CardsID], [Quantity]) VALUES (N'HT001', N'CA028', 3)
GO
INSERT [dbo].[DetailTransaction] ([TransactionID], [CardsID], [Quantity]) VALUES (N'HT002', N'CA008', 11)
GO
INSERT [dbo].[DetailTransaction] ([TransactionID], [CardsID], [Quantity]) VALUES (N'HT002', N'CA011', 5)
GO
INSERT [dbo].[DetailTransaction] ([TransactionID], [CardsID], [Quantity]) VALUES (N'HT002', N'CA020', 7)
GO
INSERT [dbo].[DetailTransaction] ([TransactionID], [CardsID], [Quantity]) VALUES (N'HT003', N'CA004', 10)
GO
INSERT [dbo].[DetailTransaction] ([TransactionID], [CardsID], [Quantity]) VALUES (N'HT004', N'CA002', 9)
GO
INSERT [dbo].[DetailTransaction] ([TransactionID], [CardsID], [Quantity]) VALUES (N'HT004', N'CA016', 5)
GO
INSERT [dbo].[DetailTransaction] ([TransactionID], [CardsID], [Quantity]) VALUES (N'HT005', N'CA017', 15)
GO
INSERT [dbo].[DetailTransaction] ([TransactionID], [CardsID], [Quantity]) VALUES (N'HT006', N'CA007', 20)
GO
INSERT [dbo].[DetailTransaction] ([TransactionID], [CardsID], [Quantity]) VALUES (N'HT006', N'CA021', 10)
GO
INSERT [dbo].[DetailTransaction] ([TransactionID], [CardsID], [Quantity]) VALUES (N'HT007', N'CA013', 12)
GO
INSERT [dbo].[DetailTransaction] ([TransactionID], [CardsID], [Quantity]) VALUES (N'HT007', N'CA022', 16)
GO
INSERT [dbo].[DetailTransaction] ([TransactionID], [CardsID], [Quantity]) VALUES (N'HT008', N'CA003', 1)
GO
INSERT [dbo].[DetailTransaction] ([TransactionID], [CardsID], [Quantity]) VALUES (N'HT008', N'CA005', 21)
GO
INSERT [dbo].[DetailTransaction] ([TransactionID], [CardsID], [Quantity]) VALUES (N'HT008', N'CA011', 13)
GO
INSERT [dbo].[DetailTransaction] ([TransactionID], [CardsID], [Quantity]) VALUES (N'HT009', N'CA020', 13)
GO
INSERT [dbo].[DetailTransaction] ([TransactionID], [CardsID], [Quantity]) VALUES (N'HT010', N'CA001', 18)
GO
INSERT [dbo].[DetailTransaction] ([TransactionID], [CardsID], [Quantity]) VALUES (N'HT010', N'CA009', 25)
GO
INSERT [dbo].[DetailTransaction] ([TransactionID], [CardsID], [Quantity]) VALUES (N'HT011', N'CA018', 11)
GO
INSERT [dbo].[DetailTransaction] ([TransactionID], [CardsID], [Quantity]) VALUES (N'HT011', N'CA019', 4)
GO
INSERT [dbo].[DetailTransaction] ([TransactionID], [CardsID], [Quantity]) VALUES (N'HT012', N'CA015', 8)
GO
INSERT [dbo].[DetailTransaction] ([TransactionID], [CardsID], [Quantity]) VALUES (N'HT012', N'CA023', 9)
GO

