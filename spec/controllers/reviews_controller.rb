describe ReviewsController do 
  before do
    @movie = Movie.create!(movie_attributes)
  end

  context 'when not signed in' do
    before do
      session[:user_id] = nil
    end

    it 'cannot access create' do
      get :create, movie_id: @movie
      expect(response).to redirect_to(new_session_url)
    end
  end
end