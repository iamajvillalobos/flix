describe "Viewing an individual movie" do
  it "shows it's details" do
    movie = Movie.create(movie_attributes(total_gross: 318412101.00))

    visit movie_path(movie)

    expect(page).to have_text(movie.title)
    expect(page).to have_text(movie.rating)
    expect(page).to have_text("$318,412,101.00")
    expect(page).to have_text(movie.description)
    expect(page).to have_text(movie.released_on)
  end
end