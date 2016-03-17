class StudentPolicy < ApplicationPolicy

  def create?
    user.admin? || record.try(:user_id) == user.id
  end

  def edit?
    user.admin? || record.try(:user_id) == user.id
  end

  def update?
    user.admin? || record.try(:user_id) == user.id
  end

  def destroy?
    user.admin? || record.try(:user_id) == user.id
  end

end
