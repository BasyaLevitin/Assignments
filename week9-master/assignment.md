This assignment will help you practice data modelling with "many to many" relationships.  Working in small groups of two or three people is encouraged!

### This assignment assumes you have some experience with:
- object-oriented programming
- writing SQL queries
- 1 to many relationships

## Learning Goals:
- designing classes for a variety of app concepts
- identifying 1 to many relationships between those classes
- identifying many to many relationships between those classes
- designing database schemas to store instances of those classes and the relationships between them
- placing join tables
- placing foreign keys

## Step by Step Example: Many-to-Many

### Solution 1: Direct Many-to-Many (no `Bookmark` class)
This example refers to an app that allows users to bookmark articles.

#### Step 1
![user_article.png](https://github.com/bitmakerlabs/intro-data-modelling/raw/master/user_article.png)

#### Step 2
Each user bookmarks many different articles.

Each article is bookmarked by many different users.

Therefore there is a many-to-many relationship between them.

#### Step 3
We need to add a join table to record this many-to-many relationship.

![articles_users.png](https://github.com/bitmakerlabs/intro-data-modelling/raw/master/articles_users.png)

Each row in the join table will represent an individual connection between `articles` and `users`. To accomplish that we need foreign keys for both sides of the relationship: `article_id` and `user_id`. In a case like this where we have a join table that only has foreign keys, we don't need a class since there's no data specific to this join that we're tracking. Keep reading and you'll see the alternative in Solution 2.

### Solution 2: Many-to-Many Through a 3rd Class
We might decide that we want to know when a user bookmarked an article.  This is best solved by adding another column to the join table that we were going to create in the previous solution, thereby making it into a third `Bookmark` class that sits between `User` and `Article`.  `Bookmark` is still a join table between `User` and `Article`, but because it has columns other than foreign keys, it also gets its own class.

#### Step 1
*foreign keys and primary keys are excluded for consistency, but will be added in step 3*

![bookmark.png](https://github.com/bitmakerlabs/intro-data-modelling/raw/master/boomark.png)

#### Step 2
Each user has many bookmarks.

Each bookmark was made by a single user.

Therefore there is a 1-to-many relationship between `Bookmark` and `User`.

---
Each article is bookmarked many times.

Each bookmark refers to one article.

Therefore there is a 1-to-many relationship between `Bookmark` and `Article`.

---
Each user saves many articles (by bookmarking them).

Each article is saved by many different users (through being bookmarked by them).

**Therefore there is a many-to-many relationship between `User` and `Article`, through `Bookmark`.**


#### Step 3
![bookmarks.png](https://github.com/bitmakerlabs/intro-data-modelling/raw/master/bookmarks.png)


### Placing join tables
A join table is a table with two foreign key columns.  It "joins" together the tables/models that those two foreign keys refer to.  

A join table can represent a class itself (as with the `bookmarks` join table), in which case it will have columns other than foreign keys.  Alternatively, a join table can consist of only foreign keys therefore correspond to no class outside of the database (as was the case for the join table between `users` and `articles` in the first solution).

## Part 1

This part focuses on designing database structures to support many-many relationships as well as 1-many relationships.  Your task is to design the database structure for the classes and relationships given below.

Think about what data types to use for each attribute as well as any other tables or columns you need in order to store these relationships.

1. Imagine an app that allows users to keep track of what films they've seen:
![films_viewers](https://github.com/bitmakerlabs/data-modelling-many-many/raw/master/day2_part1_1.png)
<hr>
2 Imagine an app that allows users to keep track of the books they've read

*Ask an instructor to look over your solution before moving on to Part 2 to make sure you're on the right track.*

## Part 2

This part is about identifying many-many and 1-many relationships between classes.  You will be tasked with first designing the relationships between each given set of classes and then designing a database structure to support them (like you did in Part 1).

1.
  * comic
  * issue
  * artist
  * writer

2.
  * instrument
  * song
  * setlist
  * tour date

3.
  * gallery
  * exhibit
  * artwork
  * artist
  * curator

4.
  * music piece
  * sheet music
  * instrument

*Ask an instructor to look over your solution before moving on to Part 3 to make sure you're on the right track.*

## Part 3

In this part you will be given just the concept of an app and you will have to design the classes, relationships, and database structure for it.  You can keep things relatively simple and aim for somewhere around 2-5 classes per app.

1. A food delivery app that allows users to place orders for dishes from restaurants.

2. An app that airlines might use to keep track of the flights they have scheduled and who the passengers and crew are on each flight.

3. A music streaming app that allows artists to post tracks, and for listeners to subscribe to artists.

*Now would be a good time to discuss your solutions with an instructor.*
