
# -*- encoding: utf-8 -*-
$:.push('lib')
require "excel_builder/version"

Gem::Specification.new do |s|
  s.name     = "excel_builder"
  s.version  = ExcelBuilder::VERSION.dup
  s.date     = "2012-01-06"
  s.summary  = "connector and jruby sinatra app to generate excel spreadsheets"
  s.email    = "tim@galeckas.com"
  s.homepage = "https://github.com/timgaleckas/excel_builder"
  s.authors  = ['Tim Galeckas']
  
  s.description = <<-EOF
  connector and jruby sinatra app to generate excel spreadsheets
EOF
  
  dependencies = [
    # Examples:
    [:runtime,     "command_recorder",  "~> 0.0.1"],
    [:runtime,     "rest-client",  "~> 1.6.6"]
    # [:development, "rspec", "~> 2.1"],
  ]
  
  s.files         = Dir['**/*']
  s.test_files    = Dir['test/**/*'] + Dir['spec/**/*']
  s.executables   = Dir['bin/*'].map { |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  
  ## Make sure you can build the gem on older versions of RubyGems too:
  s.rubygems_version = "1.8.9"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.specification_version = 3 if s.respond_to? :specification_version
  
  dependencies.each do |type, name, version|
    if s.respond_to?("add_#{type}_dependency")
      s.send("add_#{type}_dependency", name, version)
    else
      s.add_dependency(name, version)
    end
  end
end
