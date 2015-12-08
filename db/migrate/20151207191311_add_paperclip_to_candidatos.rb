class AddPaperclipToCandidatos < ActiveRecord::Migration
  def change
    add_attachment :candidatos, :fotografia
  end
end
