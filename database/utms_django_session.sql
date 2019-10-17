CREATE TABLE utms.django_session
(
    session_key varchar(40) PRIMARY KEY NOT NULL,
    session_data longtext NOT NULL,
    expire_date datetime(6) NOT NULL
);
CREATE INDEX django_session_expire_date_a5c62663 ON utms.django_session (expire_date);
INSERT INTO utms.django_session (session_key, session_data, expire_date) VALUES ('52lmywz5n7qr5jg3nbox6pbi5nait2uh', 'ZGJmODI0NGM4YWIxMDcyMzI5ZGU2OTNkZWQ3MTkyNDgyOTBlMzE4MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNThkNDY3MGYwOTI3ODk3YmQwNzUwOGM1YjI1M2M2ZjNkMDA0MmNiIn0=', '2019-10-31 10:29:32.278319');
INSERT INTO utms.django_session (session_key, session_data, expire_date) VALUES ('zu2l64eaux86apb6f1jzqjagbz5sr4qx', 'ZGJmODI0NGM4YWIxMDcyMzI5ZGU2OTNkZWQ3MTkyNDgyOTBlMzE4MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNThkNDY3MGYwOTI3ODk3YmQwNzUwOGM1YjI1M2M2ZjNkMDA0MmNiIn0=', '2019-10-31 06:53:45.457144');