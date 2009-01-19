# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{multi_rails}
  s.version = "0.0.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rob Sanheim, Relevance"]
  s.date = %q{2009-01-19}
  s.default_executable = %q{multi_rails_runner.rb}
  s.description = %q{MultiRails allows easy testing against multiple versions of Rails for your Rails specific gem or plugin.  It also has tentative support testing Rails applications against multiple versions of Rails.}
  s.email = %q{multi_rails@googlegroups.com}
  s.executables = ["multi_rails_runner.rb"]
  s.extra_rdoc_files = ["bin/multi_rails_runner.rb", "CHANGELOG", "credits.txt", "lib/multi_rails/config.rb", "lib/multi_rails/core_extensions.rb", "lib/multi_rails/loader.rb", "lib/multi_rails/multi_rails_error.rb", "lib/multi_rails/rails_app_helper.rb", "lib/multi_rails.rb", "lib/multi_rails_init.rb", "MIT-LICENSE", "README.rdoc"]
  s.files = ["autotest.rb", "bin/multi_rails_runner.rb", "CHANGELOG", "credits.txt", "install.rb", "lib/multi_rails/config.rb", "lib/multi_rails/core_extensions.rb", "lib/multi_rails/loader.rb", "lib/multi_rails/multi_rails_error.rb", "lib/multi_rails/rails_app_helper.rb", "lib/multi_rails.rb", "lib/multi_rails_init.rb", "Manifest", "MIT-LICENSE", "multi_rails.gemspec", "Rakefile", "README.rdoc", "tasks/load_multi_rails_rake_tasks.rb", "tasks/multi_rails.rake", "test/autotest/railsplugin.rb", "test/config_test.rb", "test/core_extensions_test.rb", "test/install_test.rb", "test/loader_test.rb", "test/multi_rails_init_test.rb", "test/multi_rails_test_helper.rb", "test/rails_app_helper_test.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/relevance/multi_rails/}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Multi_rails", "--main", "README.rdoc"]
  s.require_paths = ["lib", "tasks"]
  s.rubyforge_project = %q{thinkrelevance}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Testing tool to easily test agaist multiple versions of Rails.}
  s.test_files = ["test/config_test.rb", "test/core_extensions_test.rb", "test/install_test.rb", "test/loader_test.rb", "test/multi_rails_init_test.rb", "test/rails_app_helper_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end
