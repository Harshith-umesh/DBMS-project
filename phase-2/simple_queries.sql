select body from posts where user_id=1;
select type,count(type) from notifications group by type;
select username from users where id=(select user_id from posts where id=1);
select user_id,count(user_id) from followers group by user_id order by user_id;
select username,verified from users where verified=1;
