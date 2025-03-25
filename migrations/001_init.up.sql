-- +migrate Up
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    cf_handle VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE contests (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    level INT NOT NULL,
    created_by INT REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE contest_problems (
    id SERIAL PRIMARY KEY,
    contest_id INT REFERENCES contests(id) ON DELETE CASCADE,
    problem_id INT NOT NULL,
    rating INT NOT NULL,
    topic VARCHAR(255) NOT NULL
);
CREATE TABLE submissions (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    contest_id INT REFERENCES contests(id) ON DELETE CASCADE,
    problem_id INT NOT NULL,
    status VARCHAR(50) NOT NULL,
    submitted_at TIMESTAMP DEFAULT NOW()
);
