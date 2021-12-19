/* -- Simao (Alice) Chen's DB project Part 1*/

drop table if exists Availability_dates;
drop table if exists Rooms;
drop table if exists Response_info;
drop table if exists Ratings;
drop table if exists Listings;
drop table if exists Hosts;
drop table if exists Neighborhoods;

create table Neighborhoods (
  n_name varchar(32) primary key,
  restaurant Boolean,
  museum Boolean,
  curfew Boolean
);

create table Hosts (
  hid integer primary key,
  name varchar(32) not null,
  pets Boolean not null,
  n_name varchar(32) not null,
  foreign key (n_name) references Neighborhoods (n_name)
);

create table Listings (
  lid integer primary key,
  hid integer not null,
  n_name varchar(32) not null,
  property_type varchar(32) not null,
  price integer not null,
  foreign key (hid) references Hosts (hid),
  foreign key (n_name) references Neighborhoods (n_name)
);

create table Ratings (
  rating_id integer primary key,
  lid integer not null,
  score integer,
  check (score <= 10 and score >= 0),
  foreign key (lid) references Listings (lid)
);

create table Response_info (
  res_id integer primary key,
  hid integer not null,
  response_time integer,
  response_rate decimal,
  check (response_rate <= 1 and response_rate >=0),
  foreign key (hid) references Hosts (hid)
);

create table Rooms (
  lid integer,
  room_id integer,
  room_type varchar(32) not null,
  num_people integer,
  primary key (lid, room_id),
  foreign key (lid) references Listings (lid) on delete cascade
);

create table Availability_dates (
  start_date date,
  end_date date,
  lid integer,
  room_id integer,
  primary key (lid, room_id, start_date, end_date),
  foreign key (lid, room_id) references rooms (lid, room_id) on delete cascade
);




insert into Neighborhoods (n_name, restaurant, museum, curfew) values ('The Old Centre', true, false, false);
insert into Neighborhoods (n_name, restaurant, museum, curfew) values ('Dam Square', true, true, true);
insert into Neighborhoods (n_name, restaurant, museum, curfew) values ('Canal Belt', true, true, true);
insert into Neighborhoods (n_name, restaurant, museum, curfew) values ('Jordaan', false, true, false);
insert into Neighborhoods (n_name, restaurant, museum, curfew) values ('Spui', true, true, false);
insert into Neighborhoods (n_name, restaurant, museum, curfew) values ('Noord', false, true, true);
insert into Neighborhoods (n_name, restaurant, museum, curfew) values ('Oost', true, true, false);



