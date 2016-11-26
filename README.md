# Wiki Articles

A wiki system based on the popular Wikipedia model

[Demo](https://wiki.mybluemix.net)

#Run Locally
* `git clone --depth 1 https://github.com/prabb/wiki.git wiki`
* `cd wiki`
* `mvn jetty:run-war`

The project was developed with IntelliJ Idea `IDE`. However, if you would like to play around with the project in eclipse, you can convert it into eclipse project.
* `mvn eclipse:eclipse` : This will generate classpath and project files required by Eclipse
* `src/main/resources/hibernate.cfg.xml`: Verify the credentials required to connect to the database before running.

# System Flow
* All users can view Wiki Articles
* However, to edit/delete, a user needs to create an account or login
