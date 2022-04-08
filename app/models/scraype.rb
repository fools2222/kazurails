class Scraype
    def sec
        options = Selenium::WebDriver::Chrome::Options.new
        options.headless!
        d = Selenium::WebDriver.for :chrome,options: options
        d.get("https://www.gaccom.jp/schools-22163/realestate.html")
        sleep 5
        
        sections = d.find_element(:id,"realestate_section").find_elements(:class,"side-corner-tag")
        sections.each do |o|
            
            @title = o.find_element(:class,"title-text").text
            @content = o.find_element(:class,"text_position2").find_element(:class,"small").text
            @list = o.find_element(:class,"large").text
            AmazonSearch.create({title:"#{@title}",subject:"#{@content}",body:"#{@list}"})
            sleep 1
        end
        d.quit
    end
end