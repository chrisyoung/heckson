# frozen_string_literal: true
require_relative 'commands/generate/new'
require_relative 'commands/test'
require_relative 'commands/generate'
require_relative 'commands/build'
require_relative 'commands/console'
require 'active_support/inflector'
require 'pry'
require_relative 'builder'

module Hecks
  class CLI < Thor
    package_name 'hecks'

    desc 'generate:domain_object', 'generate domain objects'
    method_option :type,
                  aliases:  '-t',
                  required: true,
                  desc:     'The type of the domain object you want to generate',
                  banner:   '[OBJECT_TYPE]',
                  enum:     %w(entity value_object aggregate reference)
    register GenerateDomainObject, 'generate:domain_object', 'generate:domain_object', 'Generate Domain Objects'

    desc 'generate:resource_server', 'generate resource_server'
    register GenerateResourceServer, 'generate:resource_server', 'generate:resource_server', 'Generate A Resource Server for a domain'

    long_desc     'A domain'
    method_option :dryrun,
                  aliases:  '-d',
                  type:     :boolean,
                  desc:     'Output commands without running'

    register Commands::New, 'new', 'new', 'Create a new Domain'
  end
end