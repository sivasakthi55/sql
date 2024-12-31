use sivasakthi;
CREATE TABLE players (player_id INT PRIMARY KEY,player_name VARCHAR(100),team_id INT);

INSERT INTO players VALUES 
(1, 'Virat Kohli', 1), 
(2, 'Joe Root', 2), 
(3, 'Steve Smith', 3),
(4, 'Rohit Sharma', 1);









CREATE TABLE teams (team_id INT PRIMARY KEY,team_name VARCHAR(100));

INSERT INTO teams VALUES 
(1, 'India'), 
(2, 'England'), 
(3, 'Australia'), 
(4, 'New Zealand');

CREATE TABLE matches (match_id INT PRIMARY KEY,match_name VARCHAR(100),player_id INT);

INSERT INTO matches VALUES 
(1, 'World Cup Final', 1), 
(2, 'Ashes', 2), 
(3, 'Champions Trophy', NULL);

select * from players;
select * from teams;
select*from matches;

select players.player_id,players.player_name,teams.team_name,matches.match_name
FROM players
inner join teams on players.team_id=teams.team_id
inner join matches on matches.player_id=players.player_id;

select players.player_id,players.player_name,teams.team_name,matches.match_name
from players
left join teams on teams.team_id=players.team_id
left join matches on matches.player_id=players.player_id;

select players.player_id,players.player_name,teams.team_name,matches.match_name
from players
right join teams on teams.team_id=players.team_id
right join matches on matches.player_id=players.player_id;

select players.player_id,players.player_name,teams.team_name,matches.match_name
FROM players
full outer join teams on players.team_id=teams.team_id
full outer join matches on matches.player_id=players.player_id;


1. Finding Players Without a Team

select players.player_id,players.player_name
from players
left join teams on players.team_id=players.team_id
where teams.team_id is null;

2. Finding Teams Without Any Players 

select players.player_name,teams.team_name
from players
right join teams on teams.team_id=players.team_id
where players.player_id is null;

3. List of All Players and Their Matches

select players.player_name,matches.match_name
from players
left join matches on matches.player_id=players.player_id;

4.Finding Matches Without Any Players 

select matches.match_id,matches.match_name ,players.player_id
from players
right join matches on matches.match_id=matches.player_id
where players.player_id is null;

SELECT m.match_id, m.match_name
FROM matches m
LEFT JOIN players p ON m.player_id = p.player_id
WHERE p.player_id IS NULL;

select players.player_name,teams.team_name,matches.match_name
from players
full outer join teams on teams.team_id=players.team_id
full outer join matches on matches.player_id=players.player_id;

8. Finding Players Who Played in Specific Matches ("World Cup Final").

select players.player_id,players.player_name,matches.match_name
from players
inner join matches on players.player_id=matches.player_id
where matches.match_name='world cup final';

11. Players Who Have Not Played Any Matches (This query lists players who have never participated in any match).

select players.player_name,matches.match_name
from players
left join matches on matches.player_id=players.player_id
where matches.match_id is null;

4. Find Matches Played by Players in Specific Team (e.g., "India")

select players.player_name,teams.team_name,matches.match_name
from players
inner join matches on players.player_id = matches.player_id
inner join teams on teams.team_id=players.team_id
where teams.team_name='india';

This query counts the number of matches that each team’s players have participated in.

select team_name , (select COUNT(matches.match_id) from matches inner join players on matches.player_id=players.player_id
where teams.team_id=players.team_id)[no of match] from teams;


 group by and order by queries

1. find the teams with the most players in the players table, and display the team name and the count of players per team.
		
		select team_name ,(select COUNT(player_id) from players where players.team_id =teams.team_id) as totalplayers
		from teams;

2.This query will list the matches where players from the 'India' team participated:

		select match_name from matches where player_id in (select player_id from players where team_id in (select team_id from teams where team_name='india'));

3.Find the total number of matches played by each player and order the result by the highest total matches.

		select players.player_name , COUNT(matches.match_id) as totalmatches 
		from players
		left join matches on players.player_id=matches.player_id
		group by players.player_name
		order by totalmatches desc;





