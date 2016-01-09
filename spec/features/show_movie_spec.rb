describe "Viewing an individual movie" do
  it "shows it's details" do
    movie = Movie.create(movie_attributes(total_gross: 318412101.00))

    visit movie_path(movie)

    expect(page).to have_text(movie.title)
    expect(page).to have_text(movie.rating)
    expect(page).to have_text(movie.description)
    expect(page).to have_text(movie.released_on)
    expect(page).to have_text(movie.cast)
    expect(page).to have_text(movie.director)
    expect(page).to have_text(movie.duration)
    expect(page).to have_selector("img[src$='#{movie.image_file_name}']")
  end

  it "shows the total gross if the total gross exceeds $50M" do
    movie = Movie.create(movie_attributes(total_gross: 318412101.00))

    visit movie_path(movie)

    expect(page).to have_text("$318,412,101.00")
  end

  it "shows 'Flop!' if the total gross is less than $50M" do
    movie = Movie.create(movie_attributes(total_gross: 30000000.00))

    visit movie_path(movie)

    expect(page).to have_text("Flop!")
  end
end