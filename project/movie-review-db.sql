/* Movie Review Site DataBase*/


CREATE OR REPLACE TYPE PhoneNumberList AS TABLE OF VARCHAR2(20); -- for multiple phone number
/

/*----------------------------------------------------*/

-- Define an object type for Person */ 
CREATE OR REPLACE TYPE PersonType AS OBJECT (
  first_name VARCHAR2(50),
  last_name VARCHAR2(50),
  birth_date DATE
);


-- User TABLE 01
CREATE TABLE Users (
  userId VARCHAR2(10) NOT NULL,
  user_data PersonType, -- from PersonType
  email VARCHAR2(50),
  userNumber PhoneNumberList, -- from PhoneNumberList
  PRIMARY KEY (userId)
) NESTED TABLE userNumber STORE AS UserPhoneNumber_nested;

/* INSERT INTO User TABLE */
-- demo 01
INSERT INTO Users (userId, user_data, email, userNumber) 
VALUES (
    'U001', 
    PersonType(
		'Abir',
		'Khan',
		TO_DATE('1990-01-15', 'YYYY-MM-DD')
	),
	'ak@gmail.com',
    PhoneNumberList('0175321','0183829')
);

-- demo 02
INSERT INTO Users (userId, user_data, email, userNumber) 
VALUES (
    'U002', 
    PersonType(
		'Fayjul',
		'Nahid',
		TO_DATE('1992-09-07', 'YYYY-MM-DD')
	),
	'fn@gmail.com',
    PhoneNumberList('0162477','0181675')
);

-- demo 03
INSERT INTO Users (userId, user_data, email, userNumber) 
VALUES (
    'U003', 
    PersonType(
		'Adam',
		'Hamid',
		TO_DATE('1990-01-15', 'YYYY-MM-DD')
	),
	'ah@gmail.com',
    PhoneNumberList('0175321','0183829')
);

-- demo 04
INSERT INTO Users (userId, user_data, email, userNumber) 
VALUES (
    'U004', 
    PersonType(
		'Kabir',
		'Khan',
		TO_DATE('1985-05-20', 'YYYY-MM-DD')
	),
	'kk@gmail.com',
    PhoneNumberList()
);



-- Director TABLE 02
CREATE TABLE Directors (
  dirId VARCHAR2(10) NOT NULL,
  dir_data PersonType, -- from PersonType
  email VARCHAR2(50),
  dirNumber PhoneNumberList, -- from PhoneNumberList
  PRIMARY KEY (dirId)
) NESTED TABLE dirNumber STORE AS DirectorPhoneNumber_nested;

/* INSERT INTO Director TABLE */
-- demo 01
INSERT INTO Directors (dirId, dir_data, email, dirNumber) 
VALUES (
    'Dir001', 
    PersonType(
		'Steven',
		'Spielberg',
		TO_DATE('1946-12-18', 'YYYY-MM-DD')
	),
	'stsp@gmail.com',
    PhoneNumberList('0175851')
);

-- demo 02
INSERT INTO Directors (dirId, dir_data, email, dirNumber) 
VALUES (
    'Dir002', 
    PersonType(
		'Jon',
		'Watts',
		TO_DATE('1981-12-18', 'YYYY-MM-DD')
	),
	'jw@gmail.com',
    PhoneNumberList('980986786')
);

-- demo 03
INSERT INTO Directors (dirId, dir_data, email, dirNumber) 
VALUES (
    'Dir003', 
    PersonType(
		'Matt',
		'Reeves',
		TO_DATE('1966-04-27', 'YYYY-MM-DD')
	),
	'mr@gmail.com',
    PhoneNumberList('22334456')
);

-- demo 04
INSERT INTO Directors (dirId, dir_data, email, dirNumber) 
VALUES (
    'Dir004', 
    PersonType(
		'Anthony',
		'Russo',
		TO_DATE('1946-12-18', 'YYYY-MM-DD')
	),
	'ar@gmail.com',
    PhoneNumberList('4567890')
);


