CREATE TABLE utms.auth_user_user_permissions
(
    id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_id int(11) NOT NULL,
    permission_id int(11) NOT NULL,
    CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES utms.auth_user (id),
    CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES utms.auth_permission (id)
);
CREATE UNIQUE INDEX auth_user_user_permissions_user_id_permission_id_14a6b632_uniq ON utms.auth_user_user_permissions (user_id, permission_id);
CREATE INDEX auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm ON utms.auth_user_user_permissions (permission_id);