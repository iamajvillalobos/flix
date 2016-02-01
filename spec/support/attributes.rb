def movie_attributes(overrides = {})
  {
    title: 'Iron Man',
    description:
    %{
      When wealthy industrialist Tony Stark is forced to build an
      armored suit after a life-threatening incident, he ultimately
      decides to use its technology to fight against evil.
    }.squish,
    image_file_name: 'ironman.jpg',
    cast: 'Robert Downey Jr., Gwyneth Paltrow and Terrence Howard',
    released_on: "2008-05-02",
    duration: '126 min',
    director: 'Jon Favreau',
    rating: 'PG-13',
    total_gross: 318_412_101
    }.merge(overrides)
end

def review_attributes(overrides = {})
  {
    stars: 3,
    comment: "I laughed, I cried, I spilled my popcorn!"
  }.merge(overrides)
end

def user_attributes(overrides = {})
  {
    name: "Example User",
    email: "user@example.com",
    password: "secretsecret",
    password_confirmation: "secretsecret",
    username: "user12345"
  }.merge(overrides)
end
