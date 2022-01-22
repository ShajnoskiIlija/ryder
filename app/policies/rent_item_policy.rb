# frozen_string_literal: true

class RentItemPolicy < ApplicationPolicy
  attr_reader :user, :record

  def index?
   @user.id == @record.user_id
  end

  def new
    @user.id == @record.user_id
  end

  def create?
    @user.id == @record.user_id
  end

  def edit?
    @user.id = @record.user_id
  end

  def update?
    edit?
  end

  def destroy?
    @user == @record.user
  end
end
