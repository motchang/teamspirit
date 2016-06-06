require 'selenium-webdriver'
require 'date'
require 'pry'

unless ENV['DEBUG']

  if [0, 6].include?(Date.today.wday)
    exit
  end

  sleep(rand(1..9) * 60)
end


wait = Selenium::WebDriver::Wait.new(:timeout => 30)
driver = Selenium::WebDriver.for :firefox
driver.manage.window.resize_to(1280, 1024)

begin
  driver.navigate.to 'https://teamspirit.cloudforce.com/'

  wait.until do
    if driver.find_element(:id, 'username').displayed?
      driver.find_element(:id, 'username')
    end
  end
  driver.find_element(:id, 'username').send_keys ENV['EMAIL']
  driver.find_element(:id, 'password').send_keys ENV['PASSWORD']
  driver.find_element(:id, 'Login').submit

  wait.until { driver.find_element(:id, '06628000004tnsn') }
  driver.switch_to.frame(driver.find_element(:id, '06628000004tnsn'));

  if ARGV[0] == 'i'
    wait.until do
      e = driver.find_element(:id, 'btnStInput')
      if e.attribute('class').split(' ').include?('pw_btnnst')
        e
      end
    end
    driver.find_element(:id, 'btnStInput').click
  elsif ARGV[0] == 'o'
    wait.until do
      e = driver.find_element(:id, 'btnEtInput')
      if e.attribute('class').split(' ').include?('pw_btnnet')
        e
      end
    end
    driver.find_element(:id, 'btnEtInput').click
  end

rescue => e
  driver.save_screenshot("#{e}.png")
  driver.quit
  raise

end

driver.quit
