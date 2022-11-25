class Classroom
  attr_accessor :label

  def initialize(_label)
    @students = []
    @label = label
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end
