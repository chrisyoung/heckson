module PizzasHexagon
  module Domain
    module Pizzas
      class Query
        def initialize(repository: Repository)
          @repository = repository
        end

        def call(params)
          if params.keys == [:id]
            @repository.read(params[:id])
          end
        end
      end
    end
  end
end
