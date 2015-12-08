class CandidatosController < ApplicationController

  def index
    @candidato = Candidato.new
  end

  def create
    @candidato = Candidato.new(candidato_params)
    @candidato.pagamento_efetuado = false

    if @candidato.save
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

end
