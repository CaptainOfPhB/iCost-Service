require "securerandom"

class Api::V1::UsersController < ApplicationController
  def create
    # TODO
    # 1. validate email duplication
    # 2. return session token if create succeed

    # generate a 8-bits length user id
    identity = SecureRandom.hex[0..7]
    @user = User.new email: params[:email], role: :user, identity: identity, nick_name: "User_#{identity}"
    if @user.save
      render json: { status: :success, data: @user, errors: nil }
    else
      render json: { status: :error, data: nil, errors: @user.errors }
    end
  end

  def update
  end

  def show
  end

  def destroy
    # TODO
    # 1. if user is nil
    # 2. if not nil, set user visible to false

    return
    # return render json: { status: :error, data: nil, errors: "User not found" } if @user.nil?

    @user = User.find_by_identity params[:identity]
    if @user.destroy
      render json: { status: :success, data: nil, errors: nil }
    else
      render json: { status: :error, data: nil, errors: @user.errors }
    end
  end
end
