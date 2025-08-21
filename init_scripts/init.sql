CREATE TABLE products (
	id BIGINT auto_increment NOT NULL,
	name varchar(45) NULL,
	price INT NULL,
	description TEXT NULL,
	CONSTRAINT products_pk PRIMARY KEY (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE products MODIFY COLUMN name varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL;
ALTER TABLE products MODIFY COLUMN price int NOT NULL;
ALTER TABLE products MODIFY COLUMN description text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL;

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