-- Actors TABLE 03 
CREATE TABLE Actors (
  actId VARCHAR2(10) NOT NULL,
  act_data PersonType, -- from PersonType
  email VARCHAR2(50),
  actNumber PhoneNumberList, -- from PhoneNumberList
  PRIMARY KEY (actId)
) NESTED TABLE actNumber STORE AS ActorPhoneNumber_nested;

/* INSERT INTO Actor TABLE */
-- demo 01
INSERT INTO Actors (actId, act_data, email) 
VALUES (
    'Act001', 
    PersonType(
		'Tom',
		'Hanks',
		TO_DATE('1956-07-09', 'YYYY-MM-DD')
	),
	'tom@gmail.com'
);

-- demo 02
INSERT INTO Actors (actId, act_data, email) 
VALUES (
    'Act002', 
    PersonType(
		'Tom',
		'Holland',
		TO_DATE('1998-07-09', 'YYYY-MM-DD')
	),
	'holland@gmail.com'
);

-- demo 03
INSERT INTO Actors (actId, act_data, email) 
VALUES (
    'Act003', 
    PersonType(
		'Cillian',
		'Murphy',
		TO_DATE('1976-05-25', 'YYYY-MM-DD')
	),
	'tom@gmail.com'
);

-- demo 04
INSERT INTO Actors (actId, act_data, email) 
VALUES (
    'Act004', 
    PersonType(
		'Christian',
		'Bale',
		TO_DATE('1974-01-30', 'YYYY-MM-DD')
	),
	'bale@gmail.com'
);

-- demo 05
INSERT INTO Actors (actId, act_data, email) 
VALUES (
    'Act005', 
    PersonType(
		'Josh',
		'Brolin',
		TO_DATE('1968-02-12', 'YYYY-MM-DD')
	),
	'jb@gmail.com'
);


/*----------------------------------------------------*/

CREATE OR REPLACE TYPE FounderList AS TABLE OF PersonType; -- for multiple Founder from PersonType
/

-- Define an object type for Production 
CREATE OR REPLACE TYPE ProductionType AS OBJECT (
  company_name VARCHAR2(100),
  founded_year NUMBER,
  founder FounderList -- from FounderList
);

-- Production TABLE 04
CREATE TABLE Production (
  company_id VARCHAR2(10) PRIMARY KEY,
  pro_data ProductionType,  -- from ProductionType
  email VARCHAR2(50),
  compNumber PhoneNumberList -- from PhoneNumberList
) NESTED TABLE pro_data.founder STORE AS founder_nested
  NESTED TABLE compNumber STORE AS CompanyPhoneNumber_nested;

/* INSERT INTO Production TABLE */
-- demo 01
INSERT INTO Production (company_id, pro_data, email, compNumber)
VALUES (
    'Comp001',
    ProductionType(
        'WarnerBros.',
        1923,
        FounderList(
            PersonType(
                'Harry',
                'Warner',
                TO_DATE('1881-12-12', 'YYYY-MM-DD')
            ),
            PersonType(
                'Albert',
                'Warner',
                TO_DATE('1967-11-26', 'YYYY-MM-DD')
            )
        )
    ),
    'wbco@gmail.com',
    PhoneNumberList('0745236')
);

-- demo 02
INSERT INTO Production (company_id, pro_data, email, compNumber)
VALUES (
    'Comp002',
    ProductionType(
        'Marvel Studios.',
        2003,
        FounderList(
            PersonType(
                'Chairman',
                'David Maisel',
                TO_DATE('2003-02-24', 'YYYY-MM-DD')
            )
        )
    ),
    'marvel@gmail.com',
    PhoneNumberList('998887878')
);

-- demo 03
INSERT INTO Production (company_id, pro_data, email, compNumber)
VALUES (
    'Comp003',
    ProductionType(
        'Red Chillies Entertainment',
        2002,
        FounderList(
            PersonType(
                'Shah Rukh',
                'Khan',
                TO_DATE('1965-03-12', 'YYYY-MM-DD')
            ),
            PersonType(
                'Gauri',
                'Khan',
                TO_DATE('1970-08-08', 'YYYY-MM-DD')
            )
        )
    ),
    'rce@gmail.com',
    PhoneNumberList('99887766')
);

