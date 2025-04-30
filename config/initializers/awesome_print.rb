if defined?(Rails::Console)
  require "awesome_print"
  require "irb"
  AwesomePrint.irb!
  IRB.conf[:INSPECT_MODE] = false
end
