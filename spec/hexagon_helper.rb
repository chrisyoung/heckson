# frozen_string_literal: true

require 'rack/test'
# require 'rspec'
require 'pry'

require_relative '../lib/hecks/'

require_relative 'pizza_builder/lib/pizza_builder'

RSpec.configure do |config|
  config.after(:each) do
    # Hecks::Adapters::Database::Memory.new.delete_all
  end
end