insert into Hosts (hid, name, pets, n_name) values (1, 'Alex', false, 'Oost');
insert into Hosts (hid, name, pets, n_name) values (2, 'Bob', false, 'The Old Centre');
insert into Hosts (hid, name, pets, n_name) values (3, 'Tina', true, 'The Old Centre');
insert into Hosts (hid, name, pets, n_name) values (4, 'Liam', true, 'Dam Square');
insert into Hosts (hid, name, pets, n_name) values (5, 'Noah', true, 'Dam Square');
insert into Hosts (hid, name, pets, n_name) values (6, 'Oliver', false, 'Oost');
insert into Hosts (hid, name, pets, n_name) values (7, 'Jessica', false, 'The Old Centre');
insert into Hosts (hid, name, pets, n_name) values (8, 'Jenna', false, 'Noord');
insert into Hosts (hid, name, pets, n_name) values (9, 'William', false, 'The Old Centre');
insert into Hosts (hid, name, pets, n_name) values (10, 'Bob', false, 'Oost');
insert into Hosts (hid, name, pets, n_name) values (11, 'James', true, 'Noord');
insert into Hosts (hid, name, pets, n_name) values (12, 'Emma', true, 'The Old Centre');
insert into Hosts (hid, name, pets, n_name) values (13, 'Evelyn', true, 'Noord');
insert into Hosts (hid, name, pets, n_name) values (14, 'Mia', true, 'The Old Centre');
insert into Hosts (hid, name, pets, n_name) values (15, 'Harper', true, 'Noord');
insert into Hosts (hid, name, pets, n_name) values (16, 'Abigail', true, 'Dam Square');
insert into Hosts (hid, name, pets, n_name) values (17, 'Bob', true, 'Oost');
insert into Hosts (hid, name, pets, n_name) values (18, 'Lucas', false, 'Noord');
insert into Hosts (hid, name, pets, n_name) values (19, 'Henry', false, 'Noord');
insert into Hosts (hid, name, pets, n_name) values (20, 'Alex', false, 'Canal Belt');
insert into Hosts (hid, name, pets, n_name) values (21, 'Mason', false, 'Spui');
insert into Hosts (hid, name, pets, n_name) values (22, 'Mila', true, 'Jordaan');
insert into Hosts (hid, name, pets, n_name) values (23, 'Scarlett', true, 'Oost');
insert into Hosts (hid, name, pets, n_name) values (24, 'Avery', true, 'Dam Square');
insert into Hosts (hid, name, pets, n_name) values (25, 'Ethan', true, 'Canal Belt');
insert into Hosts (hid, name, pets, n_name) values (26, 'Mike', false, 'Spui');
insert into Hosts (hid, name, pets, n_name) values (27, 'Madison', false, 'Dam Square');
insert into Hosts (hid, name, pets, n_name) values (28, 'Layla', true, 'Oost');
insert into Hosts (hid, name, pets, n_name) values (29, 'Daniel', true, 'Jordaan');
insert into Hosts (hid, name, pets, n_name) values (30, 'Logan', false, 'The Old Centre');
insert into Hosts (hid, name, pets, n_name) values (31, 'Penelope', false, 'Spui');
insert into Hosts (hid, name, pets, n_name) values (32, 'Grace', true, 'Canal Belt');
insert into Hosts (hid, name, pets, n_name) values (33, 'Ellie', true, 'Jordaan');
insert into Hosts (hid, name, pets, n_name) values (34, 'Mike', true, 'Spui');
insert into Hosts (hid, name, pets, n_name) values (36, 'Nora', false, 'Oost');
insert into Hosts (hid, name, pets, n_name) values (37, 'Hazel', false, 'Jordaan');
insert into Hosts (hid, name, pets, n_name) values (38, 'Zoey', false, 'Canal Belt');
insert into Hosts (hid, name, pets, n_name) values (39, 'Victoria', false, 'Dam Square');
insert into Hosts (hid, name, pets, n_name) values (40, 'Mike', false, 'Canal Belt');
insert into Hosts (hid, name, pets, n_name) values (41, 'Grace', false, 'Oost');
insert into Hosts (hid, name, pets, n_name) values (42, 'Bob', false, 'The Old Centre');
insert into Hosts (hid, name, pets, n_name) values (43, 'Sebastian', false, 'Dam Square');
insert into Hosts (hid, name, pets, n_name) values (44, 'Mia', false, 'Jordaan');
insert into Hosts (hid, name, pets, n_name) values (45, 'Jack', false, 'Oost');
insert into Hosts (hid, name, pets, n_name) values (46, 'Alex', false, 'Canal Belt');
insert into Hosts (hid, name, pets, n_name) values (47, 'Nova', false, 'Jordaan');
insert into Hosts (hid, name, pets, n_name) values (48, 'Emily', false, 'Canal Belt');
insert into Hosts (hid, name, pets, n_name) values (49, 'Mason', false, 'The Old Centre');
insert into Hosts (hid, name, pets, n_name) values (50, 'Bob', false, 'Dam Square');



