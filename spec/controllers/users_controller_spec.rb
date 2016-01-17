describe UsersController do
  before do
    @user = User.create!(user_attributes)
  end

  context "when not signed in" do
    before do
      session[:user_id] = nil
    end

    it "cannot access index" do
      get :index, id: @user
      expect(response).to redirect_to(new_session_url)
    end

    it "cannot access show" do
      get :show, id: @user
      expect(response).to redirect_to(new_session_url)
    end

    it "cannot access edit" do
      get :edit, id: @user
      expect(response).to redirect_to(new_session_url)
    end

    it "cannot access update" do
      get :update, id: @user
      expect(response).to redirect_to(new_session_url)
    end

    it "cannot access destroy" do
      get :destroy, id: @user
      expect(response).to redirect_to(new_session_url)
    end
  end

  context 'when signed in as the wrong user' do
    before do
      @wrong_user = User.create!(user_attributes(email: "wrong@example.com", username: "blah12345"))
      session[:user_id] = @wrong_user.id
    end

    it "cannot edit another user" do
      get :edit, id: @user
      expect(response).to redirect_to(root_url)
    end

    it "cannot update another user" do
      get :update, id: @user
      expect(response).to redirect_to(root_url)
    end

    it "cannot destroy another user" do
      get :destroy, id: @user
      expect(response).to redirect_to(root_url)
    end
  end
end
