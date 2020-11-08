import pytest
from pytest_bdd import given
from selenium import webdriver

UDEMY = 'https://www.udemy.com'

@pytest.fixture
def browser():
    driver = webdriver.Chrome() # Used Chrome here. Alternatively can ask for browser option during runtime
    driver.implicitly_wait(5)
    yield driver
    driver.quit()

@given('I visit the Udemy homepage')
def visit_homepage(browser):
    browser.get(UDEMY)