class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def show?
    true
  end

  def accept_request?
    user == current_user
  end

  def reject_request?
    user == current_user
  end
end
