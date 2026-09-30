CREATE TABLE IF NOT EXISTS towtruck_system (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    job_name VARCHAR(50) NOT NULL,
    has_access BOOLEAN NOT NULL DEFAULT FALSE,
    UNIQUE KEY unique_player_job (player_id, job_name)
);

INSERT INTO towtruck_system (player_id, job_name, has_access) SELECT player_id, 'towtruck', TRUE FROM users WHERE job = 'towtruck';