class Candidato < ActiveRecord::Base
  validates :nome, :idade, :peso, :altura, :camisa, :contato_emergencia, :email, :telefone, :telefone_contato_emergencia, :pagamento_efetuado, presence: true
  validates :idade, numericality: {only_integer: true}
  validates :peso, :altura, numericality: true
end
