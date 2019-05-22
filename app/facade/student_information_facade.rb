class StudentInformationFacade
  def initialize(house)
    @key = ENV['api_key']
    @house = house
  end

  def num_students
    students.count
  end

  def students
    @_s ||= hogwarts_service.students(@house).map do |s_info|
      Student.new(s_info)
    end
  end

  def hogwarts_service
    @service ||= HogwartsService.new(@key)
  end
end
