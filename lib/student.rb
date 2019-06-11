class Student

  def initialize(name, grade, id=nil)
    
    @name = name 
    @grade = grade
    @id = id 
  end
  attr_accessor :name, :grade
  attr_reader :id 
  def self.create_table
    sql =  <<-SQL 
    CREATE TABLE IF NOT EXISTS students(
    id INTEGER PRIMARY KEY,
    name TEXT,
    grade INTEGER
    )
    SQL 
    DB[:conn].execute(sql)
  end 
  def self.drop_table 
    sql = "DROP TABLE IF EXISTS students"
    DB[:conn].execute(sql)
  end 
  def save 
  sql = <<-SQL 
  INSERT INTO students (name, grade) VALUES (?, ?)
  DB[:conn].execute(sql, @name, @grade)
end
