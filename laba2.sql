--
-- File generated with SQLiteStudio v3.1.0 on ѕн окт 9 17:00:38 2023
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Sat_Disciplines
CREATE TABLE Sat_Disciplines (
    DisciplineSatKey INTEGER PRIMARY KEY AUTOINCREMENT,
    DisciplineKey INTEGER,
    DisciplineName TEXT,
    Description TEXT,
    LoadDate DATETIME,
    RecordSource TEXT
);

-- Table: Sat_Teams
CREATE TABLE Sat_Teams (
    TeamSatKey INTEGER PRIMARY KEY AUTOINCREMENT,
    TeamKey INTEGER,
    TeamName TEXT,
    CoachName TEXT,
    TeamLocation TEXT,
    LoadDate DATETIME,
    RecordSource TEXT
);

-- Table: Sat_Participants
CREATE TABLE Sat_Participants (
    ParticipantSatKey INTEGER PRIMARY KEY AUTOINCREMENT,
    ParticipantKey INTEGER,
    FirstName TEXT,
    LastName TEXT,
    DateOfBirth DATE,
    Gender TEXT,
    TeamKey INTEGER,
    LoadDate DATETIME,
    RecordSource TEXT
);

-- Table: Sat_SportingEvents
CREATE TABLE Sat_SportingEvents (
    SportingEventSatKey INTEGER PRIMARY KEY AUTOINCREMENT,
    SportingEventKey INTEGER,
    EventName TEXT,
    StartDate DATE,
    EndDate DATE,
    Location TEXT,
    LoadDate DATETIME,
    RecordSource TEXT
);

-- Table: Sat_Results
CREATE TABLE Sat_Results (
    ResultSatKey INTEGER PRIMARY KEY AUTOINCREMENT,
    SportingEventKey INTEGER,
    DisciplineKey INTEGER,
    ParticipantKey INTEGER,
    ResultTime REAL,
    LoadDate DATETIME,
    RecordSource TEXT
);

-- Table: Link_SportingEvents_Teams
CREATE TABLE Link_SportingEvents_Teams (
    SportingEventKey INTEGER,
    TeamKey INTEGER,
    LoadDate DATETIME,
    RecordSource TEXT,
    PRIMARY KEY (SportingEventKey, TeamKey),
    FOREIGN KEY (SportingEventKey) REFERENCES Hub_SportingEvents (SportingEventKey),
    FOREIGN KEY (TeamKey) REFERENCES Hub_Teams (TeamKey)
);

-- Table: Hub_Disciplines
CREATE TABLE Hub_Disciplines (
    DisciplineKey INTEGER PRIMARY KEY AUTOINCREMENT,
    DisciplineID INTEGER,
    LoadDate DATETIME,
    RecordSource TEXT
);

-- Table: Link_SportingEvents_Participants
CREATE TABLE Link_SportingEvents_Participants (
    SportingEventKey INTEGER,
    ParticipantKey INTEGER,
    LoadDate DATETIME,
    RecordSource TEXT,
    PRIMARY KEY (SportingEventKey, ParticipantKey),
    FOREIGN KEY (SportingEventKey) REFERENCES Hub_SportingEvents (SportingEventKey),
    FOREIGN KEY (ParticipantKey) REFERENCES Hub_Participants (ParticipantKey)
);

-- Table: Hub_Participants
CREATE TABLE Hub_Participants (
    ParticipantKey INTEGER PRIMARY KEY AUTOINCREMENT,
    ParticipantID INTEGER,
    LoadDate DATETIME,
    RecordSource TEXT
);

-- Table: Hub_Teams
CREATE TABLE Hub_Teams (
    TeamKey INTEGER PRIMARY KEY AUTOINCREMENT,
    TeamID INTEGER,
    LoadDate DATETIME,
    RecordSource TEXT
);

-- Table: Link_SportingEvents_Disciplines
CREATE TABLE Link_SportingEvents_Disciplines (
    SportingEventKey INTEGER,
    DisciplineKey INTEGER,
    LoadDate DATETIME,
    RecordSource TEXT,
    PRIMARY KEY (SportingEventKey, DisciplineKey),
    FOREIGN KEY (SportingEventKey) REFERENCES Hub_SportingEvents (SportingEventKey),
    FOREIGN KEY (DisciplineKey) REFERENCES Hub_Disciplines (DisciplineKey)
);

-- Table: Hub_SportingEvents
CREATE TABLE Hub_SportingEvents (
    SportingEventKey INTEGER PRIMARY KEY AUTOINCREMENT,
    EventID INTEGER,
    LoadDate DATETIME,
    RecordSource TEXT
);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
