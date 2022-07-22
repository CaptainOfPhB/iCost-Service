require "securerandom"

class Api::V1::UsersController < ApplicationController
  def create
    # TODO: return session token if create succeed

    # generate a 8-bits length user id
    identity = SecureRandom.hex[0..7]
    @user = User.new role: :USER, identity: identity, email: params[:email], nick_name: "User_#{identity}"

    if @user.save
      render status: 200, json: { status: :success, data: @user, errors: nil }
    else
      render status: 400, json: { status: :error, data: nil, errors: nil }
    end
  end

  def update
  end

  def show
  end

  def destroy
    # TODO: destroy session token if delete succeed

    @user = User.find_by_identity params[:identity]
    return render(
             status: 404,
             json: { status: :error, data: nil, errors: { identity: "can not found" } },
           ) if @user.nil? or !@user.visible

    @user.visible = false
    @user.destroyed_at = Time.now.to_datetime

    if @user.save
      render json: { status: :success, data: @user, errors: nil }
    else
      render json: { status: :error, data: nil, errors: @user.errors }
    end
  end
end
