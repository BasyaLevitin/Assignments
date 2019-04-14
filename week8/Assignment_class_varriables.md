## Learning Goals
- class variables
- class methods

## Part 1: Bank Account
1. Create a class called `BankAccount`.
2. Add a _class variable_ called `@@interest_rate` that is a float representing the interest rate for all the accounts in the bank.  This is a class variable because it is the same value for all accounts.
3. Add another class variable called `@@accounts` that starts as an empty array.  This will eventually store the list of all bank accounts in the bank.
3. Add an `initialize` instance method that sets `@balance` to zero.  You should also add an `attr_accessor` for `balance` to your class.  Balance is stored in an instance variable because the value needs to be different from account to account.
4. Add an instance method called `deposit` that accepts a number as an argument and adds that amount to the account's balance.  
  This needs to be an instance method because it pertains to a _single, specific_ account.
5. Add an instance method called `withdraw` that accepts a number as an argument and subtracts that amount from the account's balance.
6. Add a _class method_ called `create` that calls `BankAccount.new` and adds the new object to `@@accounts` so that we can find it again in the future.  This method should return the new account object.
  This needs to be a class method because *at the time we run it* there is no _single, specific_ account object that we are working on.
7. Add a class method called `total_funds` that returns the sum of all balances across all accounts in `@@accounts`.  
  This needs to be a class method because it *does not* pertain to any _single, specific_ account.
8. Add a class method called `interest_time` that iterates through all accounts and increases their balances according to `@@interest_rate`.

### Example output

```
my_account = BankAccount.create
your_account = BankAccount.create
puts my_account.balance # 0
puts BankAccount.total_funds # 0
my_account.deposit(200)
your_account.deposit(1000)
puts my_account.balance # 200
puts your_account.balance # 1000
puts BankAccount.total_funds # 1200
BankAccount.interest_time
puts my_account.balance # 202.0
puts your_account.balance # 1010.0
puts BankAccount.total_funds # 1212.0
my_account.withdraw(50)
puts my_account.balance # 152.0
puts BankAccount.total_funds # 1162.0
```

## Part 2: Book Lending
In this assignment you're going to build a simple book lending program in order to practice using class variables and class methods.
### A side note on `Time`
In this assignment you'll be making use of Ruby's `Time` object in order to manage the due dates of the books.  Before getting started on the book program, open an `irb` session and the `Time` docs and spend a few minutes familiarizing yourself with this part of Ruby.  Try calling `Time.now` to see what it returns.  What happens if you run `Time.now + 60` or `Time.now - 360`?

### Your task
1. Create a class called `Book`.
2. Your class should have two class variables: `@@on_shelf` and `@@on_loan`.  Both should start as empty arrays. `@@on_shelf` will contain the collection of book objects that are available to be lent out and `@@on_loan` will contain the collection of books that are currently being borrowed.
3. Your class will also need an `attr_accessor` for `due_date`.
4. Your class should have the following methods:
  - an instance method `initialize`
  - an instance method `borrow`
  - an instance method `return_to_library`
  - an instance method `lent_out?`
  - a class method `create`
  - a class method `current_due_date`
  - a class method `overdue_books`
  - a class method `browse`
  - a class method `available`
  - a class method `borrowed`


##### `initialize`
  This instance method makes a new book object.  It should initialize a book's title, author, and isbn.

##### `create`
  This class method is how new books are added to the library.  This method should call `Book.new(...)`,add the new book object to `@@on_shelf`, and then return the new book.

##### `available`
  This class method should return the value of `@@on_shelf`.

##### `borrowed`
  This class method should return the value of `@@on_loan`.

##### `browse`
  This class method should return a random book from `@@on_shelf` (you may need to consult the `Array` docs to figure out how to do this).

##### `lent_out?`
  This instance method return true if a book has already been borrowed and false otherwise.

##### `current_due_date`
  This class method should return the due date for books taken out today.  It's up to you to decide how far in the future the due date should be. You can refer to the section about `Time` above for help getting started, and don't hesitate to ask for help if you're stuck!

##### `borrow`
  This instance method is how a book is taken out of the library.  This method should use `lent_out?` to check if the book is already on loan, and if it is this method should return `false` to indicate that the attempt to borrow the book failed.  Otherwise, use `current_due_date` to set the `due_date` of the book and move it from the collection of available books to the collection of books on loan, then return `true`.

##### `return_to_library`
  This instance method is how a book gets returned to the library.  It should call `lent_out?` to verify that the book was actually on loan.  If it wasn't on loan in the first place, return `false`.  Otherwise, move the book from the collection of books on loan to the collection of books on the library shelves, and set the book's due date to `nil` before returning `true`.

##### `overdue`
  This class method should return a list of books whose due dates are in the past (ie. less than `Time.now`).

As you write your program you should be thinking about the reasoning behind making each method either an instance method or a class method.

### Example output
```
sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")
puts Book.browse.inspect # #<Book:0x00555e82acdab0 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221"> (this value may be different for you)
puts Book.browse.inspect # #<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307"> (this value may be different for you)
puts Book.browse.inspect # #<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307"> (this value may be different for you)
puts Book.available.inspect # [#<Book:0x00555e82acde20 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431">, #<Book:0x00555e82acdce0 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00555e82acdab0 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">]
puts Book.borrowed.inspect # []
puts sister_outsider.lent_out? # false
puts sister_outsider.borrow # true
puts sister_outsider.lent_out? # true
puts sister_outsider.borrow # false
puts sister_outsider.due_date # 2017-02-25 20:52:20 -0500 (this value will be different for you)
puts Book.available.inspect # [#<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00562314675fd8 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">]
puts Book.borrowed.inspect # [#<Book:0x00562314676208 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431", @due_date=2017-02-25 20:55:17 -0500>]
puts Book.overdue.inspect # []
puts sister_outsider.return_to_library # true
puts sister_outsider.lent_out? # false
puts Book.available.inspect # [#<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00562314675fd8 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">, #<Book:0x00562314676208 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431", @due_date=nil>]
puts Book.borrowed.inspect # []
```
Good luck!
