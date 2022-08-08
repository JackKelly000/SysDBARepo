#Hello
DROP TABLE IF EXISTS Results;
DROP TABLE IF EXISTS Modules;
DROP TABLE IF EXISTS Registrations;
DROP TABLE IF EXISTS ProgrammeStages;
DROP TABLE IF EXISTS Students;

CREATE TABLE Students (
   StudentID char(9) not null,
   FirstName varchar(255) not null,
   LastName varchar(255) not null,
   DateOfBirth date not null,
   RegistrationDate date not null,
   Status char(1) not null,
   PRIMARY KEY (StudentID)
 );
 
CREATE TABLE ProgrammeStages (
   StageCode char(7) not null,
   ProgrammeName varchar(255) not null,
   PRIMARY KEY (StageCode)
);

CREATE TABLE Registrations (
   StudentID char(9) not null,
   StageCode char(7) not null,
   Active boolean not null,
   PRIMARY KEY (StudentID, StageCode),
   CONSTRAINT fk_registrations_students FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
   CONSTRAINT fk_registrations_programmes FOREIGN KEY (StageCode) REFERENCES ProgrammeStages(StageCode)
);
 
CREATE TABLE Modules (
   ModuleID char(8) not null,
   StageCode char(7) not null,
   ModuleName varchar(255) not null,
   Active boolean not null,
   PRIMARY KEY (ModuleID),
   CONSTRAINT fk_modules_programmestages FOREIGN KEY (StageCode) REFERENCES ProgrammeStages(StageCode)
);

CREATE TABLE Results (
   StudentID char(9) not null,
    ModuleID char(8) not null,
    ResultDate date not null,
    ModuleResult int null,
    PRIMARY KEY (StudentID, ModuleID),
    CONSTRAINT fk_results_students FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    CONSTRAINT fk_results_modules FOREIGN KEY (ModuleID) REFERENCES Modules(ModuleID)
);

INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, RegistrationDate, Status)
VALUES ('C12345678', 'Jack', 'O''Neill', '2000-01-20', '2018-09-01', 'W');

INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, RegistrationDate, Status)
VALUES ('C23348678', 'Paul', 'Doyle', '2000-05-15', '2018-09-01', 'G');

INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, RegistrationDate, Status)
VALUES ('C23355678', 'Jane', 'Doe', '2000-03-08', '2018-09-01', 'W');

INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, RegistrationDate, Status)
VALUES ('C12346688', 'Sarah', 'Fahy', '2000-10-10', '2018-09-01', 'A');

INSERT INTO ProgrammeStages (StageCode, ProgrammeName) VALUES ('TU857-1', 'Computer Science (Infrastructure) Year 1');
INSERT INTO ProgrammeStages (StageCode, ProgrammeName) VALUES ('TU857-2', 'Computer Science (Infrastructure) Year 2');
INSERT INTO ProgrammeStages (StageCode, ProgrammeName) VALUES ('TU857-3', 'Computer Science (Infrastructure) Year 3');
INSERT INTO ProgrammeStages (StageCode, ProgrammeName) VALUES ('TU857-4', 'Computer Science (Infrastructure) Year 4');

INSERT INTO ProgrammeStages (StageCode, ProgrammeName) VALUES ('TU858-1', 'Computer Science (International) Year 1');
INSERT INTO ProgrammeStages (StageCode, ProgrammeName) VALUES ('TU858-2', 'Computer Science (International) Year 2');
INSERT INTO ProgrammeStages (StageCode, ProgrammeName) VALUES ('TU858-3', 'Computer Science (International) Year 3');
INSERT INTO ProgrammeStages (StageCode, ProgrammeName) VALUES ('TU858-4', 'Computer Science (International) Year 4');

INSERT INTO ProgrammeStages (StageCode, ProgrammeName) VALUES ('TU856-1', 'Computer Science Year 1');
INSERT INTO ProgrammeStages (StageCode, ProgrammeName) VALUES ('TU856-2', 'Computer Science Year 2');
INSERT INTO ProgrammeStages (StageCode, ProgrammeName) VALUES ('TU856-3', 'Computer Science Year 3');
INSERT INTO ProgrammeStages (StageCode, ProgrammeName) VALUES ('TU856-4', 'Computer Science Year 4');

