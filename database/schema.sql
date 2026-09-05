-- IMPERIUM ACADEMY JAMB CBT
-- DATABASE FOUNDATION

CREATE TABLE subjects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE questions (
    id SERIAL PRIMARY KEY,
    subject_id INTEGER NOT NULL REFERENCES subjects(id),
    question TEXT NOT NULL,
    option_a TEXT NOT NULL,
    option_b TEXT NOT NULL,
    option_c TEXT NOT NULL,
    option_d TEXT NOT NULL,
    correct_answer CHAR(1) NOT NULL,
    explanation TEXT,
    topic VARCHAR(150),
    difficulty VARCHAR(30) DEFAULT 'medium',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE,
    candidate_id VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE exams (
    id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(id),
    started_at TIMESTAMP,
    submitted_at TIMESTAMP,
    score INTEGER DEFAULT 0,
    status VARCHAR(30) DEFAULT 'in_progress'
);

CREATE TABLE exam_questions (
    id SERIAL PRIMARY KEY,
    exam_id INTEGER NOT NULL REFERENCES exams(id),
    question_id INTEGER NOT NULL REFERENCES questions(id),
    selected_answer CHAR(1),
    is_correct BOOLEAN DEFAULT FALSE
);

-- JAMB subjects
INSERT INTO subjects (name) VALUES
('English Language'),
('Mathematics'),
('Physics'),
('Chemistry'),
('Biology'),
('Economics'),
('Government'),
('Literature');