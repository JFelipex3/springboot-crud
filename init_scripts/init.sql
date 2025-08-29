CREATE TABLE products (
	id BIGINT auto_increment NOT NULL,
	name varchar(45) NOT NULL,
	price INT NOT NULL,
	description TEXT NOT NULL,
	CONSTRAINT products_pk PRIMARY KEY (id)
);

-- Datos Iniciales
INSERT INTO products (name, price, description) VALUES ('Laptop Gamer', 1200000, 'Laptop de alto rendimiento con tarjeta gráfica dedicada y 16GB RAM');
INSERT INTO products (name, price, description) VALUES ('Smartphone Pro X', 850000, 'Teléfono inteligente con pantalla AMOLED, 256GB de almacenamiento');
INSERT INTO products (name, price, description) VALUES ('Auriculares Bluetooth', 75000, 'Auriculares inalámbricos con cancelación de ruido y micrófono integrado');
INSERT INTO products (name, price, description) VALUES ('Teclado Mecánico RGB', 95000, 'Teclado gamer mecánico retroiluminado con switches azules');
INSERT INTO products (name, price, description) VALUES ('Mouse Inalámbrico', 40000, 'Mouse ergonómico con conexión inalámbrica y batería recargable');
INSERT INTO products (name, price, description) VALUES ('Monitor 27 2K', 210000, 'Monitor IPS de 27 pulgadas con resolución 2560x1440 y 144Hz');
INSERT INTO products (name, price, description) VALUES ('Impresora Multifuncional', 135000, 'Impresora a color con escáner y conexión WiFi');
INSERT INTO products (name, price, description) VALUES ('Disco SSD 1TB', 120000, 'Unidad de estado sólido NVMe de 1TB para máxima velocidad');
INSERT INTO products (name, price, description) VALUES ('Silla Gamer', 180000, 'Silla ergonómica con soporte lumbar y reclinación ajustable');
INSERT INTO products (name, price, description) VALUES ('Cámara Web HD', 60000, 'Cámara web 1080p con micrófono integrado, ideal para videollamadas');

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

