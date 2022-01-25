# frozen_string_literal: true

class RentItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.id? if scope.all
    end

    private

    attr_reader :user, :record
  end

  def index?
    user.id?
  end

  def show?
    index?
  end

  def new?
    user.id?
  end

  def create?
    new?
  end

  def edit?
    @user.id == @record.user_id
  end

  def update?
    edit?
  end

  def destroy?
    @user.id == @record.user_id
  end
end
