CREATE TABLE utms.accounts_teacher
(
    id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    first_name varchar(200) NOT NULL,
    last_name varchar(200) NOT NULL,
    phone_number varchar(200) NOT NULL,
    emergency_number varchar(200) NOT NULL,
    birth_date datetime(6) NOT NULL,
    nid_number varchar(200) NOT NULL,
    gender varchar(200) NOT NULL,
    religion varchar(200) NOT NULL,
    marital_status varchar(200) NOT NULL,
    email varchar(254) NOT NULL,
    address_line_1 varchar(200) NOT NULL,
    address_line_2 varchar(200) NOT NULL,
    created_by varchar(200) NOT NULL,
    created_date datetime(6) NOT NULL,
    updated_by varchar(200) NOT NULL,
    updated_date datetime(6) NOT NULL,
    designation varchar(200) NOT NULL,
    department_id int(11) NOT NULL,
    CONSTRAINT accounts_teacher_department_id_32fc83ab_fk_departmen FOREIGN KEY (department_id) REFERENCES utms.departments_department (id)
);
CREATE UNIQUE INDEX email ON utms.accounts_teacher (email);
CREATE INDEX accounts_teacher_department_id_32fc83ab_fk_departmen ON utms.accounts_teacher (department_id);