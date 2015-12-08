class CreateCandidatos < ActiveRecord::Migration
  def change
    create_table :candidatos do |t|
      t.string :fotografia
      t.string :nome
      t.integer :idade
      t.decimal :peso
      t.decimal :altura
      t.string :camisa
      t.string :contato_emergencia
      t.string :email
      t.decimal :telefone, precision: 11
      t.decimal :telefone_contato_emergencia, precision: 11
      t.boolean :pagamento_efetuado
      t.timestamps null: false
    end
  end
end
