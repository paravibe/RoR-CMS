module FrontHelper
  def gimage (email, size = '100')
    hash = Digest::MD5.hexdigest(email.downcase)
    image_url = 'http://www.gravatar.com/avatar/' + hash
    image_url += '?s=' + size + '&d=mm'
    return image_url
  end

  def github_repos (user)
    github = Github.new
    repos = github.repos.list user: user

    repositories = []

    if repos.success?
      repositories = repos.to_ary
    end

    return repositories
  end
end
