module PizzaServerHexagon
  module Schemas
    module Test
      Update = Dry::Validation.Schema do
        # required(:name).filled(:str?)
        # required(:description).filled(:str?)
        # required(:toppings).each(:str?)
      end
    end
  end
end
