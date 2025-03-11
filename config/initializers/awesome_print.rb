require 'awesome_print'

AwesomePrint.irb! if defined?(Rails::Console)

if defined?(Pry)
  require 'ap'
  Pry.config.print = proc { |output, value| output.puts value.ai }
else
  if defined?(IRB)  # Verifica se IRB está disponível antes de usá-lo
    IRB.conf[:INSPECT_MODE] = false
    IRB.conf[:AP_NAME] = 'ap'
  end
end
