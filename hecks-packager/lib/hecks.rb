require 'bundler'
require 'getoptlong'

Bundler.require

require_relative 'args'
require_relative 'compatibility/fixnum'
require_relative 'app_runner'
require_relative 'query_runner'

load('Hecksfile')

opts = GetoptLong.new(
  [ '--module', '-m', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--command', '-c', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--data', '-d', GetoptLong::REQUIRED_ARGUMENT ]
)

domain_module = ''
command = ''
data = ''
opts.each do |opt, arg|
  case opt
  when '--module'
    domain_module = arg
  when '--command'
    command = arg
  when '--query'
    query = arg
  when '--data'
    data = arg
  end
end

if command == 'read'
  puts HecksPackager::QueryRunner.new(args: [domain_module, command, data], application: HecksApp).call.to_json
else
  puts HecksPackager::AppRunner.new(args: [domain_module, command, data], application: HecksApp).call.result.to_json
end
