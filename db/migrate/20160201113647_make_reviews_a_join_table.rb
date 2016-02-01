class MakeReviewsAJoinTable < ActiveRecord::Migration
  def change
    remove_column :reviews, :name, :string
    add_column :reviews, :user_id, :integer
  end
end
