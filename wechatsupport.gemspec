# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require 'wechat/version'

Gem::Specification.new do |s|
  s.name = %q{wechatsupport}
  s.version = Wechat::VERSION
  s.author = "Justice Jiang"
  s.license = "MIT"
  s.email = "jgnan1981@163.com"
  s.platform    = Gem::Platform::RUBY
  s.homepage    = "http://github.com/jgnan1981/wechatsupport"
  s.summary = %q{微信公众平台API实现支持}
  s.description = %q{此项目用于帮助公众平台开发者快速接入公众平台}

  s.files = Dir["{lib,app,config,spec,vendor}/**/*", "[A-Z]*"] - ["Gemfile.lock"]
  s.require_paths = ["lib"]
  s.required_ruby_version = '>= 2.1.0'

  s.add_development_dependency 'rspec', '~> 2.6', '>= 2.6.0'
  s.add_development_dependency 'railties','~> 4.1.6', '>= 4.1.6'
  s.add_dependency 'rest-client','~> 1.7', '>= 1.7.2'

  s.rubyforge_project = s.name
  #s.required_rubygems_version = ">= 1.3.4"
end
