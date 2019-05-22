class HogwartsService
  def initialize(key)
    # binding.pry
    @key = key
  end

  def json(body)
    JSON.parse(body, symbolize_names: true)
  end

  def conn
    Faraday.new('http://hogwarts-it.herokuapp.com/api/v1/') do |f|
      f.adapter Faraday.default_adapter
      f.params['api_key'] = @key
    end
  end

  def students(house)
    response = conn.get('house/'+house)
    json_data = json(response.body)
    binding.pry
    json_data[:data][0][:attributes][:students]
  end

end
