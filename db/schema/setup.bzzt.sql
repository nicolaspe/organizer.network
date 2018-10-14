CREATE TABLE IF NOT EXISTS person (
	id SERIAL PRIMARY KEY,
	email VARCHAR(255),
	name VARCHAR(255),
	about TEXT,
	url VARCHAR(255),
	slug VARCHAR(255),
	context_id INTEGER DEFAULT 1,
	created TIMESTAMP
);
CREATE UNIQUE INDEX person_idx ON person (email, slug);

CREATE TABLE IF NOT EXISTS context (
	id SERIAL PRIMARY KEY,
	parent_id INTEGER,
	name VARCHAR(255),
	slug VARCHAR(255),
	topic TEXT,
	created TIMESTAMP
);

CREATE TABLE IF NOT EXISTS member (
	person_id INTEGER,
	context_id INTEGER,
	invited_by INTEGER,
	leave_slug VARCHAR(255),
	invite_slug VARCHAR(255),
	created TIMESTAMP,
	updated TIMESTAMP
);
CREATE UNIQUE INDEX member_idx ON member (person_id, context_id);
CREATE UNIQUE INDEX member_leave_idx ON member (leave_slug);
CREATE UNIQUE INDEX member_invite_idx ON member (invite_slug);

CREATE TABLE IF NOT EXISTS message (
	id SERIAL PRIMARY KEY,
	context_id INTEGER,
	in_reply_to INTEGER,
	person_id INTEGER,
	content TEXT,
	created TIMESTAMP
);
CREATE INDEX message_idx ON message (id, context_id, in_reply_to, created);