-- demo 04
INSERT INTO Production (company_id, pro_data, email, compNumber)
VALUES (
    'Comp004',
    ProductionType(
        'Paramount Pictures',
        1912,
        FounderList(
            PersonType(
                ' William Wadsworth',
                'Hodkinson',
                TO_DATE('1881-04-17', 'YYYY-MM-DD')
            ),
            PersonType(
                'Adolph',
                'Zukor',
                TO_DATE('1973-01-06', 'YYYY-MM-DD')
            ),
            PersonType(
                'Jesse',
                'L. Lasky',
                TO_DATE('1980-06-17', 'YYYY-MM-DD')
            )
        )
    ),
    'pp@gmail.com',
    PhoneNumberList('0745236')
);



/*-----------------------------------------*/
CREATE OR REPLACE TYPE ProductionList AS TABLE OF VARCHAR2(100); -- for multiple production
/
CREATE OR REPLACE TYPE GenreList AS TABLE OF VARCHAR2(20); -- for multiple movie genre
/

-- Define an object type for Movie 
CREATE OR REPLACE TYPE MovieType AS OBJECT (
  title VARCHAR2(100),
  release_year NUMBER,
  genre GenreList, -- from genre
  production ProductionList,  -- from production
  description CLOB
);

-- Movie TABLE 05
CREATE TABLE Movies (
  movie_id VARCHAR2(10),
  movie_data MovieType, -- from MovieType
  dirId VARCHAR2(10),
  PRIMARY KEY (movie_id),
  FOREIGN KEY (dirId) REFERENCES Directors(dirId)
) NESTED TABLE movie_data.genre STORE AS Genre_nested
  NESTED TABLE movie_data.production STORE AS Production_nested;

/* INSERT INTO Movies TABLE */
-- demo 01
INSERT INTO Movies (movie_id, movie_data, dirId)
VALUES (
    'Mov001',
    MovieType(
        'Hero',
        2001,
        GenreList('Horror', 'Action'),
        ProductionList('WarnerBros.'),
        'In a world where superheroes are commonplace, one man stands out from the rest: The Hero. He is not the strongest or the fastest, but he is the most determined. He is always willing to put his life on the line to save the day, no matter how dangerous the threat. The Hero journey begins when he is called upon to stop a powerful villain from destroying the world. He must use all of his skills and abilities to defeat the villain, but he will also need the help of his friends and family. Along the way, The Hero will face many challenges, but he will never give up. He will always fight for what is right, even when it is difficult. In the end, The Hero will emerge victorious, and the world will be safe once again.'
    ),
    'Dir001'
);

-- demo 02
INSERT INTO Movies (movie_id, movie_data, dirId)
VALUES (
    'Mov002',
    MovieType(
        'Avengers: Endgame',
        2019,
        GenreList('Supernatural', 'Action','Superhero','Superpower'),
        ProductionList('Marvel Studios'),
        'Avengers: Endgame is a 2019 American superhero film based on the Marvel Comics superhero team the Avengers. Produced by Marvel Studios and distributed by Walt Disney Studios Motion Pictures, it is the direct sequel to Avengers: Infinity War (2018) and the 22nd film in the Marvel Cinematic Universe (MCU). Directed by Anthony and Joe Russo and written by Christopher Markus and Stephen McFeely, the film features an ensemble cast including Robert Downey Jr., Chris Evans, Mark Ruffalo, Chris Hemsworth, Scarlett Johansson, Jeremy Renner, Don Cheadle, Paul Rudd, Brie Larson, Karen Gillan, Danai Gurira, Benedict Wong, Jon Favreau, Bradley Cooper, Gwyneth Paltrow, and Josh Brolin. In the film, the surviving members of the Avengers and their allies attempt to reverse Thanos actions in Infinity War.'
    ),
    'Dir002'
);

