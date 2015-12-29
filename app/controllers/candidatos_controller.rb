class CandidatosController < ApplicationController
  require 'base64'

  skip_before_filter :verify_authenticity_token, only: :create_remote
  skip_before_action :verify_authenticity_token, only: :create_remote

  def index
    @candidato = Candidato.new
  end

  def create
    @candidato = Candidato.new(candidato_params)
    @candidato.pagamento_efetuado = false

    if @candidato.save

      unless @candidato.fotografia.file?
        @candidato.errors.add(:fotografia, "Por favor insira uma fotografia própria")
        render action: :index
      else
        @candidato.update(foto: convert_file_to_base64(@candidato))
        CandidatosMailer.email_confirmacao_inscricao(@candidato).deliver_later
        flash[:notice] = 'Inscrição efetuada com sucesso!'
        render "sucesso.html.erb"
      end

    else
      render action: :index
    end

  end

  def create_remote
    @candidato = Candidato.new(candidato_params)
    @candidato.save!

    unless @candidato.pagamento_efetuado
      CandidatosMailer.email_confirmacao_inscricao(@candidato).deliver_later
    end

    render nothing: true
  end

  private

  def candidato_params
    params.require(:candidato).permit(:fotografia, :nome, :idade, :peso, :altura, :camisa, :contato_emergencia, :email, :telefone, :telefone_contato_emergencia, :foto, :pagamento_efetuado)
  end

  def convert_file_to_base64(candidato)
    Base64.encode64(open("public/candidatos/"+@candidato.id.to_s+"/"+@candidato.fotografia.original_filename, "rb").read)
  end

end
