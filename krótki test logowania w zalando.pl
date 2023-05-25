To jest mój pierwszy, samodzielny test nieudanego logowania na zalando.pl, całkowicie zautomatyzowany w selenium i pythonie:


Oto kroki test case`a w Testsigmia:

1
Navigate to https://www.zalando.pl/
00:02.27
2
Click on pathTag
00:31.64
3
Enter pawelwo79@gmail.com in the loginemail::inputEmail field
00:36.29
4
Enter test1234 in the loginsecret::inputPassword field
00:35.89
5
Click on Zalogujsi::button
00:30.35




A to właściwy kod w selenium przy zainstalowanym interpreterze pythona i zainstalowanym selenium web driver:

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


# Create a new instance of the Chrome driver
driver = webdriver.Chrome()

# Navigate to https://www.zalando.pl/
driver.get("https://www.zalando.pl/")

# Find and click the element with the specified XPath
login_button = driver.find_element(By.XPATH, '//*[@id="z-navicat-header-root"]/header/div[1]/div/div/div/div[1]/div/div/div/div[1]/div[3]/div/div[1]/a')
login_button.click()

# Find and click the login button
login_button = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.XPATH, '//*[@id="z-navicat-header-root"]/header/div[1]/div/div/div/div[1]/div/div/div/div[1]/div[3]/div/div[1]/a')))
login_button.click()

# Find the login field and enter the login value
login_field = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, '//*[@id="login.email"]')))
login_field.send_keys('pawelwo79@gmail.com')

# Find the password field and enter the password value
password_field = WebDriverWait(driver, 10).until(EC.visibility_of_element_located((By.XPATH, '//*[@id="login.secret"]')))
password_field.send_keys('test1234')

# Find the Login button then click it
login_button = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.XPATH, '//*[@id="sso"]/div/div[2]/main/div/div[2]/div/div/div/form/button')))
login_button.click()

# Add a pause or wait at the end
input("Press Enter to close the browser...")

# Close the driver and the window
driver.quit()




Kod wykonuje się ładnie w Visual Studio Code

