class WelcomeController < ApplicationController
  before_action :youtube_items, :soundcloud_items, :texto_lancamento, :vimeo_items, only: [:index] 

  # GET /welcome
  def index

  end

  def youtube_items
    @youtube_items = YoutubeItem.all
  end

  def vimeo_items
    @vimeo_items = VimeoItem.all
  end

  def soundcloud_items
    @soundcloud_items = SoundcloudItem.all
  end

  def texto_lancamento
    @texto_lancamento = TextoLancamento.all
  end


end
