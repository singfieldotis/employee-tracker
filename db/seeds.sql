DROP DATABASE IF EXISTS employees;

CREATE DATABASE employees;

USE employees;

CREATE TABLE department (
  id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE role (
  id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(30) UNIQUE NOT NULL,
  salary DECIMAL UNSIGNED NOT NULL,
  department_id INTEGER UNSIGNED NOT NULL,
  INDEX dep_ind (department_id),
  CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE CASCADE
);

CREATE TABLE employee (
  id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NOT NULL,
  role_id INTEGER UNSIGNED NOT NULL,
  INDEX role_ind (role_id),
  CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE,
  manager_id INTEGER UNSIGNED,
  INDEX man_ind (manager_id),
  CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employee(id) ON DELETE SET NULL
);

USE employees;
INSERT INTO department
    (name)
VALUES
    ('Operations'),
    ('Analytics'),
    ('Marketing'),
    ('Executive');
INSERT INTO role
    (title, salary, department_id)
VALUES
    ('Team Manager', 250000, 1),
    ('Team Lead', 185000, 1),
    ('Team Lead Analyst', 160000, 2),
    ('Team Analyst', 145000, 2),
    ('Media Relations', 145000, 3),
    ('Marketing Specialist', 150000, 3),
    ('Legal', 180000, 4),
    ('CTO', 450000, 4);
INSERT INTO employee
    (first_name, last_name, role_id, manager_id)
VALUES
    ('Tom', 'Brady', 1, 2),
    ('Mike', 'Evans', 2, NULL),
    ('Bruce', 'Arians', 3, 1),
    ('Chris', 'Godwin', 4, NULL),
    ('LaVonte', 'David', 5, 3),
    ('Ndamukong', 'Suh', 6, NULL),
    ('Otis', 'Singfield', 7, 4),
    ('Chelsea', 'Hamashin', 8, NULL);