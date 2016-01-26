class Label < ActiveRecord::Base
	has_many :labelled_posts
	has_many :posts, through: :labelled_posts
end
