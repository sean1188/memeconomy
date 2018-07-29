class HomeController < ApplicationController
  # before_action :set_user, except: :front
  # respond_to :html, :js

  def index
    # issuer = 'Memeconomy'
    # label = "#{issuer}:#{current_user.email}"

    # current_user.otp_provisioning_uri(label, issuer: issuer)

    # # > "otpauth://totp/Your%20App:user@example.com?secret=[otp_secret]&issuer=Your+App"

    current_user.otp_secret = User.generate_otp_secret
    current_user.otp_required_for_login = true
    current_user.save!

    @qr = RQRCode::QRCode.new(current_user.otp_provisioning_uri(current_user.email, secret: current_user.otp_secret, issuer: "Devise-Two-Factor-Demo"))
    
    # With default options specified explicitly
    @svg = @qr.as_svg(offset: 10, module_size: 7)

  end

  # def front
  #   @activities = PublicActivity::Activity.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  # end

  # def find_friends
  #   @friends = @user.all_following
  #   @users =  User.where.not(id: @friends.unshift(@user)).paginate(page: params[:page])
  # end

  # private
  # def set_user
  #   @user = current_user
  # end
end