insert into Listings (lid, hid, n_name, property_type, price) values (1, 2, 'Dam Square', 'High rise', 100);
insert into Listings (lid, hid, n_name, property_type, price) values (2, 23, 'Noord', 'High rise', 120);
insert into Listings (lid, hid, n_name, property_type, price) values (3, 25, 'Dam Square', 'High rise', 150);
insert into Listings (lid, hid, n_name, property_type, price) values (4, 1, 'Jordaan', 'Walk up', 110);
insert into Listings (lid, hid, n_name, property_type, price) values (5, 6, 'Noord', 'Townhouse', 180);
insert into Listings (lid, hid, n_name, property_type, price) values (6, 32, 'Dam Square', 'Walk up', 75);
insert into Listings (lid, hid, n_name, property_type, price) values (7, 32, 'Noord', 'Walk up', 60);
insert into Listings (lid, hid, n_name, property_type, price) values (8, 34, 'Jordaan', 'Walk up', 45);
insert into Listings (lid, hid, n_name, property_type, price) values (9, 17, 'The Old Centre', 'Townhouse', 210);
insert into Listings (lid, hid, n_name, property_type, price) values (10, 18, 'Noord', 'Townhouse', 120);
insert into Listings (lid, hid, n_name, property_type, price) values (11, 19, 'Spui', 'Walk up', 130);
insert into Listings (lid, hid, n_name, property_type, price) values (12, 27, 'Dam Square', 'Walk up', 120);
insert into Listings (lid, hid, n_name, property_type, price) values (13, 30, 'Spui', 'Townhouse', 180);
insert into Listings (lid, hid, n_name, property_type, price) values (14, 20, 'Jordaan', 'Townhouse', 180);
insert into Listings (lid, hid, n_name, property_type, price) values (15, 10, 'Noord', 'Townhouse', 320);
insert into Listings (lid, hid, n_name, property_type, price) values (16, 3, 'Spui', 'High rise', 300);
insert into Listings (lid, hid, n_name, property_type, price) values (17, 4, 'Dam Square', 'Townhouse', 260);
insert into Listings (lid, hid, n_name, property_type, price) values (18, 5, 'The Old Centre', 'Townhouse', 220);
insert into Listings (lid, hid, n_name, property_type, price) values (19, 6, 'Spui', 'Walk up', 210);
insert into Listings (lid, hid, n_name, property_type, price) values (20, 7, 'Spui', 'Townhouse', 270);
insert into Listings (lid, hid, n_name, property_type, price) values (21, 8, 'Oost', 'Townhouse', 350);
insert into Listings (lid, hid, n_name, property_type, price) values (22, 9, 'Dam Square', 'High rise', 370);
insert into Listings (lid, hid, n_name, property_type, price) values (23, 11, 'Oost', 'High rise', 190);
insert into Listings (lid, hid, n_name, property_type, price) values (24, 13, 'The Old Centre', 'High rise', 170);
insert into Listings (lid, hid, n_name, property_type, price) values (25, 14, 'Oost', 'High rise', 110);
insert into Listings (lid, hid, n_name, property_type, price) values (26, 12, 'Oost', 'High rise', 100);
insert into Listings (lid, hid, n_name, property_type, price) values (27, 31, 'Jordaan', 'High rise', 80);
insert into Listings (lid, hid, n_name, property_type, price) values (28, 32, 'Dam Square', 'High rise', 80);
insert into Listings (lid, hid, n_name, property_type, price) values (29, 33, 'Jordaan', 'High rise', 95);
insert into Listings (lid, hid, n_name, property_type, price) values (30, 34, 'The Old Centre', 'Walk up', 125);
insert into Listings (lid, hid, n_name, property_type, price) values (31, 38, 'Oost', 'Walk up', 115);
insert into Listings (lid, hid, n_name, property_type, price) values (32, 39, 'Jordaan', 'Townhouse', 145);
insert into Listings (lid, hid, n_name, property_type, price) values (33, 40, 'Oost', 'Walk up', 175);
insert into Listings (lid, hid, n_name, property_type, price) values (34, 41,'Jordaan', 'Walk up', 185);
insert into Listings (lid, hid, n_name, property_type, price) values (35, 42,'Oost', 'Townhouse', 195);
insert into Listings (lid, hid, n_name, property_type, price) values (36, 43, 'Jordaan', 'Townhouse', 270);
insert into Listings (lid, hid, n_name, property_type, price) values (37, 44, 'The Old Centre', 'High rise', 220);
insert into Listings (lid, hid, n_name, property_type, price) values (38, 45,'Oost', 'High rise', 285);
insert into Listings (lid, hid, n_name, property_type, price) values (39, 46, 'Jordaan', 'Townhouse', 290);
insert into Listings (lid, hid, n_name, property_type, price) values (40, 47, 'Jordaan', 'Townhouse', 385);
insert into Listings (lid, hid, n_name, property_type, price) values (41, 48, 'Dam Square', 'High rise', 315);
insert into Listings (lid, hid, n_name, property_type, price) values (42, 49,'Jordaan',  'Townhouse', 120);
insert into Listings (lid, hid, n_name, property_type, price) values (43, 50,'The Old Centre',  'High rise', 130);
insert into Listings (lid, hid, n_name, property_type, price) values (44, 15,'The Old Centre',  'High rise', 115);
insert into Listings (lid, hid, n_name, property_type, price) values (45, 1, 'Jordaan', 'Walk up', 90);
insert into Listings (lid, hid, n_name, property_type, price) values (46, 32, 'Jordaan', 'Walk up', 45);
insert into Listings (lid, hid, n_name, property_type, price) values (47, 32,'Canal Belt', 'Walk up', 45);
insert into Listings (lid, hid, n_name, property_type, price) values (48, 21,  'The Old Centre',  'High rise', 60);
insert into Listings (lid, hid, n_name, property_type, price) values (49, 22, 'Dam Square', 'High rise', 80);
insert into Listings (lid, hid, n_name, property_type, price) values (50, 23, 'Canal Belt', 'Walk up', 85);
insert into Listings (lid, hid, n_name, property_type, price) values (51, 24,'Canal Belt', 'Walk up', 90);
insert into Listings (lid, hid, n_name, property_type, price) values (52, 25,'Jordaan', 'High rise', 110);
insert into Listings (lid, hid, n_name, property_type, price) values (53, 26,'Canal Belt', 'Walk up', 75);
insert into Listings (lid, hid, n_name, property_type, price) values (54, 27,'Canal Belt', 'High rise', 145);
insert into Listings (lid, hid, n_name, property_type, price) values (55, 28,'The Old Centre', 'Townhouse', 425);


