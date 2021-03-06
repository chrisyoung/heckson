module HecksAdapters
  class SQLDatabase
    module Commands
      class Update
        # Update values
        class UpdateValues
          def initialize(references, attributes, table, id)
            @references = references
            @attributes = attributes
            @reference_ids = {}
            @table = table
            @id = id
          end

          def call
            @references.each do |reference|
              create_new_value(reference)
              delete_old_references(reference)
              link_to_new_values(reference)
            end
          end

          private

          def create_new_value(reference)
            @reference_ids = CreateNewValue.new(
              reference: reference,
              attributes: @attributes,
              reference_ids: @reference_ids
            ).call.reference_ids
          end

          def delete_old_references(reference)
            @attributes = DeleteReferences.new(
              reference: reference,
              table: @table,
              attributes: @attributes
            ).call.attributes
          end

          def link_to_new_values(reference)
            LinkToReferences.new(
              reference: reference,
              table: @table,
              reference_ids: @reference_ids,
              attributes: @attributes,
              id: @id
            ).call
          end
        end
      end
    end
  end
end
