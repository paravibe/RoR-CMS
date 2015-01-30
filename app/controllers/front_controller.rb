class FrontController < ApplicationController
  layout 'front'
  include FrontHelper

  def page
    @user = User.find(1);
    @profile_image = gimage(@user.email, '200')
  end

  def settings
  end
end
