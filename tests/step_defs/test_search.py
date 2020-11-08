from pytest_bdd import scenarios, when, then, parsers
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait

TIMEOUT = 10

scenarios('../features/search.feature')

@then('I see a search icon is displayed in the box')
def search_icon(browser):
  browser.find_element_by_class_name('header--search-bar--1_mS0 button')

@then('I see the placeholder text displayed in the box')
def search_text(browser):
  browser.find_element_by_xpath('//input[@placeholder="Search for anything"]')

@when(parsers.parse('I search for "{course}" in the search box'))
def search_course(browser, course):
  search_input = WebDriverWait(browser, TIMEOUT).until(EC.element_to_be_clickable((By.XPATH, "//input[@placeholder='Search for anything']")))
  search_input.send_keys(course + Keys.RETURN)

@then(parsers.parse('I navigate to the "{course}" results page'))
def results_page(browser, course):
  results = browser.find_element_by_tag_name('h1')
  assert course in results.text
