class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :comments

  def self.search(query)
    where("title like ?", "%#{query}%")
  end


end
