class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author, class_name: "User"
  acts_as_votable
end
