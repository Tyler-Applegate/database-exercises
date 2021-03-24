## SQL Exercises 2021-03-24


Question 3
    ## a: How many rows are in the 'albums' table?
    - use albums_db;
    - select * 
      from albums;
        - 31 rows

    ## b: How many unique artist names are in the 'albums' table?
    - select distinct artist
    - from albums
        - 23 unique artists

    ## c: What is the primary key for the 'albums' table?
    - show create table albums
        -  PRIMARY KEY (`id`)
    ## d: What is the oldest release date for any albums in the albums table? What is the most recent release date?
    - select release_date 
    - from albums;
        - oldest 1967
        - newest 2011
            - Used the built in sort feature on MySQLPro

Question 4:
    ## a: The name of all albums by Pink Floyd
    - select * 
    - from albums
    - where artist = 'Pink Floyd';
        - "The Dark Side of the Moon"
        - "The Wall"

    ## b: The year Sgt. Peppers Lonely Hearts Club Band was released    
    - select release_date
    - from albums
    - where name = "Sgt. Pepper's Lonely Hearts Club Band";
        - ans 1967

    ## c: The genre for the album Nevermind
    - select genre
    - from albums
    - where name = 'Nevermind';
        - ans Grunge, Alternative rock

    ## d: Which albums were released in the 1990s
    - select name
    - from albums
    - where release_date between 1990 and 1999;
        - The Bodyguard
        - Jagged Little Pill
        - Come On Over
        - Falling into You
        - Lets Talk About Love
        - Dangerous
        - The Immaculate Collection
        - Titanic: Music from the Motion Picture
        - Metallica
        - Nevermind
        - Supernatural
    
    ## e: Which albums had less than 20 million certified sales
        - select name
        - from albums
        - where sales < 20.0;
            -Grease: The Original Soundtrack from the Motion Picture
            -Bad
            -Sgt. Peppers Lonely Hearts Club Band
            -Dirty Dancing
            -Lets Talk About Love
            -Dangerous
            -The Immaculate Collection
            -Abbey Road
            -Born in the U.S.A.
            -Brothers in Arms
            -Titanic: Music from the Motion Picture
            -Nevermind
            -The Wall

    ## f: All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
        - select name
        - from albums
        - where genre = "Rock";
            - Sgt. Peppers Lonely Hearts Club Band
            - 1
            - Abbey Road
            - Born in the U.S.A.
            - Supernatural

            - This will not include "Hard rock" or "Progressive rock" because in this table, they are distinct genres, not sub-genres of "Rock".