-- demo 03
INSERT INTO Movies (movie_id, movie_data, dirId)
VALUES (
    'Mov003',
    MovieType(
        'Batman Begins',
        2005,
        GenreList('Supernatural', 'Action','Superhero'),
        ProductionList('WarnerBros.'),
        'Batman Begins is a 2005 superhero film directed by Christopher Nolan and written by Nolan and David S. Goyer. Based on the DC Comics character Batman, it stars Christian Bale as Bruce Wayne / Batman, with Michael Caine, Liam Neeson, Katie Holmes, Gary Oldman, Cillian Murphy, Tom Wilkinson, Rutger Hauer, Ken Watanabe, and Morgan Freeman in supporting roles. The film reboots the Batman film series, telling the origin story of Bruce Wayne from the death of his parents to his journey to become Batman and his fight to stop Ras al Ghul and the Scarecrow from plunging Gotham City into chaos.'
    ),
    'Dir003'
);

-- demo 04
INSERT INTO Movies (movie_id, movie_data, dirId)
VALUES (
    'Mov004',
    MovieType(
        'Titanic',
        1997,
        GenreList('Drama', 'Romance'),
        ProductionList('Paramount Pictures'),
        'James Camerons Titanic is an epic, action-packed romance set against the ill-fated maiden voyage of the R.M.S. Titanic; the pride and joy of the White Star Line and, at the time, the largest moving object ever built. She was the most luxurious liner of her era  the ship of dreams which ultimately carried over 1,500 people to their death in the ice cold waters of the North Atlantic in the early hours of April 15, 1912.'
    ),
    'Dir004'
);

-- demo 05
INSERT INTO Movies (movie_id, movie_data, dirId)
VALUES (
    'Mov005',
    MovieType(
        'Raees',
        2017,
        GenreList('Action', 'Drama'),
        ProductionList('Red Chillies Entertainment'),
        'In a world where superheroes are commonplace, one man stands out from the rest: The Hero. He is not the strongest or the fastest, but he is the most determined. He is always willing to put his life on the line to save the day, no matter how dangerous the threat. The Hero journey begins when he is called upon to stop a powerful villain from destroying the world. He must use all of his skills and abilities to defeat the villain, but he will also need the help of his friends and family. Along the way, The Hero will face many challenges, but he will never give up. He will always fight for what is right, even when it is difficult. In the end, The Hero will emerge victorious, and the world will be safe once again.'
    ),
    'Dir002'
);



/*-----------------------------------------*/
CREATE OR REPLACE TYPE RoleList AS TABLE OF VARCHAR2(50); -- for multiple movie role
/

-- Cast TABLE 06
CREATE TABLE MovieActors (
  movie_id VARCHAR2(10),
  actId VARCHAR2(10),
  role RoleList, -- from RoleList
  PRIMARY KEY (movie_id, actId),
  FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
  FOREIGN KEY (actId) REFERENCES Actors(actId)
) NESTED TABLE role STORE AS Role_nested;

/* INSERT INTO Actor TABLE */
-- demo 01
INSERT INTO MovieActors (movie_id, actId, role)
VALUES (
    'Mov001',
    'Act001',
    RoleList('GrandFather','GrandChild')
);

-- demo 02
INSERT INTO MovieActors (movie_id, actId, role)
VALUES (
    'Mov002',
    'Act002',
    RoleList('Hero','Villain')
);

-- demo 03
INSERT INTO MovieActors (movie_id, actId, role)
VALUES (
    'Mov003',
    'Act003',
    RoleList('Sister')
);

-- demo 04
INSERT INTO MovieActors (movie_id, actId, role)
VALUES (
    'Mov003',
    'Act004',
    RoleList('Brother')
);

-- demo 05
INSERT INTO MovieActors (movie_id, actId, role)
VALUES (
    'Mov004',
    'Act005',
    RoleList('Heroine')
);

-- demo 06
INSERT INTO MovieActors (movie_id, actId, role)
VALUES (
    'Mov005',
    'Act005',
    RoleList('Don')
);


/*-----------------------------------------*/
-- Define an object type for Comments  
CREATE OR REPLACE TYPE CommentsType AS OBJECT (
   comment_text CLOB,
   created_at TIMESTAMP
);

