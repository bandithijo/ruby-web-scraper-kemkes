desc "Starts the main script"
task :run do
  system "ruby -W0 app/main.rb"
end
