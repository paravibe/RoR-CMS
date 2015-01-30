class FrontController < ApplicationController
  layout 'front'

  include FrontHelper

  def page
    @profile_image = gimage('paravibe@gmail.com', '200')
  end
end
