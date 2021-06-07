class PetSittingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  # adding update later?

  def create?
    true
  end

  def destroy?
    record.user == user
  end

end
