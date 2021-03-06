module SoccerSeason
  module Domain
    module Fixtures
      class TeamReference
        attr_accessor :id, :referenced_entity

        def self.factory(group_attributes)
          return if group_attributes.nil?
          return TeamReference.new(group_attributes) unless group_attributes.is_a?(Array)
          group_attributes.map do |attributes|
            TeamReference.new(attributes)
          end
        end

        def initialize(attributes={})
          @id = attributes[:id]
          @referenced_entity = Teams::Team
        end

        def to_json(config)
          JSON.generate({id: @id, referenced_entity: @referenced_entity})
        end
      end
    end
  end
end
