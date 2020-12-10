-- Table: users
create table users (
                       id int not null auto_increment primary key,
                       username varchar(255) not null,
                       password varchar(255) not null,
                       lastname varchar(255) not null,
                       firstname varchar(255) not null,
                       middlename varchar(255) not null,
                       phone varchar(20) not null,
                       datebirth varchar(10) not null,
                       address varchar(255) not null,
                       numberOfPassport varchar(255)
) engine=InnoDB;

ALTER TABLE users ADD COLUMN lastname varchar(255) AFTER password;

-- Table: roles
CREATE TABLE roles (
  id   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
)
  ENGINE = InnoDB;

-- Table for mapping user and roles: user_roles
CREATE TABLE user_roles (
  user_id INT NOT NULL,
  role_id INT NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (role_id) REFERENCES roles (id),

  UNIQUE (user_id, role_id)
)
  ENGINE = InnoDB;

-- Insert data

INSERT INTO users VALUES (1, 'proselyte', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG');

INSERT INTO roles VALUES (1, 'ROLE_USER');
INSERT INTO roles VALUES (2, 'ROLE_ADMIN');

INSERT INTO user_roles VALUES (1, 2);