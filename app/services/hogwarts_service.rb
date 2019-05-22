class HogwartsService
  def initialize(key)
    @key = key
  end

  def json(body)
    JSON.parse(body, symbolize_names: true)
  end

  def conn
    Faraday.new('http://hogwarts-as-a-service.herokuapp.com/api/v1/') do |f|
      f.adapter Faraday.default_adapter
      f.headers['x-api_key'] = @key
    end
  end

  def students(house)
    house_id = find_house_id(house)
    response = conn.get('house/'+house_id)
    json(response.body)
  end

  def find_house_id(house)
    house_ids = json(conn.get('house').body)
    house_ids.find{|h| h[:name] == house}[:id].to_s
  end

end
