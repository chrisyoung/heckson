describe PizzaBuilder::Domain::Pizzas::SQLRepository do
  let(:pizza_attributes) do
    {
      name: 'White Pizza',
      chef: { name: "Belleboche" },
      description: 'white sauce and chicken',
      toppings: [{ name: 'chicken' }]
    }
  end

  describe '#create' do
    it do
      result = described_class.create(
        attributes: pizza_attributes,
        domain_module: DOMAIN.domain_modules[:Pizzas]
      )

      expect(result.id).to_not be_nil
    end
  end

  describe '#read' do
    it do
      result = described_class.create(
        attributes: pizza_attributes,
        domain_module: DOMAIN.domain_modules[:Pizzas]
      )

      pizza = described_class.read(result.id)
      expect(pizza.id).to eq result.id
    end
  end

  describe '#update' do
    it do
      create_result = described_class.create(
        attributes: pizza_attributes,
        domain_module: DOMAIN.domain_modules[:Pizzas]
      )

      update_result = described_class.update(
        pizza_attributes.merge(
          id: create_result.id,
          name: "Belleboche Redux",
          toppings: [{name: "Sausage"}],
          chef: {name: "Kathy Griffen"})
      )

      pizza = described_class.read(create_result.id)

      expect(pizza.name).to eq "Belleboche Redux"
      expect(pizza.toppings.map(&:name)).to eq ["Sausage"]
      expect(pizza.chef.name).to eq "Kathy Griffen"
    end
  end
end