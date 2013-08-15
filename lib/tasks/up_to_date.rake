namespace :deps do

  def intersection
    return @outdated if @outdated
    @outdated = `bundle outdated` # run bundle outdated
    @outdated = @outdated.split("\n").select{|line| line.include?("*")} # all the gems in the Gemfile.lock that are outdated
    @outdated = @outdated.map{|gem| gem.match(/\* ([a-zA-Z0-9_-]+) /)[1]} # remove everything from the entry that isn't the gem's name

    app_gems = File.readlines("Gemfile").select{|line| line.include?("gem ")} #all the gems in the Gemfile
    app_gems = app_gems.map{|gem| gem.match(/gem '([a-zA-Z0-9_-]+)/)[1]} # remove everything from the entry that isn't the gem's name

    @outdated = @outdated.select{|outdated_gem| app_gems.include?(outdated_gem)} #select the gems that are outdated that also appear in the Gemfile
  end

  desc "Update each gem in 'bundle outdated' if it also appears in the Gemfile and run rake after each update"
  task :update do
    if intersection.any?
      puts "Outdated gems that we depend on:\n#{intersection.join("\n")}\n"
      intersection.each do |gem|
        puts "Updating #{gem}"
        puts `bundle update #{gem}`
        puts `bundle exec rake`
        if $? == 0
          puts `git add Gemfile.lock`
          puts `git commit -m "update #{gem} gem"`
        else
          puts "The tests failed for gem: #{gem}"
          puts `git checkout Gemfile.lock`
        end
      end
    else
      puts "Nothing outdated."
    end
  end

  desc "Show the gems from 'bundle outdated' that also appear in the Gemfile"
  task :outdated do
    if intersection.any?
      puts "Outdated gems that we depend on:\n#{intersection.join("\n")}\n"
    else
      puts "Nothing outdated."
    end
  end
end
