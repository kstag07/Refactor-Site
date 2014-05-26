class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, foreign_key: "author_id"
  # belongs_to :role
  # before_create :set_default_role
  # delegate :name, to: :role, prefix: true

  def author?
    role == 'author'
  end

  def mod?
    role == 'mod'
  end

# private
#   def set_default_role
#     # self.role << Role.find_by_name('author') if roles.empty?
#     self.role ||= Role.find_by_name('author')
#   end
end
