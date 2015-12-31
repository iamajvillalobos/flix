describe "Navigating movies" do
  it "allows navigation from the details page to the listing page" do
    movie = Movie.create(movie_attributes)

    visit movie_path(movie)
    click_link "All Movies"

    expect(current_path).to eq(movies_path)
  end

  it "allows navigation from the listing page to the details page" do 
    movie = Movie.create(movie_attributes)

    visit movies_path
    click_link movie.title

    expect(current_path).to eq(movie_path(movie))
  end
 end