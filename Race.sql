drop table raceResult;
drop table raceHorse;
drop table horse;
drop table jockey;
drop table race;
drop table trainer;
create table keiba.race(
    id int auto_increment primary key,
    stadium text,
    round int,
    raceName text,
    raceType int, /*0:芝,1;ダート,3:障害*/
    raceLength int,
    clockwise int, /*0:左回り,1:右回り*/
    raceCondition int, /*0:良,1:鞘重,2:重,3:不良*/
    raceWeather int, /*0:晴,1:曇,2:雨*/
    grade int, /*0:G1,1:G2,2:G3,3:リステッド,4:オープン,5:3勝クラス,6:2勝クラス,7:1勝クラス,8:新馬,9:未勝利*/
    oldLimit int, /*0:4歳以上,1:3歳以上,2:3歳,3:2歳 */
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
    trainerId int,
    frameNumber int,
    weight int,
    old int,
    handicap int,
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
    popular int,
    primary key (
        raceId,frameNumber
    )
);

create table keiba.trainer(
    id int auto_increment primary key,
    name char(255)
)
ALTER TABLE keiba.race ADD INDEX raceLength_index(raceLength);