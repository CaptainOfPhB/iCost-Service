class Api::V1::TagsController < ApplicationController
  def index
    @tags = Tag.where user_id: params[:user_id]
    render(
      status: 200,
      json: { status: :success, data: @tags, errors: nil },
    )
  end

  def create
    @tag = Tag.new label: params[:label], user_id: params[:user_id]
    if @tag.save
      render(
        status: 200,
        json: { status: :success, data: @tag, errors: nil },
      )
    else
      render(
        status: 400,
        json: { status: :error, data: nil, errors: @tag.errors },
      )
    end
  end

  def update
    @tag = Tag.find_by_identity params[:id]
    return render(
             status: 404,
             json: { status: :error, data: nil, errors: { identity: "can not found" } },
           ) if @tag.nil?

    @tag.label = params[:label]

    if @tag.save
      render(
        status: 200,
        json: { status: :success, data: @tag, errors: nil },
      )
    else
      render(
        status: 400,
        json: { status: :error, data: nil, errors: @tag.errors },
      )
    end
  end

  def destroy
    # TODO: delete tag
    p params
  end
end
