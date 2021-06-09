class Friends::UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.pet_sitter? || record.friends_with?(user)
  end
end
