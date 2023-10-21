--
-- File generated with SQLiteStudio v3.1.0 on ѕн окт 9 16:24:11 2023
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: SportingEvents
CREATE TABLE SportingEvents (
    EventID INTEGER PRIMARY KEY AUTOINCREMENT,
    EventName TEXT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    Location TEXT
);

-- Table: Teams
CREATE TABLE Teams (
    TeamID INTEGER PRIMARY KEY AUTOINCREMENT,
    TeamName TEXT NOT NULL,
    CoachName TEXT,
    TeamLocation TEXT
);

-- Table: Results
CREATE TABLE Results (
    ResultID INTEGER PRIMARY KEY AUTOINCREMENT,
    EventID INTEGER NOT NULL,
    DisciplineID INTEGER NOT NULL,
    ParticipantID INTEGER NOT NULL,
    ResultTime REAL,
    FOREIGN KEY (EventID) REFERENCES SportingEvents (EventID),
    FOREIGN KEY (DisciplineID) REFERENCES Disciplines (DisciplineID),
    FOREIGN KEY (ParticipantID) REFERENCES Participants (ParticipantID)
);

-- Table: Disciplines
CREATE TABLE Disciplines (
    DisciplineID INTEGER PRIMARY KEY AUTOINCREMENT,
    DisciplineName TEXT NOT NULL,
    Description TEXT
);

-- Table: Participants
CREATE TABLE Participants (
    ParticipantID INTEGER PRIMARY KEY AUTOINCREMENT,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender TEXT,
    TeamID INTEGER,
    FOREIGN KEY (TeamID) REFERENCES Teams (TeamID)
);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
