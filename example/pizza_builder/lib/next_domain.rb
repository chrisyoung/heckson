require_relative 'next_domain/domain_object_methods/entity'
require_relative 'next_domain/domain_object_methods/value'
require_relative 'next_domain/domain_object_methods/subtypes'
require_relative 'next_domain/domain_object'
require_relative 'next_domain/domain_object_methods'
require_relative 'next_domain/aggregate'

class NextDomain
  attr_reader :name
  def initialize(name, &block)
    @name = name
    @aggregates = []
    @files = []
    instance_eval &block
  end

  def aggregate(name, &block)
    @aggregates << Aggregate.new(name, self, &block)
  end

  def activate(arg=nil)
    @files << ERB.new(File.open(File.dirname(__FILE__) + '/next_domain/templates/domain.erb').read).result(binding)
    @aggregates.each do |aggregate|
      @files << ERB.new(File.open(File.dirname(__FILE__) + '/next_domain/templates/aggregate.erb').read).result(aggregate.get_binding)
      aggregate.domain_objects.each do |domain_object|
        @files << ERB.new(File.open(File.dirname(__FILE__) + '/next_domain/templates/domain_object.erb').read, nil, '-').result(domain_object.get_binding)
      end
    end
    @files.each do |file|
      TOPLEVEL_BINDING.eval file
    end
    self
  end

  def print
    @files.each do |file|
      puts file
    end
  end
  class Entity < DomainObject;end
  class ValueObject < DomainObject;end  

end

def next_domain name, &block
  NextDomain.new name, &block
end