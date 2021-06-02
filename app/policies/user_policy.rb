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
    true
    # user == current_user
  end

  def decline_request?
    true
    # user == current_user
  end

  def request_friendship?
    true
  end
end
