# frozen_string_literal: true

module Mutations
    module Companies
        class CreateCompany < Mutations::BaseMutation
            description 'Create a new company.'
            argument :attributes, Types::Companies::CompanyInputType, required: true
            payload_type Types::Companies::CompanyType

            def resolve(attributes:)
                company = ::Companies::Company.new()
                
                company.attributes = attributes.to_h
                if company.save!
                    return company
                else
                    raise ActiveRecord::RecordNotSaved.new("Record could not be saved", company)
                end
            end
        end
    end
end