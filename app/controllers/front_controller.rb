class FrontController < ApplicationController
  layout 'front'
  include FrontHelper

  def page
    @user = User.find(1)
    @profile = @user.profile

    # Collect social links.
    @social = get_social_links(@profile)

    # Get Gravatar image.
    @profile_image = get_gimage(@user.email, '200')

    # Nodes list.
    nodes = Node.published.to_ary
    @nodes = nodes.each_slice(2).to_a

    # Pass skills variables to gon.
    set_skills_data

    # Get github repositories.
    @repos = get_github_repos('paravibe')
  end
end