INSERT INTO Registrations (StudentID, StageCode, Active) VALUES ('C12345678', 'TU857-1', False);
INSERT INTO Registrations (StudentID, StageCode, Active) VALUES ('C12345678', 'TU857-2', False);
INSERT INTO Registrations (StudentID, StageCode, Active) VALUES ('C12345678', 'TU857-3', False);
INSERT INTO Registrations (StudentID, StageCode, Active) VALUES ('C12345678', 'TU857-4', False);

INSERT INTO Registrations (StudentID, StageCode, Active) VALUES ('C23348678', 'TU857-1', False);
INSERT INTO Registrations (StudentID, StageCode, Active) VALUES ('C23348678', 'TU857-2', False);
INSERT INTO Registrations (StudentID, StageCode, Active) VALUES ('C23348678', 'TU857-3', False);
INSERT INTO Registrations (StudentID, StageCode, Active) VALUES ('C23348678', 'TU857-4', True);

INSERT INTO Registrations (StudentID, StageCode, Active) VALUES ('C23355678', 'TU857-1', False);
INSERT INTO Registrations (StudentID, StageCode, Active) VALUES ('C23355678', 'TU857-2', False);
INSERT INTO Registrations (StudentID, StageCode, Active) VALUES ('C23355678', 'TU857-3', False);
INSERT INTO Registrations (StudentID, StageCode, Active) VALUES ('C23355678', 'TU857-4', False);

INSERT INTO Registrations (StudentID, StageCode, Active) VALUES ('C12346688', 'TU857-1', False);
INSERT INTO Registrations (StudentID, StageCode, Active) VALUES ('C12346688', 'TU857-2', False);
INSERT INTO Registrations (StudentID, StageCode, Active) VALUES ('C12346688', 'TU857-3', False);
INSERT INTO Registrations (StudentID, StageCode, Active) VALUES ('C12346688', 'TU857-4', True);


INSERT INTO Modules (ModuleID, ModuleName, StageCode, Active) VALUES ('CMPU1002', 'COBOL', 'TU857-1', False);
INSERT INTO Modules (ModuleID, ModuleName, StageCode, Active) VALUES ('CMPU1011', 'Programming', 'TU857-1', True);
INSERT INTO Modules (ModuleID, ModuleName, StageCode, Active) VALUES ('CMPU1050', 'Databases 1', 'TU857-1', True);
INSERT INTO Modules (ModuleID, ModuleName, StageCode, Active) VALUES ('CMPU2010', 'Object-Oriented Programming', 'TU857-2', True);
INSERT INTO Modules (ModuleID, ModuleName, StageCode, Active) VALUES ('CMPU2015', 'Data Visualisation', 'TU857-2', True);
INSERT INTO Modules (ModuleID, ModuleName, StageCode, Active) VALUES ('CMPU3031', 'Functional Programming', 'TU857-3', True);
INSERT INTO Modules (ModuleID, ModuleName, StageCode, Active) VALUES ('CMPU3099', 'Employability Skills', 'TU857-3', True);
INSERT INTO Modules (ModuleID, ModuleName, StageCode, Active) VALUES ('CMPU4010', 'Systems and Database Admin', 'TU857-4', True);
INSERT INTO Modules (ModuleID, ModuleName, StageCode, Active) VALUES ('CMPU4080', 'Machine Learning', 'TU857-4', True);

INSERT INTO Results (StudentID, ModuleID, ResultDate, ModuleResult)
SELECT s.StudentID, m.moduleid, '2022-06-30'::date - interval '1 year' * (4 - RIGHT(r.stagecode, 1)::int), FLOOR(RANDOM() * 100 + 1)::int
from students s
inner join registrations r on s.studentid = r.studentid
inner join modules m on r.stagecode = m.stagecode;
