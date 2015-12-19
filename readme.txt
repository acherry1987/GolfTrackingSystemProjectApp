

Instructions for App

1. This application requires MAMP to be running.

2. Once MAMP is running you will need to create a database.  To do this run database script found in db/GolfSchema.sql.  This will create the database and tables and also pre-load some users and scores.

3. Once the database is loaded, you will see three tabs at the top.  The LOAD USERS tab will of course load the users: showing their names and the golfer handicaps.

4. To add a score you must hit the ADD SCORE tab and then fill in all of the fields.  Note that a golfer can only play once a day on the same course( for this app )

5. After adding a score, it should update your current score.


HANDICAP defined:
The handicapping system is used so that golfers of differing levels of skill can compete together.
1. The handicap only takes into account the most recent 20 rounds of golf.
2. The lowest 10 scores out of the 20 round are used in the calculation.
3. Most golf courses are rated by the golfing associations and are give a "rating" and "slope."
4. For more detail, see https://en.wikipedia.org/wiki/Handicap_(golf)
