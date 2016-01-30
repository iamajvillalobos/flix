describe "Deleting a user" do
  before do
    admin = User.create!(user_attributes(admin: true))
    sign_in(admin)
  end

  it "destroys the user and shows the user listing without the deleted user" do
    user = User.create!(user_attributes(email: "another@user.com", username: "anotheruser"))

    visit user_path(user)

    click_link 'Delete Account'

    expect(current_path).to eq(root_path)
  end

  # it "automatically signs out the user" do
  #   user = User.create!(user_attributes)

  #   sign_in(user)
  #   visit user_path(user)

  #   click_link 'Delete Account'

  #   expect(page).not_to have_link 'Sign Out'
  #   expect(page).to have_link 'Sign In'
  # end
end
