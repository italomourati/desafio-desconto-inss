class CreatePreponents < ActiveRecord::Migration[7.1]
  def change
    create_table :preponents do |t|
      t.string :name
      t.string :cpf
      t.date :birth_date
      t.string :address
      t.string :number
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :personal_phone
      t.string :reference_phone
      t.decimal :salary
      t.decimal :inss_discount

      t.timestamps
    end
  end
end
