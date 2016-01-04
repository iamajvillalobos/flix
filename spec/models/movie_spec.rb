describe "A movie" do
  it "is a flop if the total gross is less than $50M" do
    movie = Movie.new(total_gross: 35000000.00)

    expect(movie.flop?).to eq(true)
  end

  it "is not a flop of the total gross exceeds $50M" do
    movie = Movie.new(total_gross: 125000000.00)

    expect(movie.flop?).to eq(false)
  end
end