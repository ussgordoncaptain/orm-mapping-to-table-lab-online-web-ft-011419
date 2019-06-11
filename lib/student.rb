class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  def intialize(name, grade, id=nil)
    @name = name 
    @grade = grade
  end
  attr_accessor :name, :grade
  attr_reader :id 
  def create_table
    sql <<-SQL 
    CREATE TABLE IF NOT EXISTS students("id INTEGER PRIMARY KEY, name TEXT, grade INTEGER")  
    SQL 
    DB[:conn].execute(sql)
  end 
end
