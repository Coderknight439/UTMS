CREATE TABLE utms.auth_user
(
    id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    password varchar(128) NOT NULL,
    last_login datetime(6),
    is_superuser tinyint(1) NOT NULL,
    username varchar(150) NOT NULL,
    first_name varchar(30) NOT NULL,
    last_name varchar(150) NOT NULL,
    email varchar(254) NOT NULL,
    is_staff tinyint(1) NOT NULL,
    is_active tinyint(1) NOT NULL,
    date_joined datetime(6) NOT NULL
);
CREATE UNIQUE INDEX username ON utms.auth_user (username);
INSERT INTO utms.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (1, 'pbkdf2_sha256$150000$FaNdAUOEX04N$4aQODnRzNYaHKoptxvLYDEJmr0eAwxdZaaDO4b6YnQg=', '2019-10-17 10:29:32.066139', 1, 'mahadi', '', '', 'mahadirony.rony@gmail.com', 1, 1, '2019-10-17 06:31:19.940951');