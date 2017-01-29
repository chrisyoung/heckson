describe Hecks::DomainBuilder::DomainObject do
  subject { described_class.new(name: "pizza") }
  describe 'name' do
    it 'lists the name' do
      expect(subject.name).to eq 'pizza'
    end
  end
  describe 'attributes' do
    it 'sets attributes' do
      subject.attributes("name:value")
      expect(subject.attributes).to eq ['name:value']
    end
  end
end