describe HecksApplication::Commands::Create do
  subject do
    described_class.new(
      args: PIZZA_ATTRIBUTES.merge(id: 'some_id'),
      domain_module: DOMAIN.domain_modules[:Pizzas],
      repository: PizzaBuilder.repositories[:pizzas]
    )
  end

  let(:pizza_attributes) do
    PIZZA_ATTRIBUTES.clone
  end

  describe '#call' do
    it 'returns itself' do
      expect(subject.call.class).to eq described_class
    end
  end

  describe '#id' do
    it 'has an id if the command is successful' do
      subject.args[:id] = "testid"
      result = subject.call()
      expect(result.id).to_not be_nil
    end
  end

  describe '#errors' do
    it 'has errors if validatons fail' do
      pizza_attributes.delete(:description)
      expect(subject.call.errors).to_not be_nil
    end
  end
end
