<h1 align="center">crud-ruby-pg</h1>

A very simple CRUD with Ruby and Postgresql.

- - -

### Pre-Requirements ### 

* [git](https://git-scm.com/) To clone the repository using git.

- - - 

### Instalation ### 

#### Git

``` sh
git clone 'https://github.com/OWLjz18/crud-ruby-pg.git'
```

And then run: 

``` txt
cd crud-ruby-pg
bundle install
cd lib
```

### Use ### 

First the connection module is required and a new instance of it is created:

Assuming you ran the "script.sql" file, you'll already have a database called "animes\_api" and a table called "animes" to work with.

``` ruby 
require './connection.rb'

connection = Connection::DBConnection.new('animes_api', 'owljz18')
```

And when doing so, the following methods are available:

#### Add

We can add a data, using the **add** method, it receives the name of the table and the new data to add:

``` ruby
connection.add('animes', 'AngelBeats')
```

#### Update

We can update the data of a table, using the **update** method, which receives the name of the table and the **id** of the record to update, plus the new value of said record:

``` ruby 
connection.update('animes', 1, 'Toradora')
```

#### Select by id

We can obtain the data from a table record, using the **select_by_id** method, which receives the name of the table and the **id** of the record to update, plus the new value of said record:

``` ruby 
connection.select_by_id('animes', 1)
```

And that will print the following to the console: 

``` txt
id: 1, name: 'Toradora'
```

#### Delete

We can delete data from a table, using the **delete** method, which receives the name of the table and the **id** of the record to delete:

``` ruby 
connection.delete('animes', 1)
```

#### Select all

Last but not least, we have the **select_all** method, which allows us to get all the records from a table, so let's add some data first:

``` ruby 
connection.add('animes', 'Karakai Jouzu No Takagi-San')
connection.add('animes', 'The Seven Deadly Sin')
connection.add('animes', 'Magmell Ultramarine')
connection.add('animes', 'Bubbles')
```

Now yes, let's select all the data

``` ruby
connection.select_all('animes')
```

And that prints the following on the console:

``` txt
1 Karakai Jouzu No Takagi-San
2 The Seven Deadly Sin
3 Magmell Ultramarine
4 Bubbles
```

- - -

### Author 🦉 ###

* *__José Zambrano__* ([OWLjz18](https://github.com/OWLjz18)) => Project Creator.
  * Email => <owl.jz18@gmail.com>
  * Instagram => [@owljz18](https://instagram.com/owljz18)

- - -

### 📃 License ###

This project is licensed under an _MIT_ license, please visit the [LICENSE.md](./LICENSE.md) file for more information about it.
