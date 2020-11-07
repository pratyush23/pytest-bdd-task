# pytest-bdd-task

Task to demonstrate the automation testing of Google search functionality

## Framework Setup

This requires Python3 installed on your system. It also needs pipenv to manage package dependencies. Also, since they are UI Tests, having a Webdriver on the machine is recommended. This shall use Chromedriver. Follow the below steps to get it up and running on your local machine:

1. Clone this Github repository
2. Run `pipenv install` which shall install all the dependencies specified in the Pipfile and generate Pipfile.lock.

## Folder Structure

```
[project working directory]
|‐‐ [Pipfile]
|-- [test directories]
|   |-- features
|   |   `-- *.feature
|   `-- step_defs
|       |-- __init__.py
|       |-- conftest.py
|       `-- test_*.py
`-- [pytest.ini]
```

As per standard conventions, the entire code should reside inside a directory called tests which shall have features and step_defs as subfolders. step_defs can also contain `conftest.py` file which contains some fixture functions which are to be utilized by multiple tests. Lastly, `pytest.ini` file is used to register a custom marker to avoid warnings while test execution

## Running the Tests

The command used to run the tests is `pipenv run python -m pytest`. Also, there is a provision to run the tests by providing the tag names. It can be achieved by appending -k and the tag name. e.g. `pipenv run python -m pytest -k automated`

