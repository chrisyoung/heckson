require 'Date'
Gem::Specification.new do |s|
  version = File.read("../hecks-application/lib/Version").gsub("\n", '')
  s.name        = 'hecks-logger'
  s.homepage    = "https://github.com/chrisyoung/hecks"
  s.version     = version
  s.date        = Date.today
  s.summary     = "Logging support for Hecks applications"
  s.description = "Hecks Logger"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'
end