-- Reviews TABLE 07
CREATE TABLE Reviews (
  review_id VARCHAR2(10)  PRIMARY KEY,
  movie_id VARCHAR2(10),
  rating NUMBER check (rating >= 0 and rating <= 5),
  comments CommentsType,
  FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

/* INSERT INTO Reviews TABLE */
-- demo 01
INSERT INTO Reviews (review_id, movie_id, rating, comments)
VALUES (
    'Rev001',
    'Mov001',
    4,
    CommentsType(
        'This is wonderful movie',
         SYSTIMESTAMP -- Use SYSTIMESTAMP for created_at
    )
);

-- demo 02
INSERT INTO Reviews (review_id, movie_id, rating, comments)
VALUES (
    'Rev002',
    'Mov002',
    5,
    CommentsType(
        'Im Blown Away',
         SYSTIMESTAMP -- Use SYSTIMESTAMP for created_at
    )
);

-- demo 03
INSERT INTO Reviews (review_id, movie_id, rating, comments)
VALUES (
    'Rev003',
    'Mov002',
    5,
    CommentsType(
        'This best one in movie industry',
         SYSTIMESTAMP -- Use SYSTIMESTAMP for created_at
    )
);

-- demo 04
INSERT INTO Reviews (review_id, movie_id, rating, comments)
VALUES (
    'Rev004',
    'Mov003',
    4,
    CommentsType(
        'Very much satisfied',
         SYSTIMESTAMP -- Use SYSTIMESTAMP for created_at
    )
);

-- demo 05
INSERT INTO Reviews (review_id, movie_id, rating, comments)
VALUES (
    'Rev005',
    'Mov004',
    5,
    CommentsType(
        'Wonderful',
         SYSTIMESTAMP -- Use SYSTIMESTAMP for created_at
    )
);


/*-----------------------------------------*/
-- Define an object type for Awards
CREATE OR REPLACE TYPE AwardType AS OBJECT (
  award_name VARCHAR2(20),
  award_category VARCHAR2(40),
  award_year NUMBER
); 

CREATE OR REPLACE TYPE AwardList AS TABLE OF AwardType; -- for multiple award from AwardType
/

-- Award TABLE 08
CREATE TABLE Awards (
  awa_id VARCHAR2(10),
  movie_id VARCHAR2(10),
  award AwardList, -- from AwardList
  FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
) NESTED TABLE award STORE AS Award_nested;

/* INSERT INTO Awards TABLE */
-- demo 01
INSERT INTO Awards (awa_id,movie_id, award)
VALUES (
    'Awa001',
    'Mov001',
    AwardList(
        AwardType(
            'Grammy Awards',
            'BestSong',
            2002
        ),
        AwardType(
            'Webby Awards',
            'BestArt',
            2002
        )
    )
);

-- demo 02
INSERT INTO Awards (awa_id,movie_id, award)
VALUES (
    'Awa002',
    'Mov002',
    AwardList(
        AwardType(
            'Meril Prothom Alo',
            'Best Actor',
            2013
        ),
        AwardType(
            'Meril Prothom Alo',
            'Best Debut Actor Male',
            2010
        )
    )
);

-- demo 03
INSERT INTO Awards (awa_id,movie_id, award)
VALUES (
    'Awa003',
    'Mov003',
    AwardList(
        AwardType(
            'ABC Award',
            'Best Title',
            2013
        ),
        AwardType(
            'ABC Award',
            'Best Song',
            2019
        )
    )
);

-- demo 04
INSERT INTO Awards (awa_id,movie_id, award)
VALUES (
    'Awa004',
    'Mov004',
    AwardList(
        AwardType(
            'Z Cinema Award',
            'BestSong',
            2017
        ),
        AwardType(
            'Z Cinema Award',
            'Best Debut Female',
            2013
        )
    )
);

-- demo 05
INSERT INTO Awards (awa_id,movie_id, award)
VALUES (
    'Awa005',
    'Mov005',
    AwardList(
        AwardType(
            'Filmfare Awards',
            'Best Song',
            2019
        ),
        AwardType(
            'Filmfare Awards',
            'Best Dance',
            2019
        )
    )
);



/* SELECT query */

-- SELECT QUERY for Users TABLE
DECLARE
    u_id Users.userId%type;
    u_first_name Users.user_data.first_name%type;
    u_last_name Users.user_data.last_name%type;
    u_date Users.user_data.birth_date%type;
    u_email Users.email%type;
    u_phone VARCHAR2(20);

    CURSOR user_type IS

    SELECT 
        ur.userId AS ID,
        ur.user_data.first_name AS FirstName,
        ur.user_data.last_name AS LastName,
        ur.user_data.birth_date AS Date_of_Birth,
        ur.email AS Email,
        t1.COLUMN_VALUE AS PhoneNumber
    FROM
        Users ur
    LEFT OUTER JOIN
        TABLE(ur.userNumber) t1 ON 1=1;

BEGIN
    OPEN user_type;
    LOOP
        FETCH user_type INTO u_id, u_first_name, u_last_name, u_date, u_email, u_phone;
        EXIT WHEN user_type%notfound;
            DBMS_OUTPUT.PUT_LINE('User ID: ' || u_id);
            DBMS_OUTPUT.PUT_LINE('First Name:  ' || u_first_name);
            DBMS_OUTPUT.PUT_LINE('Last Name: ' || u_last_name);
            DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || u_date);
            DBMS_OUTPUT.PUT_LINE('Email: ' || u_email);
            DBMS_OUTPUT.PUT_LINE('Phone Number: ' || u_phone);
            DBMS_OUTPUT.PUT_LINE('');
        END LOOP;
    CLOSE user_type;
