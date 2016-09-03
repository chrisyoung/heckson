module PizzasHexagon
  module Domain
    describe Pizzas::Query do
      let(:repository) { Pizzas::Repository }

      let(:pizza_attributes) {
        { name:        "The Yuck",
          description: "Tastes worse than it sounds",
          toppings: [
            { name: 'Crickets' }
          ]
        }
      }

      subject { described_class.new(repository: repository) }

      describe '#call' do
        context 'with an id' do
          it '' do
            result = Pizzas::UseCases::Create.new(args: pizza_attributes, repository: repository).call
            expect(subject.call(id: 1)).to be
          end
        end
      end
    end
  end
end
