SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `Client`;
DROP TABLE IF EXISTS `Payment`;
DROP TABLE IF EXISTS `Compensation`;
DROP TABLE IF EXISTS `Worker`;
DROP TABLE IF EXISTS `Position`;
DROP TABLE IF EXISTS `Complaint`;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `Client` (
    `idClient` INTEGER NOT NULL,
    `fioClient` VARCHAR(70) NOT NULL,
    `addressClient` LONGTEXT NOT NULL,
    `phoneNumber` VARCHAR(20) NOT NULL,
    `Account` DECIMAL NOT NULL,
    PRIMARY KEY (`idClient`)
);

CREATE TABLE `Payment` (
    `idPay` INTEGER NOT NULL,
    `idClient` INTEGER NOT NULL,
    `idWorker` INTEGER NOT NULL,
    `dateTimePaty` DATETIME NOT NULL,
    `sumPay` DECIMAL NOT NULL,
    PRIMARY KEY (`idPay`)
);

CREATE TABLE `Compensation` (
    `idCompensation` INTEGER NOT NULL,
    `idComplaint` INTEGER NOT NULL,
    `sumCompensation` DECIMAL NOT NULL,
    PRIMARY KEY (`idCompensation`)
);

CREATE TABLE `Worker` (
    `idWorker` INTEGER NOT NULL,
    `idPostion` INTEGER NOT NULL,
    `fioWorker` VARCHAR(70) NOT NULL,
    `dateStart` DATE NOT NULL,
    PRIMARY KEY (`idWorker`)
);

CREATE TABLE `Position` (
    `idPosition` INTEGER NOT NULL,
    `namePosition` VARCHAR(30) NOT NULL,
    `salary` DECIMAL NOT NULL,
    PRIMARY KEY (`idPosition`)
);

CREATE TABLE `Complaint` (
    `idComplaint` INTEGER NOT NULL,
    `idPay` INTEGER NOT NULL,
    `idWorker` INTEGER NOT NULL,
    `IdClient` INTEGER NOT NULL,
    `comment` LONGTEXT NOT NULL,
    `statusComplaint` ENUM NOT NULL,
    PRIMARY KEY (`idComplaint`)
);

ALTER TABLE `Payment` ADD FOREIGN KEY (`idClient`) REFERENCES `Client`(`idClient`);
ALTER TABLE `Payment` ADD FOREIGN KEY (`idWorker`) REFERENCES `Worker`(`idWorker`);
ALTER TABLE `Compensation` ADD FOREIGN KEY (`idComplaint`) REFERENCES `Complaint`(`idComplaint`);
ALTER TABLE `Worker` ADD FOREIGN KEY (`idPostion`) REFERENCES `Position`(`idPosition`);
ALTER TABLE `Complaint` ADD FOREIGN KEY (`IdClient`) REFERENCES `Client`(`idClient`);
ALTER TABLE `Complaint` ADD FOREIGN KEY (`idPay`) REFERENCES `Payment`(`idPay`);
ALTER TABLE `Complaint` ADD FOREIGN KEY (`idWorker`) REFERENCES `Worker`(`idWorker`);