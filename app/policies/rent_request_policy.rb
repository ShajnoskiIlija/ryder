# frozen_string_literal: true

class RentRequestPolicy < ApplicationPolicy
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

  def create?
    @user.id == @record.user_id
  end

  def update?
    user.id?
  end
end
