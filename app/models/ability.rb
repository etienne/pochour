class Ability  
  include CanCan::Ability  
  
  def initialize(user)  
    can :read, :all
    unless user.nil?
      can :create, [Article, Epithet]
      can :update, Article do |article|
        article.user == user
      end
    end
  end  
end