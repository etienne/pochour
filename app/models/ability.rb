class Ability  
  include CanCan::Ability  
  
  def initialize(user)  
    can :read, :all
    can :update, Article do |article|
      article.user == user
    end
  end  
end