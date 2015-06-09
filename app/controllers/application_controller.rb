class ApplicationController < ActionController::Base
  include Pundit
  require "open-uri"
  require 'rubygems'
  require 'nokogiri'
  require 'mechanize'
  require 'logger'
  layout :layout_by_resource
  

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end



  private
	  def user_not_authorized
	  	flash[:notice]="you are not authorized to access in this area"
	  	redirect_to root_path
	  end

  
    def layout_by_resource
      if devise_controller? && resource_name == :admin
        "admin"
      elsif devise_controller? && resource_name == :doctor
        "doctor"
      else
        "application"

      end
    end





  def extract_date(stringa)
    return /(?<month>\d{1,2})\/(?<day>\d{1,2})\/(?<year>\d{4})/.match(stringa)
  end

  def exists_prezzi_torino_page
    if extract_date ((Nokogiri::HTML(open("http://www.caat.it/it/listino/#{(Time.now).strftime("%Y-%m-%d")}"))).css("title").text)         
        return Nokogiri::HTML(open("http://www.caat.it/it/listino/#{(Time.now).strftime("%Y-%m-%d")}"))
      elsif extract_date ((Nokogiri::HTML(open("http://www.caat.it/it/listino/#{(Time.now-1.days).strftime("%Y-%m-%d")}"))).css("title").text)
        return Nokogiri::HTML(open("http://www.caat.it/it/listino/#{(Time.now-1.days).strftime("%Y-%m-%d")}"))
      elsif extract_date ((Nokogiri::HTML(open("http://www.caat.it/it/listino/#{(Time.now-2.days).strftime("%Y-%m-%d")}"))).css("title").text)
        return Nokogiri::HTML(open("http://www.caat.it/it/listino/#{(Time.now-2.days).strftime("%Y-%m-%d")}"))
      elsif extract_date ((Nokogiri::HTML(open("http://www.caat.it/it/listino/#{(Time.now-3.days).strftime("%Y-%m-%d")}"))).css("title").text)
        return Nokogiri::HTML(open("http://www.caat.it/it/listino/#{(Time.now-3.days).strftime("%Y-%m-%d")}"))
      elsif extract_date ((Nokogiri::HTML(open("http://www.caat.it/it/listino/#{(Time.now-4.days).strftime("%Y-%m-%d")}"))).css("title").text)
        return Nokogiri::HTML(open("http://www.caat.it/it/listino/#{(Time.now-4.days).strftime("%Y-%m-%d")}"))
      else 
        return Nokogiri::HTML(open("http://www.caat.it/it/listino/#{(Time.now-5.days).strftime("%Y-%m-%d")}"))
    end
  end
  
  
  def exists_prezzi_ismea_page
    if Nokogiri::HTML(open("http://www.ismea.it/flex/cm/pages/ServeBLOB.php/L/IT/IDPagina/4471"))         
        return Nokogiri::HTML(open("http://www.ismea.it/flex/cm/pages/ServeBLOB.php/L/IT/IDPagina/4471"))
     end
  end

  def exists_grossisti_agricoli_page
    if Nokogiri::HTML(open("http://www.caat.it/it/operatori"))         
        return Nokogiri::HTML(open("http://www.caat.it/it/operatori"))
     end
  end

  
  def today_is
    return Time.now.strftime("%H:%M:%S")
  end
  
  def google(var)
    agent = Mechanize.new
    agent.log = Logger.new "mech.log"
    agent.user_agent_alias = 'Mac Safari'
    page = agent.get "http://www.google.com/"
    search_form = page.form_with :name => "f"
    search_form.field_with(:name => "q").value = var
    search_results = agent.submit search_form
    return Nokogiri::HTML(search_results.body)
  end

  def acquisisci_html
    doc=google("corrado tuccitto")
    return @righe=doc.css("#res h3.r")
  end

    



end
