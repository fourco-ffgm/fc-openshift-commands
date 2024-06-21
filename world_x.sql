CREATE TABLE city (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country_id INT,
    population INT
);

INSERT INTO city (name, country_id, population) VALUES
('New York', 1, 8623000),
('Los Angeles', 1, 3995000),
('Chicago', 1, 2716000),
('Houston', 1, 2313000),
('Phoenix', 1, 1665000),
('Philadelphia', 1, 1581000),
('San Antonio', 1, 1511000),
('San Diego', 1, 1415000),
('Dallas', 1, 1341000),
('San Jose', 1, 1035000);

CREATE TABLE country (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    continent VARCHAR(255),
    region VARCHAR(255)
);

INSERT INTO country (name, continent, region) VALUES
('United States', 'North America', 'Northern America'),
('Canada', 'North America', 'Northern America'),
('Mexico', 'North America', 'Central America'),
('Brazil', 'South America', 'South America'),
('Argentina', 'South America', 'South America'),
('Chile', 'South America', 'South America'),
('Colombia', 'South America', 'South America'),
('Peru', 'South America', 'South America'),
('Venezuela', 'South America', 'South America'),
('Ecuador', 'South America', 'South America');

CREATE TABLE countryinfo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    country_id INT,
    life_expectancy DECIMAL(5,2),
    gnp DECIMAL(10,2)
);

INSERT INTO countryinfo (country_id, life_expectancy, gnp) VALUES
(1, 78.69, 19390604.00),
(2, 82.30, 1647120.00),
(3, 75.41, 1149235.00),
(4, 75.07, 2055512.00),
(5, 76.52, 637486.00),
(6, 79.57, 277042.00),
(7, 76.96, 309191.00),
(8, 74.79, 211037.00),
(9, 72.06, 345859.00),
(10, 76.29, 102000.00);

CREATE TABLE countrylanguage (
    id INT AUTO_INCREMENT PRIMARY KEY,
    country_id INT,
    language VARCHAR(255),
    is_official BOOLEAN,
    percentage DECIMAL(5,2)
);

INSERT INTO countrylanguage (country_id, language, is_official, percentage) VALUES
(1, 'English', true, 79.2),
(2, 'English', true, 56.9),
(2, 'French', true, 23.2),
(3, 'Spanish', true, 92.7),
(4, 'Portuguese', true, 97.5),
(5, 'Spanish', true, 85.7),
(6, 'Spanish', true, 99.5),
(7, 'Spanish', true, 99.0),
(8, 'Spanish', true, 84.1),
(9, 'Spanish', true, 96.4),
(10, 'Spanish', true, 93.0);