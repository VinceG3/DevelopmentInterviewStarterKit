class Person < ApplicationRecord
  class << self
    def fields
      %w[
          created_at updated_at first_name last_name display_name email_address
          phone title city state country person_company_website
        ]
      end

    def cached
      if cache_expired?
        delete_all
        records = SalesloftApiGateway.retrieve_all(:all_people)
        records.map! { |record| record.slice(*fields) }
        create(records)
      end
      all
    end

    def cache_expired?
      # cache invalidation here is just stubbed in here. A real solution might be a redis request
      # on a local instance, or maybe a database request if perf isn't that important atm
      return true if ENV['ALWAYS_PURGE'] == 'true'
      all.blank?
    end
  end
end
