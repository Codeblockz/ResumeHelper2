-- Development database initialization with sample data

-- Run the main initialization
\i /docker-entrypoint-initdb.d/init.sql;

-- Insert sample user for development
INSERT INTO users (email, password_hash, first_name, last_name) 
VALUES ('dev@example.com', '$2b$12$example_hash_for_development', 'Dev', 'User');

-- Get the user ID for sample data
DO $$
DECLARE
    dev_user_id UUID;
BEGIN
    SELECT id INTO dev_user_id FROM users WHERE email = 'dev@example.com';
    
    -- Insert sample resume
    INSERT INTO resumes (user_id, title, original_content, file_type) 
    VALUES (
        dev_user_id, 
        'Software Engineer Resume',
        '{"summary": "Experienced software engineer with 5+ years in web development", "experience": [{"title": "Senior Developer", "company": "Tech Corp", "duration": "2020-2023", "description": "Led development of microservices architecture"}], "skills": ["Python", "JavaScript", "React", "PostgreSQL"]}',
        'json'
    );
    
    -- Insert sample job description
    INSERT INTO job_descriptions (user_id, title, company, content, keywords, requirements)
    VALUES (
        dev_user_id,
        'Full Stack Developer',
        'Startup Inc',
        'We are looking for a full stack developer with experience in Python, React, and PostgreSQL. Must have 3+ years experience.',
        '["Python", "React", "PostgreSQL", "Full Stack", "Web Development"]',
        '["3+ years experience", "Python proficiency", "React knowledge", "Database skills"]'
    );
END $$;