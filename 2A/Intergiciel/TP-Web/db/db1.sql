drop table PUBLIC.Personne if exists;
drop table PUBLIC.Adresse if exists;
create table Personne (
    id	      integer generated by default as identity (start with 1, increment by 1) not null,
    nom       varchar(30)      not null,
    prenom    varchar(30)      not null,
    primary key (id)
  );
  
create table Adresse (
    id	      integer generated by default as identity (start with 1, increment by 1) not null,
    rue           varchar(30)      not null,
    ville         varchar(30)      not null,
    personneid    integer,
    primary key (id)
  );

commit;
