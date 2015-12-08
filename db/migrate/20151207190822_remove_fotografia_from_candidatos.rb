class RemoveFotografiaFromCandidatos < ActiveRecord::Migration
  def change
    remove_column :candidatos, :fotografia, :string
  end
end
