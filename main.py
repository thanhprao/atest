from selenium import webdriver
from flask import Flask, render_template , request
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By

app = Flask(__name__, template_folder='Template')

@app.route('/')
def index():
    return render_template('index.html')

@app.route("/automation",methods = ['Get','POST'])
def run_automation():
    if request.method== 'POST':
        search_key = request.form.get('search_key')
        title = selenium_code(search_key)

def selenium_code(search_key):
    s = Service(ChromeDriverManager().install())
    driver = webdriver.Chrome(service=s)
    driver.maximize_window()
    driver.get("https://google.com")
    driver.find_element(By.XPATH,"//input[@name='q']").send_keys(search_key)
    driver.find_element(By.XPATH,"//input[@name = 'btnK']").submit()
    title = driver.title
    
    return(title)
   



if __name__ == "__main__":
    app.run()
