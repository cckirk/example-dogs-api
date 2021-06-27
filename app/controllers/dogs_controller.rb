class DogsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      dog = Dog.new(
        name: params[:name],
        age: params[:age],
        breed: params[:breed]
      )
      dog.save
      rander json: {"it worked"}
    else
      render json: {}, status: :unauthorized
    end
  end
end
