class Movie < ActiveRecord::Base
  validates :title,:duration, :released_on, presence: true
  validates :description, length: { minimum: 24}
  validates :total_gross, numericality: { greater_than_or_equal_to: 0}
  validates :image_file_name, allow_blank: true, format: {
    with: /\w+\.(gif|jpg|png)\z/i,
    message: "must reference a GIF, JPG, or PNG image"
  }
  RATINGS = %w(G PG PG-13 R NC-17)
  validates :rating, inclusion:{ in: RATINGS }

  has_many :reviews, dependent: :destroy

  def flop?
    if total_gross < 50000000
      true
    else
      false
    end
  end

  def self.released
    where('released_on <= ?', Time.now).order('released_on desc')
  end

  def average_stars
    reviews.average(:stars)
  end
end
