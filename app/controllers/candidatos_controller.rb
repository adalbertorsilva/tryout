class CandidatosController < ApplicationController
  require 'base64'

  def index
    @candidato = Candidato.new
  end

  def create
    @candidato = Candidato.new(candidato_params)
    @candidato.pagamento_efetuado = false

    if @candidato.save
      CandidatosMailer.email_confirmacao_inscricao(@candidato).deliver_later
      #convert_file_to_base64(@candidato)
      flash[:notice] = 'Inscrição efetuada com sucesso!'
      redirect_to action: :index
    else
      render action: :index
    end
  end

  private

  def candidato_params
    params.require(:candidato).permit(:fotografia, :nome, :idade, :peso, :altura, :camisa, :contato_emergencia, :email, :telefone, :telefone_contato_emergencia)
  end

  def convert_file_to_base64(candidato)
    Base64.encode(File.open("public/system/candidatos/fotografias/000/000/013/original/nilson.jpeg", "rb").read)
  end

end
