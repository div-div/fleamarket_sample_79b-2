# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
  end

  def new_profile
    @user = User.new(sign_up_params)
      unless @user.valid?
        flash.now[:alert] = @user.errors.full_messages
        render :new and return
      end
    session[:user] = {}
    session[:user][:nickname] = sign_up_params[:nickname]
    session[:user][:email] = sign_up_params[:email]
    session[:user][:password] = sign_up_params[:password]
    session[:user][:password_confirmation] = sign_up_params[:password_confirmation]

    @profile = Profile.new

    render :new_profile
  end

  def new_address
    @profile = Profile.new(profile_params)
    unless @profile.valid?
      render :new_profile and return
    end
    session[:profile] = {}
    session[:profile][:family_name] = profile_params[:family_name]
    session[:profile][:given_name] = profile_params[:given_name]
    session[:profile][:family_name_kana] = profile_params[:family_name_kana]
    session[:profile][:given_name_kana] = profile_params[:given_name_kana]
    session[:profile][:birth_date_year] = profile_params[:birth_date_year]
    session[:profile][:birth_date_month] = profile_params[:birth_date_month]
    session[:profile][:birth_date_day] = profile_params[:birth_date_day]

    @address = Address.new
  end

  def create_address

    @user = User.new(
      nickname: session[:user]["nickname"],
      email: session[:user]["email"],
      password: session[:user]["password"],
      password_confirmation: session[:user]["password_confirmation"],
    )

    @user.profile = Profile.new(
      family_name: session[:profile]["family_name"],
      given_name: session[:profile]["given_name"],
      family_name_kana: session[:profile]["family_name_kana"],
      given_name_kana: session[:profile]["given_name_kana"],
      birth_date_year: session[:profile]["birth_date_year"],
      birth_date_month: session[:profile]["birth_date_month"],
      birth_date_day: session[:profile]["birth_date_day"],
    )
    #
    # @address = Address.new(address_params)
    # unless @address.valid?
    #   render :new_address
    # end
    @user.address = Address.new(address_params)
    # unless @user.address.valid?
    #   render :new_address and return
    # end
    # binding.pry

    # @user.address = Address.new(address_params)
    # unless @user.valid?
    #   render :new_address and return
    # end
    # @user.address = @address


    @user.save

    sign_in(:user, @user)

    render '/home/index.html.haml'


end
private

  # def sign_up_params
  #   params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  # end

  def profile_params
    params.require(:profile).permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :birth_date_year, :birth_date_month, :birth_date_day )
  end

  def address_params
    params.require(:address).permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number )
  end

end
