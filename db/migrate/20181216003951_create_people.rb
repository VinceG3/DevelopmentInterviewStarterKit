class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.string :first_name
      t.string :last_name
      t.string :display_name
      t.string :email_address
      t.string :phone
      t.string :title
      t.string :city
      t.string :state
      t.string :country
      t.string :person_company_website
    end
  end
end
