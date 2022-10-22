class UsersController < ApplicationController
  def index
    @users = User.order(:created_at => :desc).first(10)
  end
end
