class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  
  
  attr_accessor :name, :grade
  
def initialize(name, grade, id=nil)
    @id = id
    @name = name
    @grade = grade
  end 
  
  def create_table()
  end 
  
  
  def drop_table()
  end 
  
  def save
    sql = <<-SQL
      INSERT INTO songs (name, grade) 
      VALUES (?, ?)
    SQL
 
    DB[:conn].execute(sql, self.name, self.grade)
 
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0]
 
  end
  
  
end
