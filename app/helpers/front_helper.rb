module FrontHelper
  def gimage (email, size = '100')
    hash = Digest::MD5.hexdigest(email.downcase)
    image_url = 'http://www.gravatar.com/avatar/' + hash
    image_url += '?s=' + size + '&d=mm'
    return image_url
  end
end
