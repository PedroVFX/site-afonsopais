require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do
  
  context "#index" do

    before { get :index }

    it "GET is successful" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "assigns all TextoLancamento as @texto_lancamento" do
      tlanc = FactoryGirl.create(:texto_lancamento)
      expect(assigns[:texto_lancamento]).to eq([tlanc])
    end

    it "assigns all SoundcloudItem as @soundcloud_items" do
      item = FactoryGirl.create(:soundcloud_item)
      expect(assigns[:soundcloud_items]).to eq([item])
    end

    it "assigns all VimeoItem as @vimeo_items" do
      item = FactoryGirl.create(:vimeo_item)
      expect(assigns[:vimeo_items]).to eq([item])
    end

    it "assigns all YoutubeItem as @youtube_items" do
      item = FactoryGirl.create(:youtube_item)
      expect(assigns[:youtube_items]).to eq([item])
    end


  end
end
