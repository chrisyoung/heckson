module PizzasHexagon
  module Adapters
    module ResourceServer
      class Methods
        class Delete
          def initialize(hexagon:)
            @hexagon = hexagon
          end

          def call(id:, module_name:)
            @id          = id.to_i
            @module_name = module_name.to_sym
            run_command
            [JSON.generate(command_result.to_h) + "\n\n"]
          end

          def status
            return 500 if command_result.errors.count > 0
            return 200
          end

          private

          attr_reader :hexagon, :module_name, :id, :command_result

          def run_command
            @command_result = hexagon.call(
              module_name: module_name,
              command: :delete,
              args: { id: id })
          end
        end
      end
    end
  end
end