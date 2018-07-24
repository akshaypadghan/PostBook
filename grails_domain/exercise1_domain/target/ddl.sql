
    alter table posts 
        drop 
        foreign key FK_4e2wq23jk4rg7opbb4xxrmfqm;

    alter table user_group 
        drop 
        foreign key FK_earft2v509gyadj5ukc2jvd3g;

    drop table if exists posts;

    drop table if exists user;

    drop table if exists user_group;

    create table posts (
        id bigint not null auto_increment,
        version bigint not null,
        description varchar(255) not null,
        users_id bigint not null,
        primary key (id)
    ) ENGINE=InnoDB;

    create table user (
        id bigint not null auto_increment,
        version bigint not null,
        dob datetime not null,
        name varchar(255) not null,
        profession varchar(255) not null,
        primary key (id)
    ) ENGINE=InnoDB;

    create table user_group (
        id bigint not null auto_increment,
        version bigint not null,
        admin_id bigint not null,
        num_of_users integer not null,
        title varchar(255) not null,
        primary key (id)
    ) ENGINE=InnoDB;

    alter table posts 
        add constraint FK_4e2wq23jk4rg7opbb4xxrmfqm 
        foreign key (users_id) 
        references user (id);

    alter table user_group 
        add constraint FK_earft2v509gyadj5ukc2jvd3g 
        foreign key (admin_id) 
        references user (id);
