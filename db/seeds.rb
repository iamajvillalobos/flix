Movie.delete_all
Movie.create!([
  {
    title: "The Shawshank Redemption",
    rating: "R",
    total_gross: 3404111.97,
    description: "Two imprisoned men bond over a number of years, finding
    solace and eventual redemption through acts of common decency.",
    released_on: Date.parse("14 October 1994"),
    cast: "Tim Robbins, Morgan Freeman, Bob Gunton",
    director: "Frank Darabont",
    duration: "142 min",
    image_file_name: "shawshank_redemption.jpg"
  },
  {
    title: "The Godfather",
    rating: "R",
    total_gross: 134821952,
    description: "The aging patriarch of an organized crime dynasty transfers
    control of his clandestine empire to his reluctant son.",
    released_on: Date.parse("24 March 1972"),
    cast: "Marlon Brando, Al Pacino, James Caan",
    director: "Francis Ford Coppola",
    duration: "175 min",
    image_file_name: "the_godfather.jpg"
  },
  {
    title: "The Godfather II",
    rating: "R",
    total_gross: 57300000,
    description: "The early life and career of Vito Corleone in 1920s New York
    is portrayed while his son, Michael, expands and tightens his grip on his
    crime syndicate stretching from Lake Tahoe, Nevada to pre-revolution
    1958 Cuba",
    released_on: Date.parse("24 March 1972"),
    cast: "Robert Duvall, Al Pacino, Diane Keaton",
    director: "Francis Ford Coppola",
    duration: "202 min",
    image_file_name: "the_godfather_2.jpg"
  },
  {
    title: "The Dark Knight",
    rating: "PG-13",
    total_gross: 533316061,
    description: "When the menace known as the Joker wreaks havoc and chaos on
    the people of Gotham, the caped crusader must come to terms with one of
    the greatest psychological tests of his ability to fight injustice.",
    released_on: Date.parse("24 March 1972"),
    cast: "Christian Bale, Heath Ledger, Aaron Eckhart",
    director: "Christopher Nolan",
    duration: "152 min",
    image_file_name: "the_godfather_2.jpg"
  }
])