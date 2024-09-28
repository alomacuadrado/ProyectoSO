DROP DATABASE IF EXISTS Championship;
CREATE DATABASE Championship;
USE Championship;

CREATE TABLE Player (
    id_p INTEGER PRIMARY KEY NOT NULL,
    username TEXT NOT NULL,
    pass TEXT NOT NULL
) ENGINE = InnoDB;

CREATE TABLE Game (
    id_m INTEGER PRIMARY KEY NOT NULL,
    dateandtime DATETIME NOT NULL,
    duration INTEGER NOT NULL,
    winner INTEGER,
    FOREIGN KEY (winner) REFERENCES Player (id_p)
) ENGINE = InnoDB;

CREATE TABLE Participation (
    Player INTEGER NOT NULL,
    Game INTEGER NOT NULL,
    FOREIGN KEY (Player) REFERENCES Player (id_p),
    FOREIGN KEY (Game) REFERENCES Game (id_m)
) ENGINE = InnoDB;
INSERT INTO Player VALUES(1, 'David', 'pass1');
INSERT INTO Player VALUES(2, 'Ana', 'pass2');
INSERT INTO Player VALUES(3, 'Sara', 'pass3');
INSERT INTO Player VALUES(4, 'Raul', 'pass4');


INSERT INTO Game VALUES(1, '2024-09-12 10:00:00', 90, 2);
INSERT INTO Game VALUES(2, '2024-09-10 15:30:00', 120, 1); 
INSERT INTO Game VALUES(3, '2024-09-30 21:15:12', 90, 3);
INSERT INTO Game VALUES(4, '2024-09-30 08:00:00', 105, 2);

INSERT INTO Participation VALUES(1, 1);
INSERT INTO Participation VALUES(2, 1);
INSERT INTO Participation VALUES(3, 1);
INSERT INTO Participation VALUES(4, 1);
INSERT INTO Participation VALUES(2, 2);
INSERT INTO Participation VALUES(3, 2);
INSERT INTO Participation VALUES(3, 3);
INSERT INTO Participation VALUES(4, 3);
INSERT INTO Participation VALUES(4, 4);
INSERT INTO Participation VALUES(1, 4);
INSERT INTO Participation VALUES(2, 4);