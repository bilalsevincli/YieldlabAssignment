# YieldlabAssignment (API)
##  Short description about the framework :
I created the framework in Java as a **Cucumber/BDD** framework along with Gherkin language in feature files. It includes **API** testings.

### Tools used :

Tools | Purpose
------------ | -------------
Java | Main language
Maven | Build management tool to manage dependencies
Intellij | IDE
Cucumber | BDD Framework (Added as a dependency and as a plugin)
Gherkin | Used in feature files for scenarios (Added as plugin in IDE )
JUnit | For assertions and annotations
REST Assured | For API testing
Git&Github | Version Control System
Maven cucumber reporting | Generate reports
Maven surefire plugin | To manage runner classes/execute tests in parallel structure


### Design :

Design of the framework is Cucumber Behavior Driven Development framework. 

* **runners**
   - Runner classes are where I execute testing via Cucumber Options.  It includes **CukesRunner** and **FailedRunner**(to run failed cases) classes.
   - I am holding and managing some cucumber option features like **plugin**,**features**,**glue**,**tags**,**publish** etc.
* **step_definitions**
   - Step Definition classes are in step_definitons package and keeps respective behavioral steps regarding Feature File which is in resources directory. 
* **utilities**
   - Utilities package in which I store **BidUtils**(Methods related to Bid alghorithm in order to call when needed), **ConfigurationReader**(to read baseurls,keys etc. from configuration.properties) classes has common ready methods that I’m implementing during creating test scripts.
* **resources**
   - features
     - Feature File represents the scenarios written in Gherkin language from end-user perspective. 
* **configuration.properties**
   - Configuration properties file is keeping data like baseurls,keys based on key and value structure.
  


- **Maven** is used as a build managemet tool and it helps me to manage the dependencies. It gives me the option that I can execute my scripts from terminal or from a CI tool.

- **Rest-Assured** is used to test out REST based services. I can validate and/or verify the responses of requests.

- **Git&Github** is used as VCS.


    
 ### Instructions to run :

**Start the application**

You can run the application based on the instructions that provided in the assignment readme file.

**Run the test suite**

Run the test suite via Maven verify. You can run the application from your shell via:
```sh
mvn verify
```

**Assess the test suite report**

You can find the report in this path Yieldlab\target\cucumber-html-reports\overview-features.html. It can be viewed via browser.















