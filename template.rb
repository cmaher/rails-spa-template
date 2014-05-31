def relative_path(path)
  File.expand_path(path, "#{__FILE__}/files")
end

def makefile(path)
  read_path = relative_path(path)
  file path, IO.read(read_path)
end

gem 'requirejs-rails', git: 'git://github.com/jwhitley/requirejs-rails.git'
gem 'bower-rails', '~> 0.7.2'
gem 'sass-rails', '~> 4.0.3'
gem_group :development, :test do
  gem 'rspec-rails', '~> 2.14.2'
  gem 'factory_girl_rails', '~> 4.4.1'
  gem 'jasmine-rails', '~> 0.9.0'
end

application do |config|
    config.generators do |g|
      g.javascripts false
      g.stylesheets false
      g.helper false
      g.template_engine nil

      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: true,
        request_specs: true
    end
end

run 'bundle install'

file '.gitignore', IO.read(relative_path('dot_gitignore')

makefile 'bower.json'
rake 'bower:install'

makefile 'app/assets/javascripts/application.js'
makefile 'app/assets/javascripts/requirejs_config.js'
makefile 'app/assets/javascripts/lib/backbone-pkg.js'
makefile 'app/assets/javascripts/lib/stub.js'


makefile 'app/assets/stylesheets/application.css.scss'
makefile 'app/views/layouts/application.html.erb'
makefile 'app/views/webapp/index.html.erb'

makefile 'app/controllers/webapp_controller.rb'
route "root to:'webapp#index'"
route "get '*path' => 'webapp#index'"

generate 'rspec:install'
makefile 'spec/spec_helper.rb'
file 'spec/factories/.keep'

generate 'jasmine_rails:install'
makefile 'app/helpers/jasmine_rails/spec_helper.rb'
makefile 'app/views/layouts/jasmine_rails/spec_runner.html.erb'
file 'spec/javascripts/spec/.keep'

