#############################################################################
#
# Modified version of jekyllrb Rakefile
# https://github.com/jekyll/jekyll/blob/master/Rakefile
#
# Note that line 19 has been commented out, not sure what it's original purpose is
#############################################################################

require 'rake'
require 'date'
require 'parallel'
require 'cucumber/rake/task'
require 'yaml'


CONFIG = YAML.load(File.read('_config.yml'))
USERNAME = CONFIG["username"]
REPO = CONFIG["repo"]
SOURCE_BRANCH = CONFIG["branch"]
DESTINATION_BRANCH = CONFIG["branch"]

# NEW for browser stack
Cucumber::Rake::Task.new(:single) do |task|
  ENV['CONFIG_NAME'] ||= "single"
  task.cucumber_opts = ['--format=pretty', 'features/page.feature']
end

task :default => :single

Cucumber::Rake::Task.new(:local) do |task|
  task.cucumber_opts = ['--format=pretty', 'features/local.feature', 'CONFIG_NAME=local']
end

task :parallel do |t, args|
  @num_parallel = 4

  Parallel.map([*1..@num_parallel], :in_processes => @num_parallel) do |task_id|
    ENV["TASK_ID"] = (task_id - 1).to_s
    ENV['name'] = "parallel_test"
    ENV['CONFIG_NAME'] = "parallel"

    Rake::Task["single"].invoke
    Rake::Task["single"].reenable
  end
end


task :test do |t, args|
  Rake::Task["single"].invoke
  Rake::Task["single"].reenable
  Rake::Task["local"].invoke
  Rake::Task["parallel"].invoke
end
# END NEW for browser stack

def check_destination
  unless Dir.exist? CONFIG["destination"]
    sh "git clone https://$GIT_NAME:$GH_TOKEN@github.com/#{USERNAME}/#{REPO}.git #{CONFIG["destination"]}"
  end
end

namespace :site do
  desc "Generate the site"
  task :build do
    check_destination
    sh "bundle exec jekyll build"
  end

  desc "Generate the site and serve locally"
  task :serve do
    check_destination
    sh "bundle exec jekyll serve"
  end

  desc "Generate the site, serve locally and watch for changes"
  task :watch do
    sh "bundle exec jekyll serve --watch"
  end

  desc "Generate the site and push changes to remote origin"
  task :deploy do
    # Detect pull request
    if ENV['TRAVIS_PULL_REQUEST'].to_s.to_i > 0
      puts 'Pull request detected. Not proceeding with deploy.'
      exit
    end

    # Configure git if this is run in Travis CI
    if ENV["TRAVIS"]
      sh "git config --global user.name $GIT_NAME"
      sh "git config --global user.email $GIT_EMAIL"
      sh "git config --global push.default simple"
    end

    # Make sure destination folder exists as git repo
    check_destination

    sh "git checkout #{SOURCE_BRANCH}"
    Dir.chdir(CONFIG["destination"]) { sh "git checkout #{DESTINATION_BRANCH}" }

    # Generate the site
    sh "bundle exec jekyll build"

    # Commit and push to github
    sha = `git log`.match(/[a-z0-9]{40}/)[0]
    Dir.chdir(CONFIG["destination"]) do
      # check if there is anything to add and commit, and pushes it
      sh "if [ -n '$(git status)' ]; then
            git add --all .;
            git commit -m 'Updating to #{USERNAME}/#{REPO}@#{sha}.';
            git push --quiet origin #{DESTINATION_BRANCH};
         fi"
      puts "Pushed updated branch #{DESTINATION_BRANCH} to GitHub Pages"
    end
  end
end