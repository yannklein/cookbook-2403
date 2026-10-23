class Student
  # attr_reader :graduated

  def initialize(name, height)
    @name = name
    @height = height
    @graduated = false
  end

  def graduate
    @graduated = true
  end

  def graduated?
    @graduated
  end

  def self.grades
    ["CP", "CE1", "CE2", "CM1", "CM2"]
  end
end

vicent = Student.new("Vicent", 199)
maria = Student.new("Maria", 160)
tebatsi = Student.new("Tebatsi", 180)

tebatsi.graduate
p tebatsi.graduated?

# p tebatsi.grades
p Student.grades


# Reminder
# last_name = last_name.upcase
# last_name.upcase!