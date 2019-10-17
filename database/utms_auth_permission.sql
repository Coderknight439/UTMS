CREATE TABLE utms.auth_permission
(
    id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    content_type_id int(11) NOT NULL,
    codename varchar(100) NOT NULL,
    CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES utms.django_content_type (id)
);
CREATE UNIQUE INDEX auth_permission_content_type_id_codename_01ab375a_uniq ON utms.auth_permission (content_type_id, codename);
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add department', 7, 'add_department');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change department', 7, 'change_department');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete department', 7, 'delete_department');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can view department', 7, 'view_department');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can add teacher', 8, 'add_teacher');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can change teacher', 8, 'change_teacher');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can delete teacher', 8, 'delete_teacher');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can view teacher', 8, 'view_teacher');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can add student', 9, 'add_student');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can change student', 9, 'change_student');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can delete student', 9, 'delete_student');
INSERT INTO utms.auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can view student', 9, 'view_student');