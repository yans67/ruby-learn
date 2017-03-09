!#usr/bin/env ruby
require 'delegate'
class Assistant
  def initialize(name)
    @name = name
    puts "I'm #{name}'s personal assister"
  end
  def check_mail
    puts "#{name} "
  end
  
end