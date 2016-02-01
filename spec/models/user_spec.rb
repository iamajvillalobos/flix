describe "A user" do

  it "requires a name" do
    user = User.new(name: "")
    user.valid?
    expect(user.errors[:name].any?).to eq(true)
  end

  it "requires an email" do
    user = User.new(email: "")
    user.valid?
    expect(user.errors[:email].any?).to eq(true)
  end

  it "accepts properly formatted email address" do
    emails = %w[user@example.com first.last@example.com]
    emails.each do |email|
      user = User.new(email: email)
      user.valid?
      expect(user.errors[:email].any?).to eq(false)
    end
  end

  it "rejects invalid formated email address" do
    emails = %w[@user user@ @example.com]
    emails.each do |email|
      user = User.new(email: email)
      user.valid?
      expect(user.errors[:email].any?).to eq(true)
    end
  end

  it "requires a unique, case-insensitive email address" do
    user1 = User.create!(user_attributes)
    user2 = User.new(email: user1.email.upcase)
    user2.valid?

    expect(user2.errors[:email].first).to eq("has already been taken")
  end

  it "is valid with example attributes" do
    user = User.new(user_attributes)
    expect(user.valid?).to eq(true)
  end

  it "requires a password" do
    user = User.new(password: "")
    user.valid?
    expect(user.errors[:password].any?).to eq(true)
  end

  it "requires a password of atleast 10 characters" do
    user = User.new(password: "secretsecret")
    user.valid?
    expect(user.errors[:password].any?).to eq(false)
  end

  it "requires a password confirmation when password is present" do
    user = User.new(password: "secret", password_confirmation: "")
    user.valid?
    expect(user.errors[:password_confirmation].any?).to eq(true)
  end

  it "requires the password to match the password confirmation" do
    user = User.new(password: "secret", password_confirmation: "notsecret")
    expect(user.valid?).to eq(false)
  end

  it "does not require a password when updating" do
    user = User.create!(user_attributes)
    user.password = ""
    expect(user.valid?).to eq(true)
  end

  it "automatically encrypts the password into the password_digest attribute" do
    user = User.new(password: "secret")
    expect(user.password_digest.present?).to eq(true)
  end

  it "requires a username" do
    user = User.new(username: "")
    user.valid?
    expect(user.errors[:username].any?).to eq(true)
  end

  it "accepts properply formatted username" do
    usernames = %w[seniorbrusko christa1125 1punchman]
    usernames.each do |username|
      user = User.new(username: username)
      user.valid?
      expect(user.errors[:username].any?).to eq(false)
    end
  end

  it "rejects invalid formatted username" do
    usernames = ["user name123", "use%923$"]
    usernames.each do |username|
      user = User.new(username: username)
      user.valid?
      expect(user.errors[:username].any?).to eq(true)
    end
  end

  it 'has reviews' do
    user = User.new(user_attributes)
    movie1 = Movie.new(movie_attributes(title: "Iron Man"))
    movie2 = Movie.new(movie_attributes(title: "Superman"))

    review1 = movie1.reviews.new(stars: 5, comment: "Two thumbs up!")
    review1.user = user
    review1.save!

    review2 = movie2.reviews.new(stars: 3, comment: "Cool!")
    review2.user = user
    review2.save!

    expect(user.reviews).to include(review1)
    expect(user.reviews).to include(review2)
  end
end
