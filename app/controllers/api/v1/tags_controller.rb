class Api::V1::TagsController < ApplicationController
  def index
    fake_tags = [
      { identity: "asdflj", label: "apple" },
      { identity: "ianasd", label: "banana" },
    ]
    render json: fake_tags
  end
end
