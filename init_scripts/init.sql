CREATE TABLE db_jpa_crud.products (
	id BIGINT auto_increment NOT NULL,
	name varchar(45) NULL,
	price INT NULL,
	description TEXT NULL,
	CONSTRAINT products_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;