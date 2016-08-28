Gem::Specification.new do |s|
  s.name        = 'pizza_hexagon'
  s.version     = '0.0.0'
  s.date        = '2016-08-27'
  s.summary     = "Pizza Hexagon"
  s.description = "A domain library"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'

  s.add_dependency 'sinatra'
  s.add_dependency 'rspec'
  s.add_dependency 'guard-rspec'
  s.add_dependency 'simplecov'
  s.add_dependency 'activesupport'
  s.add_dependency 'dry-validation'
  s.add_dependency 'activerecord'
  s.add_dependency 'mysql2'
end
