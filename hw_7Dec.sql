CREATE TABLE video_reactions (
  reaction_id int,
  created_at timestamp,
  author_id int,
  reaction_value int,
  video_id int);
  
INSERT INTO video_reactions (reaction_id, created_at, author_id, reaction_value, video_id)
VALUES
	(1, CURRENT_TIMESTAMP, 2, 5, 2),
    (2, CURRENT_TIMESTAMP, 2, 3, 1),
    (3, CURRENT_TIMESTAMP, 3, 3, 1),
    (4, CURRENT_TIMESTAMP, 3, 5, 2),
    (5, CURRENT_TIMESTAMP, 1, 5, 1);
    
CREATE TABLE comments (
  comment_id int,
  created_at timestamp,
  author_id int,
  content varchar(500),
  video_id int);
  
INSERT INTO comments (comment_id, created_at, author_id, content, video_id)
VALUES
	(1, CURRENT_TIMESTAMP, 2, "nice video!", 1),
    (2, CURRENT_TIMESTAMP, 1, "what a shame", 2),
    (3, CURRENT_TIMESTAMP, 3, "LOOOOOOL!!!", 2),
    (4, CURRENT_TIMESTAMP, 3, "u are genius", 1),
    (5, CURRENT_TIMESTAMP, 1, "make more", 3);
