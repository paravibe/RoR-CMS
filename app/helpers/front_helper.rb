module FrontHelper
  def gimage (email, size = '100')
    hash = Digest::MD5.hexdigest(email.downcase)
    image_url = 'http://www.gravatar.com/avatar/' + hash
    image_url += '?s=' + size + '&d=mm'
    return image_url
  end

  def github_repos (user)
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
end
