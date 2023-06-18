drop table raceResult;
drop table raceHorse;
drop table horse;
drop table jockey;
drop table race;
create table keiba.race(
    id int auto_increment primary key,
    stadium text,
    round int,
    raceName text,
    raceType int, /*0:芝,1;ダート*/
    raceLength int,
    clockwise int, /*0:左回り,1:右回り*/
    raceCondition int, /*0:良,1:鞘重,2:重,3:不良*/
    raceWeather int, /*0:晴,1:曇,2:雨*/
    grade int, /*0:なし,1:G1,2:G2,3:G3*/
    raceDate date
);
create table keiba.horse(
    id int auto_increment primary key,
    name text,
    gender int /*0:牝,1:牡*/
);
create table keiba.jockey(
    id int auto_increment primary key,
    name char(255)
);
create table keiba.raceHorse(
    raceId int,
    horseId int,
    jockeyId int ,
    frameNumber int,
    weight int,
    old int,
    primary key (
        raceId,horseId,jockeyId
    )
);
create table keiba.raceResult(
    raceId int,
    frameNumber int,
    fullTime int,
    cornerRanking text,
    ranking int, 
    lastRapTime int,
    primary key (
        raceId,frameNumber
    )
);
ALTER TABLE keiba.race ADD INDEX raceLenght(raceLength);