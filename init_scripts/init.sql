CREATE TABLE products (
	id BIGINT auto_increment NOT NULL,
	name varchar(45) NOT NULL,
	price INT NOT NULL,
	description TEXT NOT NULL,
	sku varchar(45),
	CONSTRAINT products_pk PRIMARY KEY (id)
);

-- Datos Iniciales
INSERT INTO products (name, price, description, sku) VALUES ('Laptop Gamer', 1200000, 'Laptop de alto rendimiento con tarjeta grafica dedicada y 16GB RAM', 2345);
INSERT INTO products (name, price, description, sku) VALUES ('Smartphone Pro X', 850000, 'Telefono inteligente con pantalla AMOLED, 256GB de almacenamiento', 6524);
INSERT INTO products (name, price, description, sku) VALUES ('Auriculares Bluetooth', 75000, 'Auriculares inalambricos con cancelacion de ruido y microfono integrado', 1632);
INSERT INTO products (name, price, description, sku) VALUES ('Teclado Mecanico RGB', 95000, 'Teclado gamer mecanico retroiluminado con switches azules', 1987);
INSERT INTO products (name, price, description, sku) VALUES ('Mouse Inalambrico', 40000, 'Mouse ergonomico con conexion inalambrica y bateria recargable', 2341);
INSERT INTO products (name, price, description, sku) VALUES ('Monitor 27 2K', 210000, 'Monitor IPS de 27 pulgadas con resolucion 2560x1440 y 144Hz', 3652);
INSERT INTO products (name, price, description, sku) VALUES ('Impresora Multifuncional', 135000, 'Impresora a color con escaner y conexion WiFi', 4789);
INSERT INTO products (name, price, description, sku) VALUES ('Disco SSD 1TB', 120000, 'Unidad de estado solido NVMe de 1TB para maxima velocidad', 5123);
INSERT INTO products (name, price, description, sku) VALUES ('Silla Gamer', 180000, 'Silla ergonomica con soporte lumbar y reclinacion ajustable', 6789);
INSERT INTO products (name, price, description, sku) VALUES ('Camara Web HD', 60000, 'Camara web 1080p con microfono integrado, ideal para videollamadas', 7321);

CREATE TABLE users (
	id INT auto_increment NOT NULL,
	username varchar(18) NOT NULL,
	password varchar(60) NOT NULL,
	enabled boolean NOT NULL DEFAULT true,
	CONSTRAINT user_pk PRIMARY KEY (id),
	UNIQUE KEY unique_username (username)
);

CREATE TABLE roles (
	id INT auto_increment NOT NULL,
	name varchar(45) NOT NULL,
	CONSTRAINT roles_pk PRIMARY KEY (id),
	UNIQUE KEY unique_name (name)
);

CREATE TABLE users_roles (
	user_id INT NOT NULL,
	role_id INT NOT NULL,
	CONSTRAINT users_roles_pk PRIMARY KEY (user_id, role_id),
	CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id),
	CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES roles(id)
);

-- Datos Iniciales
INSERT INTO roles (name) VALUES ('ROLE_ADMIN');
INSERT INTO roles (name) VALUES ('ROLE_USER');