describe "Viewing the list of movies" do
  it "shows the movies" do

    movie1 = Movie.create(title: "Iron Man",
                          rating: "PG-13",
                          total_gross: 318412101.00,
                          description: "Tony Stark builds an armored suit to fight the throes of evil",
                          released_on: "2008-05-02",
                          cast: 'Robert Downey Jr., Gwyneth Paltrow and Terrence Howard',
                          duration: '126 min',
                          director: 'Jon Favreau')

    movie2 = Movie.create(title: "Iron Man 2",
                          rating: "PG-13",
                          total_gross: 318412101.00,
                          description: "Tony Stark builds an armored suit to fight the throes of evil",
                          released_on: "2008-05-02",
                          cast: 'Robert Downey Jr., Gwyneth Paltrow and Terrence Howard',
                          duration: '126 min',
                          director: 'Jon Favreau')

    visit movies_url

    expect(page).to have_text(movie1.title)
    expect(page).to have_text(movie2.title)

    expect(page).to have_text(movie1.rating)
    expect(page).to have_text(movie1.description[0..9])
    expect(page).to have_text("$318,412,101.00")
  end

  it "does not show a movie that hasn't yet been released" do
    movie1 = Movie.create(movie_attributes(released_on: 1.month.from_now))

    visit movies_url

    expect(page).to_not have_text(movie1.title)

  end
end