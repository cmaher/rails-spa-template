def makefile(path)
  read_path = File.expand_path(path, "#{__FILE__}/files")
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

makefile '.gitignore'

makefile 'bower.json'
rake 'bower:install'

makefile 'app/assets/javascripts/application.js'
makefile 'app/assets/javascripts/requirejs_config.js'
makefile 'app/assets/javascripts/lib/backbone-pkg.js'
makefile 'app/assets/javascripts/lib/stub.js'

makefile 'app/views/layouts/application.html.erb'
makefile 'app/views/webapp/index.html.erb'

makefile 'app/controllers/webapp_controller.rb'
makefile 'config/routes.rb'

generate 'rspec:install'
makefile 'spec/spec_helper.rb'
makefile 'spec/factories'

generate 'jasmine_rails:install'
makefile 'app/helpers/jasmine_rails/spec_helper.rb'
makefile 'app/views/layouts/jasmine_rails/spec_runner.html.erb'

