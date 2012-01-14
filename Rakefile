require 'rubygems'
require 'rake/gempackagetask'

spec = Gem::Specification::new do |spec|
  spec.name = "oldskool"
  spec.version = "0.0.1"
  spec.platform = Gem::Platform::RUBY
  spec.summary = "oldskool"
  spec.description = "description: Pluggable web command line"

  spec.files = FileList["lib/**/*.rb", "views/**/*", "public/**/*", "config/oldskool.yaml.dist", "config.ru", "Gemfile", "Gemfile.lock"]
  spec.executables = []

  spec.require_path = "lib"

  spec.has_rdoc = false
  spec.test_files = nil
  spec.add_dependency 'sinatra'
  spec.add_dependency 'bundler'

  spec.extensions.push(*[])

  spec.author = "R.I.Pienaar"
  spec.email = "rip@devco.net"
  spec.homepage = "http://devco.net/"
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_zip = false
  pkg.need_tar = false
end
