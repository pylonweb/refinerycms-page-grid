# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-page-grid'
  s.version           = '1.1'
  s.description       = 'Ruby on Rails Page Grid extension for Refinery CMS'
  s.date              = '2013-02-05'
  s.summary           = 'Page Grid extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.authors           = ['Johan Frølich']
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.9'
  s.add_dependency             'refinerycms-pages',   '~> 2.0.9'
  s.add_dependency             'coffee-rails',        '~> 3.2.1'
  s.add_dependency             'sass-rails',          '~> 3.2.3'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.9'
end
