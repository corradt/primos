class MerchantsController < ApplicationController
  before_action :set_merchant, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @merchants = Merchant.all
    respond_with(@merchants)
  end

  

  def update
   @merchant.update_attributes({:doc => Caat.exists_grossisti_agricoli_page})
   respond_with(@merchant)
  end

  def doc=(val)
  val.css("tr", "tr.even","tr.odd").each do |riga| 
       next unless specie=riga.css("td[data-title='Specie']")[0]
       next unless varieta=riga.css("td[data-title='Varietà']")[0] 
       next unless pmin=riga.css("td[data-title='P. Min']")[0] 
       next unless ppre=riga.css("td[data-title='P. Pre']")[0] 
       next unless pmax=riga.css("td[data-title='P. Max']")[0] 
       next unless calibro=riga.css("td[data-title='Calibro']")[0] 
       next unless categoria=riga.css("td[data-title='Cat.']")[0] 
       next unless origine=riga.css("td[data-title='Origine']")[0] 
       next unless unitamisura=riga.css("td[data-title='Unita misura']")[0] 
       next unless gruppo=riga.css("td[data-title='Gruppo']")[0]
      
    @merchant.assign_attributes(stand:stand.content, ragioneSociale:ragSociale.content, telefono:phone.content, fax:fax.content , referente: ref.content)
      
  end
end

  def destroy
    @merchant.destroy
    respond_with(@merchant)
  end

  private
    def set_merchant
      @merchant = Merchant.find(params[:id])
    end

    def merchant_params
      params.require(:merchant).permit(:stand, :ragioneSociale, :telefono, :fax, :referente)
    end
end
