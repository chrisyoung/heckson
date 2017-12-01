describe 'Serverless Tests' do
  let(:pizza_attributes)   { PIZZA_ATTRIBUTES.to_json }
  let(:updated_attributes) do
    PIZZA_ATTRIBUTES.merge(
      name: "Green Pizza",
      id: id
    ).to_json
  end

  describe '#create' do
    it 'returns an id' do
      expect(create[:id]).to_not be_nil
    end
  end

  describe '#read' do
    let(:id) { create[:id] }

    it 'returns an object associated with an id' do
      expect(read[:name]).to eq 'White Pizza'
    end
  end

  describe '#update' do
    let(:id) { create[:id] }
    before { run("update -d '#{updated_attributes}'") }
    it "updates" do
      expect(read[:name]).to eq 'Green Pizza'
    end
  end

  describe '#delete' do
    let(:id) { create[:id] }
    before { run("delete -d '{\"id\": \"#{id}\"}'") }
    it "deletes" do
      expect(read).to be_nil
    end
  end

  private

  def create
    run("create -d '#{pizza_attributes}'")[:body][:result]
  end

  def read
    result = run("read -d '" + { id: id }.to_json + "'")
    return unless result
    result[:body][:result]
  end

  def run(command)
    result = `#{
      [
        "cd example/pizza_builder",
        "&&",
        "serverless invoke local -f",
        "pizzas_#{command}"
      ].join(" ")
    }`

    JSON.parse(result, symbolize_names: true) unless result.include? "null"
  end
end
