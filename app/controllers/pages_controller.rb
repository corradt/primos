class PagesController < ApplicationController
  before_action :authenticate_user!,only: [:prezzi_mercato_agricolo, :prezzi_mercato_ittico, :grossisti_agricoli]
  

  def home
          	#if current_user
          	#	redirect_to pages_prezzi_mercato_agricolo_path
          	#end 
  end


  def prezzi_mercato_agricolo
  
  end
  def prezzi_mercato_ittico
  
  end

  def grossisti_agricoli

  end

  def prova
  end 

  def test
  end
end
