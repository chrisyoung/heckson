module HecksPlugins
  class JSONValidator
    # Create a JSON Schema from an object
    class SchemaParser
      attr_reader :schema
      JSON_TYPES = %w{string number object array boolean null}
      HECKS_NUMBER_TYPES = %w{integer currency}

      def initialize domain_module:, object:
        @domain_module = domain_module
        @object =        object
        @properties =    {}
      end

      def call
        parse_required_fields
        object.attributes.each { |a| parse_property(a) }
        build_schema
        self
      end

      private

      attr_reader :required_fields, :object, :properties, :domain_module

      def build_schema
        @schema = {
          "type"       => "object",
          "required"   => required_fields,
          "properties" => properties
        }
      end

      def parse_required_fields
        @required_fields = object.attributes.map{ |a| a.name }
      end

      def get_json_type attribute
        result = attribute.type.downcase
        return 'array'  if attribute.list?
        return 'number' if HECKS_NUMBER_TYPES.include?(result)
        return 'object' unless JSON_TYPES.include?(result)

        result
      end

      def schema_for_attribute attribute
        return {} if attribute.reference?
        self.class.new(
          domain_module: domain_module,
          object: domain_module.find(attribute.type)
        ).call.schema
      end

      def parse_property(attribute)
        type = get_json_type(attribute)
        name = attribute.name
        properties[name] =
          case type
          when 'object' then schema_for_attribute(attribute)
          when 'array'
            {
              "type"  => 'array',
              "items" => schema_for_attribute(attribute)
            }
          else { "type" => type }
          end
      end
    end
  end
end
