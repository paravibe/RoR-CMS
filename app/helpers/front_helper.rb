module FrontHelper
  def get_gimage (email, size = '100')
    hash = Digest::MD5.hexdigest(email.downcase)
    image_url = 'http://www.gravatar.com/avatar/' + hash
    image_url += '?s=' + size + '&d=mm'
    return image_url
  end

  def get_github_repos (user)
    repositories = []

    github = Github.new

    begin
      repos = github.repos.list user: user
      if repos.success?
        repositories = repos.to_ary
      end
    rescue Exception => exception
      STDERR.puts "General error loading repositories: #{exception.message}"
    end

    return repositories
  end

  def set_skills_data
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

    # Set variables to page.
    gon.skills_keys = skills.keys
    gon.skills_values = skills.values
  end

  def get_social_links(profile)
    links = {}

    if !profile.nil?
      social = ['github', 'drupal', 'linkedin']
      social.each do |v|
        if !profile[v].nil? && !profile[v].empty?
          links[v] = profile[v]
        end
      end
    end

    return links
  end
end