insert into Ratings (rating_id, lid, score) values (1, 1, 9);
insert into Ratings (rating_id, lid, score) values (2, 2, 8);
insert into Ratings (rating_id, lid, score) values (3, 3, 8.5);
insert into Ratings (rating_id, lid, score) values (4, 4, 6);
insert into Ratings (rating_id, lid, score) values (5, 5, 8);
insert into Ratings (rating_id, lid, score) values (6, 6, 7);
insert into Ratings (rating_id, lid, score) values (7, 7, 8);
insert into Ratings (rating_id, lid, score) values (8, 8, 6);
insert into Ratings (rating_id, lid, score) values (9, 9, 9);
insert into Ratings (rating_id, lid, score) values (10, 10, 8);
insert into Ratings (rating_id, lid, score) values (11, 11, 8);
insert into Ratings (rating_id, lid, score) values (12, 12, 9);
insert into Ratings (rating_id, lid, score) values (13, 13, 7);
insert into Ratings (rating_id, lid, score) values (14, 14, 9);
insert into Ratings (rating_id, lid, score) values (15, 15, 6.5);
insert into Ratings (rating_id, lid, score) values (16, 16, 7.5);
insert into Ratings (rating_id, lid, score) values (17, 17, 8.5);
insert into Ratings (rating_id, lid, score) values (18, 18, 9);
insert into Ratings (rating_id, lid, score) values (19, 19, 6.5);
insert into Ratings (rating_id, lid, score) values (20, 20, 8.5);
insert into Ratings (rating_id, lid, score) values (21, 21, 7.6);
insert into Ratings (rating_id, lid, score) values (22, 22, 8.5);
insert into Ratings (rating_id, lid, score) values (23, 23, 8.2);
insert into Ratings (rating_id, lid, score) values (24, 24, 5.4);
insert into Ratings (rating_id, lid, score) values (25, 25, 8.8);
insert into Ratings (rating_id, lid, score) values (26, 26, 9.4);
insert into Ratings (rating_id, lid, score) values (27, 27, 5.6);
insert into Ratings (rating_id, lid, score) values (28, 28, 7.6);
insert into Ratings (rating_id, lid, score) values (29, 29, 8.2);
insert into Ratings (rating_id, lid, score) values (30, 30, 8);
insert into Ratings (rating_id, lid, score) values (31, 31, 8);
insert into Ratings (rating_id, lid, score) values (32, 32, 8);
insert into Ratings (rating_id, lid, score) values (33, 33, 8);
insert into Ratings (rating_id, lid, score) values (34, 34, 8);
insert into Ratings (rating_id, lid, score) values (35, 35, 9);
insert into Ratings (rating_id, lid, score) values (36, 36, 9);
insert into Ratings (rating_id, lid, score) values (37, 37, 10);
insert into Ratings (rating_id, lid, score) values (38, 38, 9);
insert into Ratings (rating_id, lid, score) values (39, 39, 9);
insert into Ratings (rating_id, lid, score) values (40, 40, 8);
insert into Ratings (rating_id, lid, score) values (41, 41, 8);
insert into Ratings (rating_id, lid, score) values (42, 42, 5);
insert into Ratings (rating_id, lid, score) values (43, 43, 8);
insert into Ratings (rating_id, lid, score) values (44, 44, 7);
insert into Ratings (rating_id, lid, score) values (45, 45, 7.5);
insert into Ratings (rating_id, lid, score) values (46, 46, 7);
insert into Ratings (rating_id, lid, score) values (47, 47, 8);
insert into Ratings (rating_id, lid, score) values (48, 48, 8.6);
insert into Ratings (rating_id, lid, score) values (49, 49, 9.5);
insert into Ratings (rating_id, lid, score) values (50, 50, 10);
insert into Ratings (rating_id, lid, score) values (51, 51, 9);
insert into Ratings (rating_id, lid, score) values (52, 52, 9);
insert into Ratings (rating_id, lid, score) values (53, 53, 8);
insert into Ratings (rating_id, lid, score) values (54, 54, 7.6);
insert into Ratings (rating_id, lid, score) values (55, 55, 6.5);


