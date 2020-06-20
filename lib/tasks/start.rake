desc "Starts the main app"
task :start do
  system "ruby -W0 app/main.rb"
end
