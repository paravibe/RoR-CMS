module FrontHelper
  def gimage (email)
    hash = Digest::MD5.hexdigest(email.downcase);
    return 'http://www.gravatar.com/avatar/' + hash
  end
end