insert into Response_info (res_id, hid, response_time, response_rate) values (1, 1, 1, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (2, 2, 0.8, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (3, 3, 1, 0.9);
insert into Response_info (res_id, hid, response_time, response_rate) values (4, 4, 9, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (5, 5, 3, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (6, 6, 8, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (7, 7, 1, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (8, 8, 7, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (9, 9, 1, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (10, 10, 1, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (11, 11, 5, 0.95);
insert into Response_info (res_id, hid, response_time, response_rate) values (12, 12, 1, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (13, 13, 3, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (14, 14, 1, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (15, 15, 1.5, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (16, 16, 2, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (17, 17, 3, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (18, 18, 2, 0.6);
insert into Response_info (res_id, hid, response_time, response_rate) values (19, 19, 1, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (20, 20, 1.5, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (21, 21, 3, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (22, 22, 1, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (23, 23, 1.5, 0.7);
insert into Response_info (res_id, hid, response_time, response_rate) values (24, 24, 1.5, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (25, 25, 1, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (26, 26, 4, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (27, 27, 1, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (28, 28, 0.6, 0.8);
insert into Response_info (res_id, hid, response_time, response_rate) values (29, 29, 0.5, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (30, 30, 1, 0.7);
insert into Response_info (res_id, hid, response_time, response_rate) values (31, 31, 17, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (32, 32, 2, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (33, 33, 6, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (34, 34, 12, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (35, 38, 1, 0.9);
insert into Response_info (res_id, hid, response_time, response_rate) values (36, 39, 12, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (37, 40, 1, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (38, 41, 4, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (39, 42, 3, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (40, 43, 3, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (41, 44, 18, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (42, 45, 1, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (43, 46, 16, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (44, 47, 15, 0.9);
insert into Response_info (res_id, hid, response_time, response_rate) values (45, 48, 18, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (46, 49, 1, 1);
insert into Response_info (res_id, hid, response_time, response_rate) values (47, 50, 1.5, 1);



insert into Rooms (lid, room_id, room_type, num_people) values (1, 1, 'private room', 1);
insert into Rooms (lid, room_id, room_type, num_people) values (2, 1, 'private room', 2);
insert into Rooms (lid, room_id, room_type, num_people) values (3, 1, 'private room', 1);
insert into Rooms (lid, room_id, room_type, num_people) values (3, 2, 'private room', 3);
insert into Rooms (lid, room_id, room_type, num_people) values (3, 3, 'private room', 1);
insert into Rooms (lid, room_id, room_type, num_people) values (4, 1, 'private room', 2);
insert into Rooms (lid, room_id, room_type, num_people) values (5, 1, 'entire place', 18);
insert into Rooms (lid, room_id, room_type, num_people) values (6, 1, 'shared room', 1);
insert into Rooms (lid, room_id, room_type, num_people) values (7, 1, 'shared room', 2);
insert into Rooms (lid, room_id, room_type, num_people) values (8, 1, 'shared room', 2);
insert into Rooms (lid, room_id, room_type, num_people) values (9, 1, 'private room', 1);
insert into Rooms (lid, room_id, room_type, num_people) values (10, 1, 'private room', 2);
insert into Rooms (lid, room_id, room_type, num_people) values (10, 2, 'shared room', 2);
insert into Rooms (lid, room_id, room_type, num_people) values (11, 1, 'private room', 1);
insert into Rooms (lid, room_id, room_type, num_people) values (12, 1, 'private room', 1);
insert into Rooms (lid, room_id, room_type, num_people) values (13, 1, 'private room', 3);
insert into Rooms (lid, room_id, room_type, num_people) values (14, 1, 'private room', 5);
insert into Rooms (lid, room_id, room_type, num_people) values (15, 1, 'private room', 2);
insert into Rooms (lid, room_id, room_type, num_people) values (16, 1, 'private room', 2);
insert into Rooms (lid, room_id, room_type, num_people) values (17, 1, 'entire place', 17);
insert into Rooms (lid, room_id, room_type, num_people) values (18, 1, 'entire place', 19);
insert into Rooms (lid, room_id, room_type, num_people) values (19, 1, 'private room', 1);
insert into Rooms (lid, room_id, room_type, num_people) values (20, 1, 'entire place', 5);
insert into Rooms (lid, room_id, room_type, num_people) values (21, 1, 'entire place', 6);
insert into Rooms (lid, room_id, room_type, num_people) values (22, 1, 'shared room', 4);
insert into Rooms (lid, room_id, room_type, num_people) values (23, 1, 'shared room', 2);
insert into Rooms (lid, room_id, room_type, num_people) values (24, 1, 'shared room', 2);
insert into Rooms (lid, room_id, room_type, num_people) values (25, 1, 'private room', 1);
insert into Rooms (lid, room_id, room_type, num_people) values (26, 1, 'private room', 4);
insert into Rooms (lid, room_id, room_type, num_people) values (27, 1, 'private room', 2);
insert into Rooms (lid, room_id, room_type, num_people) values (28, 1, 'private room', 1);
insert into Rooms (lid, room_id, room_type, num_people) values (29, 1, 'private room', 3);
insert into Rooms (lid, room_id, room_type, num_people) values (30, 1, 'private room', 1);
insert into Rooms (lid, room_id, room_type, num_people) values (31, 1, 'private room', 2);
insert into Rooms (lid, room_id, room_type, num_people) values (32, 1, 'private room', 5);
insert into Rooms (lid, room_id, room_type, num_people) values (32, 2, 'shared room', 2);
insert into Rooms (lid, room_id, room_type, num_people) values (32, 3, 'private room', 4);
insert into Rooms (lid, room_id, room_type, num_people) values (32, 4, 'shared room', 3);
insert into Rooms (lid, room_id, room_type, num_people) values (33, 1, 'private room', 1);
insert into Rooms (lid, room_id, room_type, num_people) values (34, 1, 'private room', 7);
insert into Rooms (lid, room_id, room_type, num_people) values (35, 1, 'private room', 4);
insert into Rooms (lid, room_id, room_type, num_people) values (35, 2, 'private room', 6);
insert into Rooms (lid, room_id, room_type, num_people) values (35, 3, 'shared room', 3);
insert into Rooms (lid, room_id, room_type, num_people) values (36, 1, 'entire place', 16);
insert into Rooms (lid, room_id, room_type, num_people) values (37, 1, 'private room', 1);
insert into Rooms (lid, room_id, room_type, num_people) values (37, 2, 'private room', 2);
insert into Rooms (lid, room_id, room_type, num_people) values (37, 3, 'private room', 2);
insert into Rooms (lid, room_id, room_type, num_people) values (38, 1, 'private room', 2);
insert into Rooms (lid, room_id, room_type, num_people) values (39, 1, 'private room', 1);
insert into Rooms (lid, room_id, room_type, num_people) values (39, 2, 'private room', 2);
insert into Rooms (lid, room_id, room_type, num_people) values (39, 3, 'private room', 1);
insert into Rooms (lid, room_id, room_type, num_people) values (40, 1, 'shared room', 4);
insert into Rooms (lid, room_id, room_type, num_people) values (40, 2, 'shared room', 3);
insert into Rooms (lid, room_id, room_type, num_people) values (40, 3, 'shared room', 2);
insert into Rooms (lid, room_id, room_type, num_people) values (41, 1, 'entire place', 20);
insert into Rooms (lid, room_id, room_type, num_people) values (42, 1, 'private room', 8);
insert into Rooms (lid, room_id, room_type, num_people) values (42, 2, 'shared room', 4);
insert into Rooms (lid, room_id, room_type, num_people) values (43, 1, 'private room', 1);
insert into Rooms (lid, room_id, room_type, num_people) values (44, 1, 'private room', 2);
insert into Rooms (lid, room_id, room_type, num_people) values (45, 1, 'private room', 1);
insert into Rooms (lid, room_id, room_type, num_people) values (46, 1, 'private room', 1);
insert into Rooms (lid, room_id, room_type, num_people) values (47, 1, 'private room', 2);
insert into Rooms (lid, room_id, room_type, num_people) values (48, 1, 'private room', 1);
insert into Rooms (lid, room_id, room_type, num_people) values (49, 1, 'private room', 2);
insert into Rooms (lid, room_id, room_type, num_people) values (50, 1, 'private room', 1);
insert into Rooms (lid, room_id, room_type, num_people) values (51, 1, 'shared room', 2);
insert into Rooms (lid, room_id, room_type, num_people) values (52, 1, 'private room', 1);
insert into Rooms (lid, room_id, room_type, num_people) values (53, 1, 'shared room', 1);
insert into Rooms (lid, room_id, room_type, num_people) values (54, 1, 'private room', 1);
insert into Rooms (lid, room_id, room_type, num_people) values (55, 1, 'private room', 2);
insert into Rooms (lid, room_id, room_type, num_people) values (55, 2, 'private room', 8);
insert into Rooms (lid, room_id, room_type, num_people) values (55, 3, 'private room', 3);
insert into Rooms (lid, room_id, room_type, num_people) values (55, 4, 'private room', 2);




insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-22', '2021-09-23', 1, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-22', '2021-09-30', 2, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-12', '2021-09-30', 3, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-22', '2021-09-24', 3, 2);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-14', '2021-09-30', 3, 3);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-24', 4, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-14', '2021-09-15', 5, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-28', 6, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-14', '2021-09-23', 7, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-22', '2021-09-15', 8, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-14', '2021-09-28', 9, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-12', '2021-09-28', 10, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-21', '2021-09-28', 11, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-28', 12, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-14', '2021-09-28', 13, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-12', '2021-09-15', 14, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-12', '2021-09-28', 15, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-12', '2021-09-15', 16, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-28', 17, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-28', 18, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-26', 19, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-25', 20, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-14', '2021-09-27', 21, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-26', 22, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-29', 23, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-15', 24, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-13', '2021-09-30', 25, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-10', '2021-09-22', 26, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-12', '2021-09-15', 27, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-14', '2021-09-24', 28, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-12', '2021-09-23', 29, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-28', 30, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-12', '2021-09-29', 31, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-12', '2021-09-15', 32, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-15', 32, 2);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-12', '2021-09-15', 32, 3);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-15', 33, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-14', '2021-09-15', 34, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-15', 35, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-12', '2021-09-15', 35, 2);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-15', 35, 3);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-15', 36, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-15', 37, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-14', '2021-09-15', 37, 2);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-12', '2021-09-25', 37, 3);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-15', 38, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-12', '2021-09-27', 39, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-15', 39, 2);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-12', '2021-09-26', 39, 3);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-12', '2021-09-25', 40, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-15', 40, 2);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-14', '2021-09-22', 40, 3);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-24', 41, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-12', '2021-09-20', 42, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-12', '2021-09-20', 42, 2);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-26', 43, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-14', '2021-09-15', 44, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-27', 45, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-15', 46, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-15', 47, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-22', 48, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-14', '2021-09-18', 49, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-12', '2021-09-28', 50, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-12', '2021-09-16', 51, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-12', '2021-09-29', 52, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-12', '2021-09-25', 53, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-01', '2021-09-21', 54, 1);
insert into Availability_dates (start_date, end_date, lid, room_id) values ('2021-09-12', '2021-09-22', 55, 1);
