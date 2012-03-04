#
# Methods placed in this module can be used inside of any view.
# View helpers allow you to encapsalate complex logic and keep your
# views pristine.
#
module ViewHelpers
  
  # Handy for hiding a block of unfinished code
  def hidden(&block)
    #no-op
  end
  
  # Add your own helpers below...
  def absolute_url
    domain + path
  end
  
  def domain
    "http://kuzn.me"
  end
  
  def path
    URI.parse(request.request_uri).path
  end
  
  def selected?(part)
    if (@selected == part) or Regexp.new(part).match(path)
      true
    else
      false
    end
  end
  
  # Shorthand for referencing images in the images folder
  def image(name, options = {})
    path = "/images/#{name}"
    path += ".png" unless path.match(/.[A-za-z]{3,4}$/)
    image_tag(name, {:alt => ""}.update(options))
  end
  
end