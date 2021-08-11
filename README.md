# Covid-19 Laboratory Information System

This was a project for a class in my Masters. The original proponent did not follow through with this so I figured, everyone can just use this for their own laboratories or hospitals. No need to pay me. Besides, we need to help each other out.

## Features
- Web application so it can be accessible by any devices in the network
- Follows Philippines' Department of Health guidelines in case investigation (CIF v8)

## Functionalities

- Patient Management and Monitoring
- Employee Management
- Lab Inventory Management
- Contact Tracing
- Lab Test Management
- Files and reports export

## Requirements
- Java 11
- Grails 4
- MariaDB 15
- Apache Tomcat 9 (for server deployment)

## Configuration
1. Go to grails-app/conf/application.yml
    1. Change the metadata of the application by altering the values on the **info -> app** section
    1. Match your database credentials by changing the values in **environment** section (these are divided into three subsections: development, test, and production; change accordingly)
1. If you are using a different file template for the exports, open src/main/webapp/templates
    1. For DOCX files, make sure to keep the tags _<<Sample_Tag>>_ or else, no data will show up after export
1. When done, you can generate a deployable war file by: `grails clean && grails compile && grails war`
    1. The code separator above is for Linux; use only `&` for Windows
    1. You can generate a war file for other environments, e.g. test; just use `grails test war`
1. Rename the generated war file, e.g. _covid19lis.war_

## Installation:
- Move the war file to the web to CATALINA_HOME/webapps
- Wait for Tomcat to deploy the app
    - If it failed or did not start automatically, try forcing a restart on Tomcat service
- Open browser
- Type <host>:<port>/<name_of_war_file>, e.g. _localhost:8080/covid19lis_
