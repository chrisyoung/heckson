# Test subcommands
class Test < Thor
  include Thor::Actions

  class_option :no_cache, aliases: '-n', desc: 'download resources', default: false, type: :boolean

  desc 'ci', 'Run and test the generators'
  def ci
    examples
    domain_adapters
  end

  desc 'domain_adapters', "run the domain adapter specs"
  def domain_adapters
    generate_resource_server('pizza_builder')
    generate_sql_database('pizza_builder')
  end

  desc 'examples', 'Generate and run the example specs'
  def examples
    reset_example('pizza_builder')
    run('rspec -f d')
  end

  private

  def generate_sql_database(name)
    run("cd ../example/#{name} && hecks generate sql_database")
  end

  def reset_example(name)
    run("cd ../example/#{name} && rm -rf lib")
    run("cd ../example/#{name} && rm -rf spec")
    run("cd ../example/#{name} && hecks new")
  end

  def generate_resource_server(name)
    run("cd ../example/#{name} && rm -rf config.ru")
    run("cd ../example/#{name} && hecks generate resource_server")
    run("cd ../example/#{name}")
  end
end
