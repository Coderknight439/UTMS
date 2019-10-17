CREATE TABLE utms.auth_user_groups
(
    id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_id int(11) NOT NULL,
    group_id int(11) NOT NULL,
    CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES utms.auth_user (id),
    CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES utms.auth_group (id)
);
CREATE UNIQUE INDEX auth_user_groups_user_id_group_id_94350c0c_uniq ON utms.auth_user_groups (user_id, group_id);
CREATE INDEX auth_user_groups_group_id_97559544_fk_auth_group_id ON utms.auth_user_groups (group_id);