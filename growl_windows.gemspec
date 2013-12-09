Gem::Specification.new do |s|
  s.name          = "growl_windows"
  s.version       = "0.1.1"

  s.authors       = "debbbbie"
  s.date          = "2013-12-09"
  s.description   = "Make gem `growl` support windows"
  s.email         = "debbbbie@163.com"
  s.files         = ["growl_windows.gemspec", "lib/growl_windows.rb", "spec/growl_windows_spec.rb", "README.md"]
  s.homepage      = "https://github.com/debbbbie/growl_windows"
  s.require_paths = ["lib"]
  s.summary       = "Make gem `growl` support windows"
  
  
  s.add_dependency "growl"

  s.add_development_dependency "rspec"

end