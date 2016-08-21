class Ph2
  module Domain
    def self.modules
      constants.map do |module_name|
        module_name.to_s.downcase
      end
    end
  end
end
Dir[File.dirname(__FILE__) + "/domain/**/*.rb"].each { |file| require file }
