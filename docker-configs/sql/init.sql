DROP TABLE IF EXISTS sampledb.ship;
CREATE TABLE IF NOT EXISTS sampledb.ship(
  Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  ShipNumber VARCHAR(10) NOT NULL,
  ShipName VARCHAR(20) NOT NULL,
  StandardDisplacement INT NOT NULL,
  FullLoadDisplacement INT NOT NULL,
  FullLength INT NOT NULL,
  FullWidth DOUBLE NOT NULL,
  CommissionYear DATE NOT NULL,
  DivisionId INT NOT NULL,
  HullCodeId INT NOT NULL,
  ShipClassId INT NOT NULL
);

DROP TABLE IF EXISTS sampledb.shipclass;
CREATE TABLE IF NOT EXISTS sampledb.shipclass(
  Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  ShipClassId INT NOT NULL,
  ShipClassName VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS sampledb.hullcode;
CREATE TABLE IF NOT EXISTS sampledb.hullcode(
  Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  HullCodeId INT NOT NULL,
  HullCodeSymbol VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS sampledb.flotilla;
CREATE TABLE IF NOT EXISTS sampledb.flotilla(
  Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  FlotillaId INT NOT NULL,
  FlotillaName VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS sampledb.division;
CREATE TABLE IF NOT EXISTS sampledb.division(
  Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  DivisionId INT NOT NULL,
  DivisionName VARCHAR(20) NOT NULL,
  FlotillaId INT NOT NULL
);

LOAD DATA LOCAL INFILE '/tmp/shipdata.csv' INTO TABLE sampledb.ship FIELDS TERMINATED BY ',' ENCLOSED BY '"' (ShipNumber, ShipName, StandardDisplacement, FullLoadDisplacement, FullLength, FullWidth, CommissionYear, DivisionId, HullCodeId, ShipClassId);
LOAD DATA LOCAL INFILE '/tmp/shipclassdata.csv' INTO TABLE sampledb.shipclass FIELDS TERMINATED BY ',' ENCLOSED BY '"' (ShipClassId, ShipClassName);
LOAD DATA LOCAL INFILE '/tmp/hullcodedata.csv' INTO TABLE sampledb.hullcode FIELDS TERMINATED BY ',' ENCLOSED BY '"' (HullCodeId, HullCodeSymbol);
LOAD DATA LOCAL INFILE '/tmp/flotilladata.csv' INTO TABLE sampledb.flotilla FIELDS TERMINATED BY ',' ENCLOSED BY '"' (FlotillaId, FlotillaName);
LOAD DATA LOCAL INFILE '/tmp/divisiondata.csv' INTO TABLE sampledb.division FIELDS TERMINATED BY ',' ENCLOSED BY '"' (DivisionId, DivisionName, FlotillaId);
COMMIT;