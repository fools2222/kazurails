require "selenium-webdriver"
class AmazonSearch < ActiveRecord::Base

    $list = []
    def sec
        options = Selenium::WebDriver::Chrome::Options.new
        options.headless!
        d = Selenium::WebDriver.for :chrome,options: options
        d.get("https://www.gaccom.jp/schools-22163/realestate.html")
        
        sections = d.find_element(:id,"realestate_section").find_elements(:class,"side-corner-tag")
        sections.each do |o|
            $list << o.find_element(:class,"title-text").text
            $list << o.find_element(:class,"text_position2").find_element(:class,"small").text
            $list << o.find_element(:class,"large").text
            puts $list
        end
        d.quit
    end
end

  




   
