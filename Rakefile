require 'rubygems'
require 'echoe'
require File.expand_path(File.join(File.dirname(__FILE__), "/lib/multi_rails"))
load File.expand_path(File.join(File.dirname(__FILE__), "/tasks/multi_rails.rake"))

Echoe.new('multi_rails') do |p|
  p.version = MultiRails::VERSION
  p.rubyforge_name = 'thinkrelevance'
  p.author = ['Rob Sanheim', 'Relevance']
  p.email = 'multi_rails@googlegroups.com'
  p.summary = 'Testing tool to easily test agaist multiple versions of Rails.'
  p.description = "MultiRails allows easy testing against multiple versions of Rails for your Rails specific gem or plugin.  It also has tentative support testing Rails applications against multiple versions of Rails."
  p.url = 'http://multi-rails.rubyforge.org/'
  p.rdoc_pattern = /^(lib|bin|ext)|txt|rdoc|CHANGELOG|MIT-LICENSE$/
  rdoc_template = `allison --path`.strip << ".rb"
  p.test_pattern = 'test/**/*_test.rb'
  p.eval = lambda { self.require_paths = ['lib', 'tasks'] }
  p.manifest_name = 'manifest.txt'
end

desc "Convert the readme from markdown to html to prep for posting on blog/email/whatever."
task :email_to_html => :email do
  require 'redcloth'
  RedCloth::DEFAULT_RULES.replace [:markdown, :textile]
  
  email = File.read("email.txt")
  html = RedCloth.new(email).to_html
  html = text_helper.auto_link(html)
  File.open("email.html", "w") do |f|
    f << html
  end
end

desc "Do a full release of the multi_rails, including copying to stable tag, pushing docs and prepping for blog/annoucement."
task :full_release => [:require_version, :copy_stable, :publish_docs, :email_to_html, :release]

desc "Must supply the VERSION env var"
task :require_version do
  raise "You must supply a VERSION=x.x.x environment var to release!" unless ENV["VERSION"]
end

# it should be easier then this to do some g'd autolinking
def text_helper
  gem 'actionpack'
  require 'action_controller' # bringing this in for autolinks
  helper = Object.new
  helper.extend ActionView::Helpers::TextHelper
  helper.extend ActionView::Helpers::TagHelper
  helper
end