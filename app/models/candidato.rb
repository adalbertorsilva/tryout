class Candidato < ActiveRecord::Base
  validates :nome, :idade, :peso, :altura, :camisa, :contato_emergencia, :email, :telefone, :telefone_contato_emergencia, presence: true
  validates :idade, numericality: {only_integer: true}
  validates :peso, :altura, numericality: true

  has_attached_file :fotografia, styles: { medium: "200x200>" }, default_url: ":rails_root/public/:filename"
  validates_attachment :fotografia, presence: {message: "Por favor insira uma fotografia própria"}
  validates_attachment :fotografia, content_type: { content_type: "image/jpeg" }
end
