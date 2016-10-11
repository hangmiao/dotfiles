Pry.config.editor = 'vim'

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'b', '!!!'
  Pry.config.commands.alias_command "wai", "whereami"
end

# Hit Enter to repeat last command
Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end

#Pry.config.commands.import Pry::ExtendedCommands::Experimental


Pry.config.color = true
#Pry.config.theme = "solarized"
