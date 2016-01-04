class Movie < ActiveRecord::Base
  def flop?
    if total_gross < 50000000
      true
    else
      false
    end
  end
end