END;
/



-- SELECT QUERY for Directors TABLE
DECLARE
    d_id Directors.dirId%type;
    d_first_name Directors.dir_data.first_name%type;
    d_last_name Directors.dir_data.last_name%type;
    d_date Directors.dir_data.birth_date%type;
    d_email Directors.email%type;
    d_phone VARCHAR2(20);

    CURSOR Directors_type IS

    SELECT 
        dr.dirId AS ID,
        dr.dir_data.first_name AS FirstName,
        dr.dir_data.last_name  AS LastName,
        dr.dir_data.birth_date AS Date_of_Birth,
        dr.email AS Email,
        t1.COLUMN_VALUE AS PhoneNumber
    FROM 
        Directors dr
    LEFT OUTER JOIN
        TABLE(dr.dirNumber) t1 ON 1=1;

BEGIN
    OPEN Directors_type;
    LOOP
        FETCH Directors_type INTO d_id, d_first_name, d_last_name, d_date, d_email, d_phone;
        EXIT WHEN Directors_type%notfound;
            DBMS_OUTPUT.PUT_LINE('User ID: ' || d_id);
            DBMS_OUTPUT.PUT_LINE('First Name:  ' || d_first_name);
            DBMS_OUTPUT.PUT_LINE('Last Name: ' || d_last_name);
            DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || d_date);
            DBMS_OUTPUT.PUT_LINE('Email: ' || d_email);
            DBMS_OUTPUT.PUT_LINE('Phone Number: ' || d_phone);
            DBMS_OUTPUT.PUT_LINE('');
        END LOOP;
    CLOSE Directors_type;
END;
/



-- SELECT QUERY for Actors TABLE
DECLARE
    a_id Actors.actId%type;
    a_first_name Actors.act_data.first_name%type;
    a_last_name Actors.act_data.last_name%type;
    a_date Actors.act_data.birth_date%type;
    a_email Actors.email%type;
    a_phone VARCHAR2(20);

    CURSOR Actor_type IS

    SELECT
        ac.actId AS ID,
        ac.act_data.first_name AS FirstName,
        ac.act_data.last_name AS LastName,
        ac.act_data.birth_date AS Date_of_Birth,
        ac.email AS Email,
        t1.COLUMN_VALUE AS PhoneNumber
    FROM
        Actors ac
    LEFT OUTER JOIN
        TABLE(ac.actNumber) t1 ON 1=1;

BEGIN
    OPEN Actor_type;
    LOOP
        FETCH Actor_type INTO a_id, a_first_name, a_last_name, a_date, a_email, a_phone;
        EXIT WHEN Actor_type%notfound;
            DBMS_OUTPUT.PUT_LINE('User ID: ' || a_id);
            DBMS_OUTPUT.PUT_LINE('First Name:  ' || a_first_name);
            DBMS_OUTPUT.PUT_LINE('Last Name: ' || a_last_name);
            DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || a_date);
            DBMS_OUTPUT.PUT_LINE('Email: ' || a_email);
            DBMS_OUTPUT.PUT_LINE('Phone Number: ' || a_phone);
            DBMS_OUTPUT.PUT_LINE('');
        END LOOP;
    CLOSE Actor_type;
