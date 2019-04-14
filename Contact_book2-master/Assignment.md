In this assignment we'll learn how to save our data in a database, so that when we restart our CRM, we don't lose all our data.

## What You Will Learn
We'll be covering the following concepts:

* What are databases and tables?
* What is SQL?
* What is an ORM?
* How to create, read, update, and save data to a database

## Assignment
You'll be continuing to work on your CRM program from earlier in the course.

Continue working on the same repository you used in the last part of the CRM. You'll also be adding to it in future assignments.

### Intro to Databases, SQL, and ORMs

Today, we're going to work with a database by using SQL and an ORM to efficiently create, read, update and delete data. Let's take a little time to go over what each of those abbreviations and concepts mean.

A database is an organized collection of data. Think of a database as an Excel file. A database has a number of tables (spreadsheets) with columns and rows to organize data (information) in a logical manner.

![](http://www.functionx.com/excel/images/excel1.gif)

A database management system (DBMS) is the software that allows us to interact with the database, kind of the way that the Excel program allows us to interact with Excel files. There are many different database management systems and we'll see several over the course of the program. We'll start with a simple DBMS called SQLite.

There are many different variations on databases but the most widely used type is called a **relational database**. Relational databases organize data into tables, each table being made up of columns and rows.

You can think of the structure of the database like objects in Ruby. Every table in a database represents one type of object (like a Ruby class), the columns in a table represent the attributes of that object and each row represents an individual instance of an object.

SQL stands for Structured Query Language. It is a standard language for interacting with relational databases. It's used to define the structure of the database (i.e. create tables and define the columns on a table) as well as to retrieve data stored in the database (i.e. fetch all of the orders from the last month).

All great programmers are lazy in the best way possible: they want to get more results with less effort. This is where ORM (Object-Relational Mapping) becomes important. An ORM tool, in this case **ActiveRecord**, allows us to represent our SQLite database tables with Ruby objects, or in layman's terms, write Ruby code that gets translated into SQL to talk to Databases.

ActiveRecord will greatly simplify the process of setting up all of the tables and working with them.

In the second part of this assignment, you'll go through various SQL-related exercises by connecting to your SQLite database on the command line.

## Installation

#### SQLite

Before you start, you must ensure that you have SQLite installed. If you're able to run this command, you're good to go

```bash
$ sqlite3
```

You should see something like this:

```bash
SQLite version 3.8.10.2 2015-05-20 18:17:19
Enter ".help" for usage hints.
Connected to a transient in-memory database.
Use ".open FILENAME" to reopen on a persistent database.
sqlite>
```

Try `CTRL+D` to quit.

If this command doesn't work, you'll need to install sqlite.

* On OS X

 ```bash
$ brew install sqlite3
```

* On Linux

 ```bash
$ sudo apt-get install sqlite3 libsqlite3-dev
```

#### Installing ActiveRecord

Next, you'll need to install ActiveRecord. As mentioned above, ActiveRecord is an ORM that allows you to interface with your database with the help of Ruby objects. We don't need to worry too much about what's going on under the hood for now, just that it's automatically generating SQL statements and queries for us.

ActiveRecord is actually a part of the Rails framework, and we'll be learning much more about in the coming weeks.

In this assignment, we'll also use another gem called [**MiniRecord**](https://github.com/DAddYE/mini_record), which simplifies some of the chores in dealing with ActiveRecord.

Both of these can be installed with:

```bash
$ gem install mini_record
$ gem install activerecord -v '4.2.7'
```

ActiveRecord is database "agnostic", meaning this ORM works with a variety of different databases, such as SQLite, PostgreSQL, MySQL, etc. We'll need to install an extra gem to specify that we're working with SQLite.

```bash
$ gem install sqlite3
```

Next step is to require and initialize a connection to our database. To do this, add the following lines to the top of your `contact.rb`

```ruby
gem 'activerecord', '=4.2.10'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact
...
end
```

Don't forget to commit your changes!

#### ActiveRecord CheatSheet
The ActiveRecord docs are notoriously hard to read, so we've compiled a list of methods that you should be aware of:

##### ActiveRecord Class Methods
* `.all`
* `.count`
* `.find`
  * accepts an id as an argument
* `.find_by`
  * accepts a key-value pair as an argument (attribute and value)
* `.new`
  * accepts a hash as an argument (attributes as keys and values as...values)
* `.create`
  * accepts a hash as an argument (same way `new` does)

##### ActiveRecord Instance Methods
* `.delete`
* `.save`
* `.update` AKA `.update_attributes`
  * accepts a hash as an argument (same way `new` and `create` do)

Does this list of methods seem partially familiar?  That's because we purposefully asked you to follow this pattern of methods when writing your original `Contact` class.

### 1. Moving to ActiveRecord

With our database now setup, we now need to modify our `Contact` class and get it working with a database.

#### Transforming the Contact class into an ActiveRecord Model

Next we're going to transform our Contact class into an ActiveRecord model by *inheriting* from `ActiveRecord::Base`.

As soon we inherit from this Base class, we'll have access to all the special ActiveRecord methods that allow us to interface with the database.

Open up `contact.rb` and do the following:

0. Delete all the reader and writer methods. ActiveRecord will automatically provide those methods for us without us having to define them. 
0. Delete all the class variables (`@@contacts`, `@@id`). The database is going to take care of storing the contacts and assigning IDs to new contacts when we save them.
0. Delete all the methods *except* for the `full_name` method. ActiveRecord is going to provide us with all of the methods for interacting with the database in the next step.
0. Finally, the `Contact` class should inherit from `ActiveRecord::Base`.

After all those steps, your `contact.rb` file should now look like this:

```ruby
gem 'activerecord', '=4.2.10'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord::Base

  def full_name
    "#{ first_name } #{ last_name }"
  end

end
```

As soon as we inherit from `ActiveRecord::Base`, ActiveRecord will also start to consider this class to represent a single database table. That means that every time we create a new Contact record, it will automatically be inserted into the `contacts` database table.

However, it still doesn't know which columns belong to this `contacts` table, so we'll need to define properties for each column we want. This is where MiniRecord will help us along.

The columns we want to store are identical to the instance variables that we defined inside our `Contact` class, so this makes things easy.

Open up `contact.rb` and add some fields to the table.

```ruby
...
class Contact < ActiveRecord::Base

  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text

  def full_name
    "#{ first_name } #{ last_name }"
  end

end
```

Note that this automatically sets up reader and writer methods for each of these fields, which is why we deleted them from the class a few minutes ago.

When you define a field, you need to provide the name of the column as a symbol, and then the data type the field will store. `:string` should be straightforward, but `:text` maybe not so much. Basically you can store more characters in a `:text` field than a `:string` field, which is limited to 256 characters. (You might want to write an extensive file on each contact!)

One thing you might notice is that we do not have to define a field for `:id` anymore. ActiveRecord will take care of creating an `:id` field that automatically increments!

Once the database fields are defined, we must add the following statement `Contact.auto_upgrade!` after the end of the class definition. This one takes care of effecting any changes to the underlying structure of the tables or columns.


All in all, this is what your setup is going to look like inside `contact.rb`. An entire database for a few lines of code? Not bad at all!

```ruby
gem 'activerecord', '=4.2.10'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord::Base

  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text

  def full_name
    "#{ first_name } #{ last_name }"
  end

end

Contact.auto_upgrade!
```

Normally we would ask you to commit here, but before you do that, just one more thing to take care of...

#### Ensuring the database connection is closed

By default, SQLite allows 5 concurrent connections. Unfortunately, MiniRecord will open connections, but it won't close them automatically. What this means is that every 6th time you restart your CRM, there won't be any connections left and you'll get a mysterious `Timeout` error.

To fix this, add the following snippet of code to the bottom of your `crm.rb` file:

```ruby
at_exit do
  ActiveRecord::Base.connection.close
end
```

This will ensure that as long as your program shuts down gracefully, it'll close the connection to the database.

#### Using .gitignore to avoid committing the database

If you're able to start your CRM, you'll see that ActiveRecord has automatically created a new file called `crm.sqlite3` in your project folder. There are two things to know about this file:

* `crm.sqlite3` is your actual database. If you look inside, it's just a bunch of numbers, and that's because the data has been encoded as bytes.

* You should tell git to ignore this file. (Databases and other non-text files should never be inside of git repositories!)

Create a `.gitignore` file and add the following lines:

```bash
# Ignore the default SQLite database.
*.sqlite3
*.sqlite3-journal
```

Now commit all of your changes. You'll notice when you run `git status` before you commit, the database file won't be included (but `.gitignore` will!). That means `.gitignore` is working.

### 2. Creating a Contact
Now that we've got our database and contacts table set up, we can start adding data to it.

Thankfully we can reuse the majority of our CRM code, but there are a couple small changes we have to make. ActiveRecord automatically provides us with a variety of methods that we can use to create records, one of which is the class method `create`, which we had previously implemented in our `Contact` class and used in our CRM.

However, the arguments this method takes is slightly different than what we implemented. ActiveRecord's `create` method expects a hash containing the keys and values of each property in the model, where each key should be the name of a property. In this case, that's `first_name`, `last_name`, `email`, and `note`. This is different than how we implemented it, as a separate argument for `first_name`, `last_name`, `email`, and `note`.

So now, we'll have to go through our `crm.rb` file, and anywhere we've used `Contact.create` like this:
```rb
Contact.create(first_name, last_name, email, note)
```
We'll have to do something like this:
```rb
contact = Contact.create(
  first_name: first_name,
  last_name:  last_name,
  email:      email,
  note:       note
)
```
Note that you may not have named your parameters `first_name`, `last_name`, `email`, and `note`, so just replace the **values**, not the **keys**, of your hash with whatever you did call them.

Go ahead and try to create some contacts through your CRM now. If you get stuck, take a step back from your CRM, and just load your `contact.rb` file into IRB, and try creating a couple contacts through IRB first. This is a great debugging technique that you should get into the habit of doing.

Once you're satisfied, don't forget to make a commit!

### 3. Fetching a Contact
Because ActiveRecord objects have similar properties to our previous `Contact` class, we will continue to be able to have a unique identifier for our resources. Better yet, it's still called `id`!

In addition, ActiveRecord also uses `Contact.find` to return the contact object.

All of this to say, we shouldn't actually need to change any of our calls to `Contact.find` in our CRM: it should work out of the gate.

Let's move on to updating and deleting contacts!

### 4. Updating and Deleting a Contact
Now that you're familiar with the different ActiveRecord methods you can use, the next step is for you to make sure the code in the rest of your CRM is up to date. Consult the ActiveRecord cheatsheet shown earlier in this assignment to figure out what the new methods are and how to use them.

#### Some hints:
* Wherever you're updating fields of `@contact`, you'll need to make sure you **save** the record to the database. It's no longer enough to simply update a record in our program's memory, we also need to make sure that change is saved back to the database.
* Try out your code and commit frequently, as often as every time you get one of your ActiveRecord method calls working properly. Lean towards committing too much instead of too little.



That's it! Success!

![](http://rack.3.mshcdn.com/media/ZgkyMDEzLzA4LzE1L2VmL3RpbmEuZGViZDUuZ2lmCnAJdGh1bWIJODUweDU5MD4KZQlqcGc/02526b7c/172/tina.jpg)

Don't forget to push the code to your GitHub account and submit your assignment.

### 6. (BONUS) Using SQL

#### Starting SQL on the command line

Whenever you'd like to practice some SQL, feel free to open up the console and work with SQLite on the command line, just like in Step 0.

```bash
$ sqlite3
```

You can also start sqlite on the command line with a specific database in mind, such as the one we just created. Inside your project folder you can do:

```bash
$ sqlite3 crm.sqlite3
```

Note that if make any changes to data, you will be making actual changes to your database.

Here are the official sql command line docs: [https://www.sqlite.org/sqlite.html](https://www.sqlite.org/sqlite.html)

#### CREATE a new table

Create a new table called `users`. It should have the columns `id`, `first_name`, and `last_name`.

```sql
CREATE TABLE _table_ (
  id INT PRIMARY KEY AUTOINCREMENT,
  _column1_ _datatype1_,
  _column2_ _datatype2_
);
```

Fill in the blanks where there are underscores. Don't forget your semi-colons! Your query won't execute without them.

#### INSERT a new record

Insert a few records inside your `users` table.

```SQL
INSERT INTO _table_ (_column1_, _column2_) VALUES (_valueforcolumn1_, _valueforcolumn2_);
```

#### SELECT records

To select every record and every column:

```sql
SELECT * FROM _table_;
```

You can also select only specific column names by passing them in instead of `*`

```sql
SELECT _column_ FROM _table_;
```

#### SELECT records conditionally

You can use a **WHERE** clause to specify certain conditions in your query.

```sql
SELECT * FROM _table_ WHERE _column_ = _value_;
```

Depending on the "value", you might have to wrap it in quotes.

Here are some examples of where clauses that you can use:

[SQL WHERE Clause Examples](http://www.w3schools.com/sql/sql_where.asp)

#### UPDATE a record

Updating allows you to change values of existing rows inside your table.

```sql
UPDATE _table_ SET _column_ = _value_ WHERE _some_condition_;
```

It's probably best to always include a condition when you're updating rows, because otherwise the update will apply to every single row.

#### DELETE a record

You can delete records from a table with the following statement.

```sql
DELETE FROM _table_ WHERE _some_condition_;
```

**NOTE**: If you don't set a condition in the DELETE statement, you will delete _everything_ also.

#### DROP an entire table

If you want to completely remove a database table, you'll need to "drop" it.

```sql
DROP TABLE _table_;
```

You're done!

## Submitting Your Work

When you're done, don't forget to push your code to your Github repository

Have fun! :)
