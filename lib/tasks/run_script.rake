require 'date'

desc "Starts the main script"
task :run do
  system "ruby -W0 app/main.rb"
end

desc "Run git add & commit the db/seeds"
namespace :git do
  namespace :seed do
    task :commit do
      system """
        git add db/seeds.rb
        git commit -m 'Update: data #{Date.today}'
      """
    end
  end
end
