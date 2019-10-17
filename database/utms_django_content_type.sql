CREATE TABLE utms.django_content_type
(
    id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    app_label varchar(100) NOT NULL,
    model varchar(100) NOT NULL
);
CREATE UNIQUE INDEX django_content_type_app_label_model_76bd3d3b_uniq ON utms.django_content_type (app_label, model);
INSERT INTO utms.django_content_type (id, app_label, model) VALUES (9, 'accounts', 'student');
INSERT INTO utms.django_content_type (id, app_label, model) VALUES (8, 'accounts', 'teacher');
INSERT INTO utms.django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO utms.django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO utms.django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO utms.django_content_type (id, app_label, model) VALUES (4, 'auth', 'user');
INSERT INTO utms.django_content_type (id, app_label, model) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO utms.django_content_type (id, app_label, model) VALUES (7, 'departments', 'department');
INSERT INTO utms.django_content_type (id, app_label, model) VALUES (6, 'sessions', 'session');