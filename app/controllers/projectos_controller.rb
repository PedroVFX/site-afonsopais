class ProjectosController < ApplicationController
  before_action :proj_participacao, only: [:projectos]

  def projectos
  end

  def proj_participacao
    @participacaos = Participacao.all.order('dialog ASC')
  end

end
