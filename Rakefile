require 'rubygems'
require 'hoe'
require File.expand_path(File.join(File.dirname(__FILE__), "/lib/multi_rails"))
load File.expand_path(File.join(File.dirname(__FILE__), "/tasks/multi_rails.rake"))

Hoe.new('multi_rails', MultiRails::VERSION) do |p|
  p.rubyforge_name = 'multi-rails'
  p.author = 'Relevance'
  p.email = 'multi_rails@googlegroups.com'
  p.summary = 'Testing tool to easily test agaist multiple versions of Rails.'
  p.description = p.paragraphs_of('README.txt', 0..10).join("\n\n")
  p.url = 'http://multi-rails.rubyforge.org/'
  p.changes = p.paragraphs_of('History.txt', 0..1).join("\n\n")
  p.remote_rdoc_dir = '' # Release to root
  p.test_globs = 'test/**/*_test.rb' # we use the foo_test convention
  p.spec_extras[:require_paths] = ['lib', 'tasks']
end

desc "Copy trunk to stable tag in SVN to make things easy for Rails plugin installation."
task :copy_stable do
  trunk_dir  = "~/src/relevance/opensource/multi_rails/trunk/"
  stable_dir = "~/src/relevance/opensource/multi_rails/tags/stable/multi_rails/"
  puts %x[rsync --exclude='.svn' -r #{trunk_dir} #{stable_dir}]
  puts %x[svn ci #{stable_dir} -m 'Release to stable from trunk.']
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