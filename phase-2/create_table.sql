



CREATE TABLE users (

  id SERIAL,

  username varchar(32) DEFAULT NULL,

  password varchar(60) DEFAULT NULL,

  email text,

  verified int(1) NOT NULL DEFAULT '0',

  profileimg varchar(255) DEFAULT NULL,

  PRIMARY KEY (id)

) ;




CREATE TABLE login_tokens (

  id SERIAL,

  token char(64) NOT NULL DEFAULT '',

  user_id int(11) unsigned NOT NULL,

  PRIMARY KEY (id),

  UNIQUE KEY token (token),

  KEY user_id (user_id),

  CONSTRAINT login_tokens_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (id)

) ;




CREATE TABLE password_tokens (

  id SERIAL,

  token char(64) NOT NULL DEFAULT '',

  user_id int(11) unsigned NOT NULL,

  PRIMARY KEY (id),

  UNIQUE KEY token (token)

) ;


CREATE TABLE posts (

  id SERIAL,

  body varchar(160) NOT NULL DEFAULT '',

  posted_at datetime NOT NULL,

  user_id int(11) unsigned NOT NULL,

  likes int(11) unsigned NOT NULL,

  postimg varchar(255) DEFAULT NULL,

  topics varchar(400) DEFAULT NULL,

  PRIMARY KEY (id),

  KEY user_id (user_id),

  CONSTRAINT posts_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (id)

) ;




CREATE TABLE followers (

  id SERIAL,

  user_id int(11) unsigned NOT NULL,

  follower_id int(11) unsigned NOT NULL,

  PRIMARY KEY (id)

) ;




CREATE TABLE posts (

  id SERIAL,

  body varchar(160) NOT NULL DEFAULT '',

  posted_at datetime NOT NULL,

  user_id int(11) unsigned NOT NULL,

  likes int(11) unsigned NOT NULL,

  postimg varchar(255) DEFAULT NULL,

  topics varchar(400) DEFAULT NULL,

  PRIMARY KEY (id),

  KEY user_id (user_id),

  CONSTRAINT posts_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (id)

) ;




CREATE TABLE post_likes (

  id SERIAL,

  post_id int(11) unsigned NOT NULL,

  user_id int(11) unsigned NOT NULL,

  PRIMARY KEY (id),

  KEY user_id (user_id),

  KEY post_id (post_id),

  CONSTRAINT post_likes_ibfk_2 FOREIGN KEY (user_id) REFERENCES users (id)

) ;

CREATE TABLE comments (

  id SERIAL,

  comment text NOT NULL,

  user_id int(11) unsigned NOT NULL,

  posted_at datetime NOT NULL,

  post_id int(11) unsigned NOT NULL,

  PRIMARY KEY (id),

  KEY user_id (user_id),

  KEY post_id (post_id),

  CONSTRAINT comments_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (id),

  CONSTRAINT comments_ibfk_2 FOREIGN KEY (post_id) REFERENCES posts (id)

) ;




CREATE TABLE messages (

  id SERIAL,

  body text NOT NULL,

  sender int(11) unsigned NOT NULL,

  receiver int(11) unsigned NOT NULL,

  read int(1) unsigned NOT NULL,

  PRIMARY KEY (id)

) ;



CREATE TABLE notifications (

  id SERIAL,

  type int(11) unsigned NOT NULL,

  receiver int(10) unsigned NOT NULL,

  sender int(11) unsigned NOT NULL,

  extra text,

  PRIMARY KEY (id)

) ;
