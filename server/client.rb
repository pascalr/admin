# client.rb
require 'drb/drb'
DRb.start_service
remote_object = DRbObject.new_with_uri('druby://localhost:9999')

puts remote_object.greet   #=> 'Hello, world!'
