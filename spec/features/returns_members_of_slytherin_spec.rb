require 'rails_helper'

describe "Visit home" do
  it "select Slytherin" do
    visit "/"
    select "Slytherin", from: "house"
    click_on "Get Students"
    expect(current_path).to eq(search_path)
    expect(page).to have_content("22 Students")
    expect(page).to have_css('.student', count: 22)

    students = all('.student')
    students.each do |student|
      expect(student).to have_css('.id')
      expect(student).to have_css('.name')
    end
  end
end
