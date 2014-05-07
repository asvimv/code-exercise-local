
CREATE TABLE Persons
(
 name varchar(255) not null ,
id 	int not null,
value      varchar(255),
ts             TIMESTAMP DEFAULT 0 ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (id,name)
)
