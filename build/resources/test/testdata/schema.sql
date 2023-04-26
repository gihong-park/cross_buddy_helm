alter table movement_record drop foreign key FKm0054wn6sdcacf4hb7ob5lmof;
alter table movement_record drop foreign key FKhpph818itfucon1wiuc3o2yki;
alter table record drop foreign key FKeny3549xar8rnrcmdw3hl0la1;
alter table record drop foreign key FK1bfpn9cnpalkck07jukw0q5pr;
drop table if exists movement;
drop table if exists movement_record;
drop table if exists record;
drop table if exists user;
drop table if exists workout_ofthe_day;
create table movement (movement_id bigint not null auto_increment, description varchar(255), name varchar(255) not null, primary key (movement_id)) engine=InnoDB;
create table movement_record (id bigint not null auto_increment, created_at datetime(6), is_deleted BIT(1) DEFAULT b'0' not null, updated_at datetime(6), cal float(53) not null, distance float(53) not null, height float(23) not null, name varchar(255), ord integer not null, reps integer not null, weight float(53) not null, record_id bigint, wod_id bigint, primary key (id)) engine=InnoDB;
create table record (record_id bigint not null auto_increment, created_at datetime(6), is_deleted BIT(1) DEFAULT b'0' not null, updated_at datetime(6), date date, description TEXT, note TEXT, result json, user_id bigint, wod_id bigint, primary key (record_id)) engine=InnoDB;
create table user (user_id bigint not null auto_increment, created_at datetime(6), is_deleted BIT(1) DEFAULT b'0' not null, updated_at datetime(6), birth_day date,account_non_expired bit not null, account_non_locked bit not null, credentials_non_expired bit not null, email varchar(255), enabled bit not null, gender smallint, last_logined datetime(6), password varchar(255), role smallint, username varchar(255), primary key (user_id)) engine=InnoDB;
create table workout_ofthe_day (wod_id bigint not null auto_increment, result json,created_at datetime(6), is_deleted BIT(1) DEFAULT b'0' not null, updated_at datetime(6), date date, description varchar(255), name varchar(255), type varchar(255), primary key (wod_id)) engine=InnoDB;
alter table user add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
alter table movement_record add constraint FKm0054wn6sdcacf4hb7ob5lmof foreign key (record_id) references record (record_id);
alter table movement_record add constraint FKhpph818itfucon1wiuc3o2yki foreign key (wod_id) references workout_ofthe_day (wod_id);
alter table record add constraint FKeny3549xar8rnrcmdw3hl0la1 foreign key (user_id) references user (user_id);
alter table record add constraint FK1bfpn9cnpalkck07jukw0q5pr foreign key (wod_id) references workout_ofthe_day (wod_id);
