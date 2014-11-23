class OnboardingController < ApplicationController
  layout 'onboarding'
  skip_before_action :authorize

  def start
    @user = User.where(invitation_token: params[:token]).first
  end

  def finish
    @user = User.where(invitation_token: params[:user][:token]).first
    @user.invitation_token = nil
    @user.update_password params[:user][:password]
    sign_in @user
    redirect_to events_path, notice: I18n.t('onboarding.password_set')
  end
end