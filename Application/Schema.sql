CREATE TABLE users (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    locked_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
    failed_login_attempts INT DEFAULT 0 NOT NULL
);
CREATE TABLE links (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    user_id UUID NOT NULL,
    target TEXT NOT NULL,
    slug TEXT NOT NULL UNIQUE
);
CREATE INDEX links_user_id_index ON links (user_id);
ALTER TABLE links ADD CONSTRAINT links_ref_user_id FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;