END;
/



-- SELECT QUERY for Production TABLE
DECLARE
    p_id Production.company_id%type;
    p_name Production.pro_data.company_name%type;
    p_year Production.pro_data.company_name%type;
    p_f_first_name VARCHAR2(50);
    p_f_last_name VARCHAR2(50);
    p_f_birth_date DATE;
    p_email Production.email%type;
    p_phone VARCHAR2(20);

    CURSOR Production_type IS

    SELECT
        pr.company_id AS ID,
        pr.pro_data.company_name AS Company_name,
        pr.pro_data.founded_year AS Year,
        t1.first_name AS Founder_FirstName,
        t1.last_name  AS Founder_LastNameName,
        t1.birth_date AS Founder_Birth,
        pr.email  AS Company_mail,
        t2.COLUMN_VALUE AS PhoneNumber
    FROM
        Production pr
    LEFT OUTER JOIN
        TABLE(pr.pro_data.founder) t1 ON 1=1
    LEFT OUTER JOIN
        TABLE(pr.compNumber) t2 ON 1=1;

BEGIN
    OPEN Production_type;
    LOOP
        FETCH Production_type INTO p_id, p_name, p_year, p_f_first_name, p_f_last_name, p_f_birth_date, p_email, p_phone;
        EXIT WHEN Production_type%notfound;
            DBMS_OUTPUT.PUT_LINE('Company ID: ' || p_id);
            DBMS_OUTPUT.PUT_LINE('Company Name:  ' || p_year);
            DBMS_OUTPUT.PUT_LINE('Founded: ' || p_year);
            DBMS_OUTPUT.PUT_LINE('Company Email: ' || p_email);
            DBMS_OUTPUT.PUT_LINE('Company Phone Number: ' || p_phone);
            DBMS_OUTPUT.PUT_LINE('--Founder--');
            DBMS_OUTPUT.PUT_LINE('Founder Name: ' || p_f_first_name || ' '|| p_f_last_name);
            DBMS_OUTPUT.PUT_LINE('Founder Birth: ' || p_f_birth_date);
            DBMS_OUTPUT.PUT_LINE('');
        END LOOP;
    CLOSE Production_type;
END;
/



-- SELECT QUERY for Movie TABLE
DECLARE
    m_id Movies.movie_id%type;
    m_name Movies.movie_data.title%type;
    m_year Movies.movie_data.release_year%type;
    m_p_name VARCHAR2(50);
    m_g_name VARCHAR2(50);

    CURSOR Movie_type IS

    SELECT
        mo.movie_id AS ID,
        mo.movie_data.title AS Title,
        mo.movie_data.release_year AS Year,
        t1.COLUMN_VALUE AS Genre,
        t2.COLUMN_VALUE AS Production
    FROM
        Movies mo
    LEFT OUTER JOIN
        TABLE(mo.movie_data.genre) t1 ON 1=1
    LEFT OUTER JOIN
        TABLE(mo.movie_data.production) t2 ON 1=1;

BEGIN
    OPEN Movie_type;
    LOOP
        FETCH Movie_type INTO m_id, m_name, m_year, m_p_name, m_g_name;
        EXIT WHEN Movie_type%notfound;
            DBMS_OUTPUT.PUT_LINE('Movie ID: ' || m_id);
            DBMS_OUTPUT.PUT_LINE('Movie Name:  ' || m_name);
            DBMS_OUTPUT.PUT_LINE('Release Year: ' || m_year);
            DBMS_OUTPUT.PUT_LINE('Production name: ' || m_p_name);
            DBMS_OUTPUT.PUT_LINE('Genre: ' || m_g_name);
            DBMS_OUTPUT.PUT_LINE('');
        END LOOP;
    CLOSE Movie_type;
END;
/



