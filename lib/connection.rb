require 'pg'

# Author:: OWLjz18
# Github:: github.com/OWLjz18
#
# = module Connection
# Wrapper for DBConnection class.
module Connection 
  # == class DBConnection
  # Create a channel to connect to the database and work on it.
  class DBConnection
    # Create a new connection to the database.
    # - *dbname*: It is the name of the database to which it will access.
    # - *age*: It is the username with which you will connect to the database.
    def initialize (dbname, user)
      @dbname = dbname
      @user = user
      
      @connection = PG.connect(dbname: @dbname, user: @user)
    end
    
    # Adds a data to the specified table.
    # - *table*: Table in which the new data will be inserted.
    # - *anime_name*: Name of the anime to insert.
    def add (table, anime_name)
      @connection.exec("INSERT INTO #{table} (name) VALUES ('#{anime_name}');")
    end
    
    # Updates a data of the specified table.
    # - *table*: Table from which the data will be updated.
    # - *id*: id of the data to update.
    # - *new_name*: New anime name.
    def update (table, id, new_name)
      @connection.exec("UPDATE #{table} SET name = #{new_name} WHERE id = #{id};")
    end
    
    # Deletes a data from the specified table.
    # - *table*: Table from which the data will be removed.
    # - *id*: id of the anime to delete.
    def delete (table, id)
      @connection.exec("DELETE FROM #{table} WHERE id = #{id};")
    end
    
    # Shows all the data of an anime by its id.
    # - *table*: Table from which data will be retrieved.
    # - *id*: id of the anime to select.
    def select_by_id (table, id)
      res = @connection.exec("SELECT * FROM #{table} WHERE id = #{id};")
      
      res.each do |row|
        puts "id: #{row['id']}, name: '#{row['name']}'"
      end
    end
    
    # Shows all existing records in the specified table.
    # - *table*: Table from which records will be fetched.
    def select_all (table)
      res = @connection.exec("SELECT * FROM #{table};")
      
      res.each do |row|
        puts "#{row['id']} #{row['name']}"
      end
    end
  end
end
