CREATE TABLE utms.auth_group_permissions
(
    id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    group_id int(11) NOT NULL,
    permission_id int(11) NOT NULL,
    CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES utms.auth_group (id),
    CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES utms.auth_permission (id)
);
CREATE UNIQUE INDEX auth_group_permissions_group_id_permission_id_0cd325b0_uniq ON utms.auth_group_permissions (group_id, permission_id);
CREATE INDEX auth_group_permissio_permission_id_84c5c92e_fk_auth_perm ON utms.auth_group_permissions (permission_id);