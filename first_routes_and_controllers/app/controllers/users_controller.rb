require 'byebug'

class UsersController < ApplicationController

  # GET /users
  def index  
    # debugger
    @users = User.all
    render json: @users
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  # POST /users
  def create
    # debugger 
    @user = User.new(user_params)
    
    if @user.save
      render json: @user
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  # PUT /users/:id
  # PATCH /users/:id
  def update
    # debugger
    @user = User.find(params[:id])

    if @user.update(user_params)
      render json: @user # Use render instead of redirect_to bc of Postman's redirect issues
      # redirect_to user_url(@user.id) # redirect error
    else
      if @user.nil?
        render json: {message:["User was not found."]}
      else
        render json: @user.errors.full_messages, status: 422
      end
    end
  end


  # DELETE /users/:id
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: @user # Use render instead of redirect_to bc of Postman's redirect issues
    # redirect_to users_url # 404 error
  end
  
  private
  def user_params
    params.require(:user).permit(:username) # removed :name from permit
  end
end


# POST localhost:3000/users?day=tuesday

# BODY
# user[name] => Jae-Son
# user[email] => js@gmail.com

# params = 
# { 
#   "user" => {"name" = "Jae-Son", "email" => "js@gmail.com", "dob" => "1451241"},
#   "id" => 7                                                                     
#   "day" => "tuesday"
#   
# }