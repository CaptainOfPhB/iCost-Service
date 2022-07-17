class Api::V1::AccountsController < ApplicationController
  def show
  end

  def create
  end

  def index
    fake_accounts = [{ id: 1, name: "Account 1" }, { id: 2, name: "Account 2" }]
    render json: fake_accounts
  end

  def destroy
  end

  def update
  end
end
