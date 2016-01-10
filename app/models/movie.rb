class Movie < ActiveRecord::Base
  validates :title,:duration, :released_on, presence: true
  validates :description, length: { minimum: 24}

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
end