-- SELECT QUERY for Movie  Cast
DECLARE
    m_id MovieActors.movie_id%type;
    actId MovieActors.actId%type;
    a_first_name VARCHAR2(50);
    a_last_name VARCHAR2(50);
    m_name VARCHAR2(100);
    m_role VARCHAR2(50);

    CURSOR MovieCast_type IS

    SELECT
        mo.movie_id AS ID,
        mo.movie_data.title AS Title,
        ac.act_data.first_name AS Actor_First_Name,
        ac.act_data.last_name AS Actor_Last_Name,
        t1.COLUMN_VALUE AS Role
    FROM
        MovieActors ma
    INNER JOIN
        Actors ac ON ma.actId=ac.actId
    INNER JOIN
        Movies mo ON mo.movie_id=mo.movie_id
    LEFT OUTER JOIN
        TABLE(ma.role) t1 ON 1=1;

BEGIN
    OPEN MovieCast_type;
    LOOP
        FETCH MovieCast_type INTO m_id, m_name, a_first_name, a_last_name, m_role;
        EXIT WHEN MovieCast_type%notfound;
            DBMS_OUTPUT.PUT_LINE('Movie Name:  ' || m_name);
            DBMS_OUTPUT.PUT_LINE('Actor Name: ' || a_first_name || ' ' ||a_first_name);
            DBMS_OUTPUT.PUT_LINE('Role: ' || m_role);
            DBMS_OUTPUT.PUT_LINE('');
        END LOOP;
    CLOSE MovieCast_type;
END;
/



-- SELECT QUERY for Movie  Reviews
DECLARE
    r_id Reviews.review_id%type;
    m_name VARCHAR2(100);
    r_rating Reviews.rating%type;
    r_comment Reviews.comments.comment_text%type;
    r_com_time Reviews.comments.created_at%type;

    CURSOR Review_type IS

    SELECT
        re.review_id AS ID,
        mo.movie_data.title AS Title,
        re.rating AS Rating,
        re.comments.comment_text AS Comments,
        re.comments.created_at AS Comment_Time
    FROM
        Reviews re
    INNER JOIN
        Movies mo ON re.movie_id=mo.movie_id;

BEGIN
    OPEN Review_type;
    LOOP
        FETCH Review_type INTO r_id, m_name, r_rating, r_comment, r_com_time;
        EXIT WHEN Review_type%notfound;
            DBMS_OUTPUT.PUT_LINE('Movie Name:  ' || m_name);
            DBMS_OUTPUT.PUT_LINE('Rating: ' || r_rating);
            DBMS_OUTPUT.PUT_LINE('Comment: ' || r_comment);
            DBMS_OUTPUT.PUT_LINE('Time: ' || r_com_time);
            DBMS_OUTPUT.PUT_LINE('');
        END LOOP;
    CLOSE Review_type;
END;
/



-- SELECT QUERY for Movie Awards
DECLARE
    a_id Reviews.review_id%type;
    a_name VARCHAR2(20);
    a_cat VARCHAR2(40);
    a_year NUMBER;
    m_name VARCHAR2(100);

    CURSOR Award_type IS

    SELECT
        ar.awa_id AS ID,
        mo.movie_data.title AS Title,
        t1.award_name AS Award_name,
        t1.award_category AS Award_category,
        t1.award_year AS Year
    FROM
        Awards ar
    INNER JOIN
        Movies mo ON ar.movie_id=mo.movie_id
    LEFT OUTER JOIN
        TABLE(ar.award) t1 ON 1=1;
        
BEGIN
    OPEN Award_type;
    LOOP
        FETCH Award_type INTO a_id, m_name, a_name, a_cat, a_year;
        EXIT WHEN Award_type%notfound;
            DBMS_OUTPUT.PUT_LINE('Movie Name:  ' || m_name);
            DBMS_OUTPUT.PUT_LINE('Award Name: ' || a_name);
            DBMS_OUTPUT.PUT_LINE('Award Category: ' || a_cat);
            DBMS_OUTPUT.PUT_LINE('Year: ' || a_year);
            DBMS_OUTPUT.PUT_LINE('');
        END LOOP;
    CLOSE Award_type;
END;
/


commit;
