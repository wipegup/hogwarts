class StudentInformationFacade
  def initialize(house)
    @key = 'alohamora'
    @house = house
  end

  def num_students
    students.count
  end

  def students
    student_json = hogwarts_service.students(@house)
    student_json.map do |s_info|
      Student.new(s_info)
    end
  end

  def hogwarts_service
    @service ||= HogwartsService.new(@key)
  end
end
