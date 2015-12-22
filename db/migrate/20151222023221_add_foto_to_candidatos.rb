class AddFotoToCandidatos < ActiveRecord::Migration
  def change
    add_column :candidatos, :foto, :string
  end
end
