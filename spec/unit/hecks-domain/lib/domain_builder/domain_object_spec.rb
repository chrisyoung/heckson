describe HecksDomainBuilder::DomainObject do
  subject { described_class.new(name: "pizza") }

  let(:name_attribute) {
    HecksDomainBuilder::Attribute.new("name:string")
  }

  describe 'name' do
    it 'lists the name' do
      expect(subject.name).to eq 'pizza'
    end
  end

  describe '#attributes' do
    it 'sets attributes' do
      subject.attributes("name:string")
      expect(subject.attributes).to eq [name_attribute]
    end
  end

  describe '#optional attributes' do
    it 'sets optional attributes' do
      subject.attributes("name:string")
      subject.optional_attributes("name")
      expect(subject.attributes.first.optional?).to eq true
    end
  end

  describe '#read_only_attributes' do
    it 'sets read only attributes' do
      subject.attributes("middle_name:string")
      subject.read_only_attributes("middle_name")
      expect(subject.attributes.first.read_only?).to eq true
    end
  end

  describe '#references' do
    it 'sets references' do
      subject.attributes("chef:chef")
      expect(subject.references.map(&:name)).to eq ['chef']
    end
  end

  describe '#attribute_hash' do
    it 'returns a hash representation of the object' do
      subject.attributes("name:string")
      expect(subject.attribute_hash).to eq name: 'Value'
    end
  end

  describe '#attribute_string' do
    it 'represent the object as a string' do
      subject.attributes("name:string")
      expect(subject.attribute_string).to eq ['name:Value']
    end

    it 'includes a domain module' do
      subject.attributes("pizza:pizzas::pizza")
      expect(subject.attribute_string).to eq ['pizza:Pizzas::Pizza']
    end
  end
end
