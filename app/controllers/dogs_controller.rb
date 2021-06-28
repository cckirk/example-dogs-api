class DogsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if current_user
      dog = Dog.new(
        name: params[:name],
        age: params[:age],
        breed: params[:breed]
      )
      dog.save
      render json: dog.as_json
    else
      render json: {message: "users must be logged in"}
    end
  end
end
