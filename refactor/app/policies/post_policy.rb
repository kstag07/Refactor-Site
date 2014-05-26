class PostPolicy < ApplicationPolicy
  def initialize (user, post)
    @user = user
    @post = post
  end

  def create?
    @user.present? && @user.author? || @user.mod?
  end

  def update?
    @user.present? && (@user.mod? || @user.author? && @user == @post.author)
  end

  def destroy?
    @user.present? && @user.mod?
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.all
    end
  end
end
