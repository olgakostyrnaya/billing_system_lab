SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `Client`;
DROP TABLE IF EXISTS `Payment`;
DROP TABLE IF EXISTS `Compensation`;
DROP TABLE IF EXISTS `Worker`;
DROP TABLE IF EXISTS `Position`;
DROP TABLE IF EXISTS `Complaint`;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `Client` (
    `idClient integer` INTEGER NOT NULL,
    `fioClient varchar` INTEGER NOT NULL,
    `addressClient longtext` INTEGER NOT NULL,
    `phoneNumber varchar` INTEGER NOT NULL,
    `Account float` INTEGER NOT NULL,
    PRIMARY KEY (`idClient integer`)
);

CREATE TABLE `Payment` (
    `idPay integer` INTEGER NOT NULL,
    `idClient INTEGER` INTEGER NOT NULL,
    `idWorker` INTEGER NOT NULL,
    `dateTimePaty datetime` INTEGER NOT NULL,
    `sumPay float` INTEGER NOT NULL,
    PRIMARY KEY (`idPay integer`)
);

CREATE TABLE `Compensation` (
    `idCompensation integer` INTEGER NOT NULL,
    `idComplaint integer` INTEGER NOT NULL,
    `sumCompensation float` INTEGER NOT NULL,
    PRIMARY KEY (`idCompensation integer`)
);

CREATE TABLE `Worker` (
    `idWorker integer` INTEGER NOT NULL,
    `idPostion integer` INTEGER NOT NULL,
    `fioWorker varchar` INTEGER NOT NULL,
    `dateStart date` INTEGER NOT NULL,
    PRIMARY KEY (`idWorker integer`)
);

CREATE TABLE `Position` (
    `idPosition integer` INTEGER NOT NULL,
    `namePosition varchar` INTEGER NOT NULL,
    `salary float` INTEGER NOT NULL,
    PRIMARY KEY (`idPosition integer`)
);

CREATE TABLE `Complaint` (
    `idComplaint integer` INTEGER NOT NULL,
    `idPay integer` INTEGER NOT NULL,
    `idWorker integer` INTEGER NOT NULL,
    `comment longtext` INTEGER NOT NULL,
    `statusComplaint  enum` INTEGER NOT NULL,
    PRIMARY KEY (`idComplaint integer`)
);
