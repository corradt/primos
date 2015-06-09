module ProductsHelper

require "open-uri"
require 'rubygems'
require 'nokogiri'
require 'mechanize'
require 'logger'


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
