describe "Viewing the list of users" do
  it "shows the users" do
    user1 = User.create!(user_attributes(name: "Larry",
      email: "larry@example.com"))
    user2 = User.create!(user_attributes(name: "Anne",
      email: "anne@example.com"))
    user3 = User.create!(user_attributes(name: "Christa",
      email: "christa@example.com"))

    visit users_path

    expect(page).to have_link(user1.name)
    expect(page).to have_link(user2.name)
    expect(page).to have_link(user1.name)
  end
end
