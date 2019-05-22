```
As a user
When I visit "/"
And I select "Slytherin" from the dropdown
And I click on "Get Students"
Then my path should be "/search" with "house=slytherin" in the parameters
And I should see a message "22 Students"
And I should see a list of the 22 members of Slytherin
And I should see a name and id for each student.
```

http://hogwarts-it.herokuapp.com/api/v1/house/gryffindor?api_key=alohamora

Your key is: alohamora
