class Post < ActiveRecord::Base
	has_many :labelled_posts
	has_many :labels, through: :labelled_posts
end
