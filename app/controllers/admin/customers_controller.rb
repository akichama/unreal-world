class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
  end
end