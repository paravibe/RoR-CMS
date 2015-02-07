class FrontController < ApplicationController
  layout 'front'
  include FrontHelper

  def page
    @user = User.find(1)
    @profile = @user.profile

    # Collect social.
    @social = {}

    if !@profile.nil?
      social = ['github', 'drupal', 'linkedin']
      social.each do |v|
        if !@profile[v].nil? && !@profile[v].empty?
          @social[v] = @profile[v]
        end
      end
    end

    # Get Gravatar image.
    @profile_image = gimage(@user.email, '200')

    # Nodes list.
    nodes = Node.sorted.to_ary
    @nodes = nodes.each_slice(2).to_a

    # List of skills for bar chart.
    skills = {
      'Skill' => 'Skill',
      'Drupal' => 8,
      'PHP' => 8,
      'SQL' => 8,
      'jQuery' => 7,
      'jQuery UI' => 6,
      'CSS' => 7,
      'HTML' => 7,
      'AJAX' => 7,
      'Git' => 7,
      'Apache' => 3,
      'Solr' => 2,
      'Github' => 2,
      'JIRA' => 3,
      'Confluence' => 3,
      'Scrum' => 3,
      'Kanban' => 1,
      'Intellij IDEA' => 1,
      'Redmine' => 1,
      'Basecamp' => 1,
      'Tortoise SVN' => 1,
      'Web Development' => 1,
      'JavaScript' => 1,
      'MySQL' => 1,
      'HTML5' => 0,
    }

    gon.skills_keys = skills.keys
    gon.skills_values = skills.values

    # Get github repositories.
    @repos = github_repos('paravibe')
  end
end
