class PostPolicy < ApplicationPolicy
  def update?
    record.user_id == user.id || admin_types.includes?(user.type)
  end
end