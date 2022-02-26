require "selenium-webdriver"

driver = Selenium::WebDriver.for :chrome 
wait = Selenium::WebDriver::Wait.new(timeout: 20)
driver.navigate.to "http://google.com"

element = driver.find_element(name: "q")
element.send_key("nashiblog")
element.submit
# element = driver.find_element(:link,"nashiblog")
driver.find_element(:xpath,'//*[@id="rso"]/div[1]/div/div/div/div/div/div[1]/a/h3').click
sleep 5 
title = driver.find_element(:link_text,"MacBook")
puts title.text
price = driver.find_element(:xpath,"//*[@id="search"]/div[1]/div[1]/div/span[3]/div[2]/div[3]/div/div/div/div/div[2]/div[3]/div[1]/a/span/span[2]/span[2]")
puts price.text

driver.quit