describe Hecks::Application::Commands::Create do
  subject do
    described_class.new(
      args: pizza_attributes,
      domain_module: DOMAIN.domain_modules[:Pizzas],
      repository: PizzaBuilder.repositories[:pizzas]
    )
  end

  let(:pizza_attributes) do
    { name: 'White Pizza', chef: { name: "Belleboche" }, description: 'white sauce and chicken', toppings: [{ name: 'chicken' }] }
  end

  describe '#call' do
    it 'returns itself' do
      expect(subject.call.class).to eq described_class
    end
  end

  describe '#id' do
    it 'has an id if the command is successful' do
      expect(subject.call.id).to_not be_nil
    end
  end

  describe '#errors' do
    it 'has errors if validatons fail' do
      pizza_attributes.delete(:description)
      expect(subject.call.errors).to_not be_nil
    end
  end
end