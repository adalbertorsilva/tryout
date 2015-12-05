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
      t.integer :telefone
      t.integer :telefone_contato_emergencia
      t.boolean :pagamento_efetuado
      t.timestamps null: false
    end
  end
end
