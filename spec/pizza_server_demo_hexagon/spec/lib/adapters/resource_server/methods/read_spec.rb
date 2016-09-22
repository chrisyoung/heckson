module PizzaServerDemoHexagon
  module Adapters
    module ResourceServer
      describe Methods::Read do
        subject          { described_class.new(hexagon: hexagon) }
        let(:hexagon)    { PizzaServerDemoHexagon::App.new }

        let(:attributes) {
          {
            name:        "The Yuck",
            children:    ['Crickets']
          }
        }

        before do
          hexagon.call(command: :create, module_name: :test, args: attributes)
        end

        describe '#call' do
          it 'can read a test entity from the database' do
            result = subject.call(id: 1, module_name: :test)
            expect(JSON.parse(result.first)['name']).to eq 'The Yuck'
          end
        end
      end
    end
  end
end
