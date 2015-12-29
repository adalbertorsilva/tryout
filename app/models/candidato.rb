class Candidato < ActiveRecord::Base
  validates :nome, :idade, :peso, :altura, :camisa, :contato_emergencia, :email, :telefone, :telefone_contato_emergencia, presence: true
  validates :idade, numericality: {only_integer: true}
  validates :peso, :altura, numericality: true

  has_attached_file :fotografia, styles: { original: "200x200>" }, url: "/candidatos/:id/:filename"
  #validates_attachment :fotografia, presence: {message: "Por favor insira uma fotografia própria"}, :on => :create
  validates_attachment :fotografia, content_type: { content_type: "image/jpeg" }, :on => :create
end
