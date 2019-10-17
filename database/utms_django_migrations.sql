CREATE TABLE utms.django_migrations
(
    id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    app varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    applied datetime(6) NOT NULL
);
INSERT INTO utms.django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2019-10-17 06:28:46.810388');
INSERT INTO utms.django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2019-10-17 06:28:49.643066');
INSERT INTO utms.django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2019-10-17 06:29:08.910821');
INSERT INTO utms.django_migrations (id, app, name, applied) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-10-17 06:29:17.212129');
INSERT INTO utms.django_migrations (id, app, name, applied) VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2019-10-17 06:29:17.310326');
INSERT INTO utms.django_migrations (id, app, name, applied) VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2019-10-17 06:29:20.327059');
INSERT INTO utms.django_migrations (id, app, name, applied) VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2019-10-17 06:29:21.064254');
INSERT INTO utms.django_migrations (id, app, name, applied) VALUES (8, 'auth', '0003_alter_user_email_max_length', '2019-10-17 06:29:21.358763');
INSERT INTO utms.django_migrations (id, app, name, applied) VALUES (9, 'auth', '0004_alter_user_username_opts', '2019-10-17 06:29:21.452390');
INSERT INTO utms.django_migrations (id, app, name, applied) VALUES (10, 'auth', '0005_alter_user_last_login_null', '2019-10-17 06:29:23.374044');
INSERT INTO utms.django_migrations (id, app, name, applied) VALUES (11, 'auth', '0006_require_contenttypes_0002', '2019-10-17 06:29:23.492929');
INSERT INTO utms.django_migrations (id, app, name, applied) VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2019-10-17 06:29:23.582363');
INSERT INTO utms.django_migrations (id, app, name, applied) VALUES (13, 'auth', '0008_alter_user_username_max_length', '2019-10-17 06:29:23.944297');
INSERT INTO utms.django_migrations (id, app, name, applied) VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2019-10-17 06:29:24.156205');
INSERT INTO utms.django_migrations (id, app, name, applied) VALUES (15, 'auth', '0010_alter_group_name_max_length', '2019-10-17 06:29:24.380230');
INSERT INTO utms.django_migrations (id, app, name, applied) VALUES (16, 'auth', '0011_update_proxy_permissions', '2019-10-17 06:29:24.488103');
INSERT INTO utms.django_migrations (id, app, name, applied) VALUES (17, 'sessions', '0001_initial', '2019-10-17 06:29:25.524796');
INSERT INTO utms.django_migrations (id, app, name, applied) VALUES (18, 'departments', '0001_initial', '2019-10-17 10:29:18.077671');
INSERT INTO utms.django_migrations (id, app, name, applied) VALUES (19, 'accounts', '0001_initial', '2019-10-17 10:29:18.901956');