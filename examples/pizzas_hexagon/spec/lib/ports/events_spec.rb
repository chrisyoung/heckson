class TestListener
  def self.some_event(command)
  end
end

describe PizzasHexagon::Ports::Events do
  let(:listener) { TestListener }
  let(:command)  { double("SomeCommand") }
  subject { described_class.new(listeners: [listener])}

  describe '#send' do
    it 'calls the event as a method on listeners' do
      expect(listener).to receive(:some_event).with(command)
      subject.send(event: :some_event, command: command)
    end
  end
end
