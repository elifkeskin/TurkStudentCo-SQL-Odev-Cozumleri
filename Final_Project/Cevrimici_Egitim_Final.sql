DROP TABLE IF EXISTS members;

CREATE TABLE members (
    member_id SERIAL PRIMARY KEY, 
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    u_password VARCHAR(255) NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS courses;

CREATE TABLE courses (
	course_id SERIAL PRIMARY KEY,
	course_name CHARACTER VARYING (200),
	course_description TEXT ,
	starting_date DATE,
	ending_date DATE,
	course_instructor CHARACTER VARYING (100)
);

DROP TABLE IF EXISTS categories;

CREATE TABLE categories (
    category_id SMALLSERIAL PRIMARY KEY,
    category_name CHARACTER VARYING (100),
    course_id INTEGER NOT null,
    FOREIGN KEY (course_id) REFERENCES courses (course_id) ON UPDATE CASCADE ON DELETE CASCADE
);



DROP TABLE IF EXISTS enrollments;

CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    member_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (member_id) REFERENCES members(member_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS certificates;

CREATE TABLE certificates (
    certificate_id SERIAL PRIMARY KEY,
    certificate_code VARCHAR(100) UNIQUE NOT NULL,
    issue_date DATE DEFAULT CURRENT_DATE
);



DROP TABLE IF EXISTS certificate_assignments;

CREATE TABLE certificate_assignments (
    certificate_assignment_id BIGSERIAL PRIMARY KEY,
    member_id INTEGER NOT NULL,
    certificate_id INTEGER NOT NULL,
    assignment_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (member_id) REFERENCES members(member_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (certificate_id) REFERENCES certificates(certificate_id) ON UPDATE CASCADE ON DELETE CASCADE
);


DROP TABLE IF EXISTS blog_posts;

CREATE TABLE blog_posts (
    blog_post_id SERIAL PRIMARY KEY,
    blog_title VARCHAR(255) NOT NULL,
    blog_content TEXT NOT NULL,
    publication_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    author_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES members(member_id) ON UPDATE CASCADE ON DELETE CASCADE
);
