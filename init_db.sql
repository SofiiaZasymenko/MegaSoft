CREATE TABLE IF NOT EXISTS worker(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(1000) NOT NULL,
birthday DATE NOT NULL,
level ENUM('Trainee', 'Junior', 'Middle', 'Senior') NOT NULL,
salary INT NOT NULL,
CHECK (CHAR_LENGTH(name) >= 2),
CHECK (birthday >= '1900-01-01'),
CHECK (salary >= 100 and salary <= 100000)
)

CREATE TABLE IF NOT EXISTS client(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(1000) NOT NULL,
CHECK (CHAR_LENGTH(name) >= 2)
)

CREATE TABLE IF NOT EXISTS project(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
client_id VARCHAR NOT NULL,
start_date DATE NOT NULL,
finish_date DATE NOT NULL
)

CREATE TABLE IF NOT EXISTS project_worker(
project_id INT NOT NULL,
worker_id INT NOT NULL,
PRIMARY KEY (project_id, worker_id),
FOREIGN KEY(project_id) REFERENCES project(id),
FOREIGN KEY(worker_id) REFERENCES worker(id)
)
