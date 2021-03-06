$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "errors-renderer"
  s.version     = "0.0.6"
  s.authors     = ["Sebastien Rosa"]
  s.email       = ["sebastien@demarque.com"]
  s.extra_rdoc_files = ["LICENSE", "README.md"]
  s.licenses    = ["MIT"]
  s.homepage    = "https://github.com/demarque/errors-renderer"
  s.summary     = ""
  s.description = ""

  s.rubyforge_project = "errors-renderer"

  s.files         = Dir.glob('{lib,spec}/**/*') + %w(LICENSE README.md Rakefile Gemfile)
  s.require_paths = ["lib"]

  s.add_development_dependency('rails', '~> 4.2')
  s.add_development_dependency('rake', '~> 13.0')
  s.add_development_dependency('rspec', '~> 3.4')
end
