class CandidatosMailer < ApplicationMailer

  default from: 'sacbelemtitans@gmail.com'

  def email_confirmacao_inscricao(candidato)
    @candidato = candidato
    mail(to: @candidato.email, subject: 'Confirmação de Inscrição')
  end

end
