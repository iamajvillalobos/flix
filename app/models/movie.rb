class Movie < ActiveRecord::Base
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
