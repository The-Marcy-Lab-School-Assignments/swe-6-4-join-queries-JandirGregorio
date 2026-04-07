\c bookmarks_db

DROP TABLE IF EXISTS bookmark_tags;
DROP TABLE IF EXISTS bookmarks;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  user_id   SERIAL  PRIMARY KEY,
  username  TEXT    NOT NULL UNIQUE,
  email     TEXT    NOT NULL
);

CREATE TABLE bookmarks (
  bookmark_id  SERIAL  PRIMARY KEY,
  title        TEXT    NOT NULL,
  url          TEXT    NOT NULL,
  user_id      INT     REFERENCES users(user_id)
);

CREATE TABLE tags (
  tag_id  SERIAL  PRIMARY KEY,
  name    TEXT    NOT NULL UNIQUE
);

CREATE TABLE bookmark_tags (
  bookmark_tag_id  SERIAL  PRIMARY KEY,
  bookmark_id      INT     REFERENCES bookmarks(bookmark_id),
  tag_id           INT     REFERENCES tags(tag_id),
  UNIQUE (bookmark_id, tag_id)
);

INSERT INTO users (username, email) VALUES
  ('alice_j',  'alice@example.com'),
  ('bob_k',    'bob@example.com'),
  ('carla_m',  'carla@example.com'),
  ('dave_r',   'dave@example.com'),
  ('emma_t',   'emma@example.com');

INSERT INTO bookmarks (title, url, user_id) VALUES
  ('MDN Web Docs',      'https://developer.mozilla.org',       1),
  ('PostgreSQL Docs',   'https://www.postgresql.org/docs/',    1),
  ('JavaScript.info',   'https://javascript.info',             1),
  ('CSS Tricks',        'https://css-tricks.com',              2),
  ('DB Fiddle',         'https://www.db-fiddle.com',           2),
  ('Figma',             'https://www.figma.com',               2),
  ('Excalidraw',        'https://excalidraw.com',              3),
  ('Node.js Docs',      'https://nodejs.org/en/docs',          3);

INSERT INTO tags (name) VALUES
  ('javascript'),
  ('css'),
  ('databases'),
  ('tools');

INSERT INTO bookmark_tags (bookmark_id, tag_id) VALUES
  (1, 1),  -- MDN Web Docs      → javascript
  (1, 2),  -- MDN Web Docs      → css
  (2, 3),  -- PostgreSQL Docs   → databases
  (3, 1),  -- JavaScript.info   → javascript
  (4, 2),  -- CSS Tricks        → css
  (4, 4),  -- CSS Tricks        → tools
  (5, 3),  -- DB Fiddle         → databases
  (7, 4);  -- Excalidraw        → tools
  -- bookmarks 6 (Figma) and 8 (Node.js Docs) have no tags
  -- users 4 (dave_r) and 5 (emma_t) have no bookmarks
