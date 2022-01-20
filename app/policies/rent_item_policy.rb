# frozen_string_literal: true

class RentItemPolicy < ApplicationPolicy
  attr_reader :user, :record

  def index?
    user_access
  end

  def create?
    user_access
  end

  def update?
    user_access
  end

  def destroy?
    user_access
  end

  private

  def user_access
    @user == @record.user
  end
end
