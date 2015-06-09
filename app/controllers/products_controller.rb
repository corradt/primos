class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

 
  respond_to :html

  def index
    @products = Product.all
    respond_with(@products)
  end

  def update
    @product.update_attributes({:doc => Caat.exists_prezzi_torino_page})
    
    respond_with(@product)
  end
 
  def destroy
    @product.destroy
    respond_with(@product)
  end
 
  def doc=(val)
    val.css("tr", "tr.even","tr.odd").each do |riga|
         next unless stand=riga.css("td.views-field" ".views-field-field-stand")[0]
         next unless ragSociale=riga.css("td.views-field" ".views-field-title")[0] 
         next unless phone=riga.css("td.views-field" ".views-field-field-phone")[0]
         next unless fax=riga.css("td.views-field" ".views-field-field-fax")[0] 
         next unless ref=riga.css("td.views-field" ".views-field-field-ref")[0] 
        
      @product.assign_attributes(name:specie.content,variety:varieta.content, minPrice:pmin.content, 
                             medPrice: ppre.content, maxPrice:pmax.content, calibro: calibro.content, 
                             category:categoria.content , origin:origine.content, unitOfMisure:unitamisura.content, 
                             group: gruppo.content )
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end
 
    def product_params
      params.require(:product).permit(:name, :variety, :minPrice, :medPrice, :maxPrice, :calibro, :category, :origin, :unitOfMisure, :group)
    end
end

