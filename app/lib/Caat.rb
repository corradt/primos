class Caat
  
  def self.exists_prezzi_torino_page
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


  def self.exists_grossisti_agricoli_page
    if Nokogiri::HTML(open("http://www.caat.it/it/operatori"))         
        return Nokogiri::HTML(open("http://www.caat.it/it/operatori"))
     end
  end
  
end