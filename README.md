# Mobile Test
# MVP - CleanArchictecture - DDD

This project is based on the MVP Pattern and inspired by Uncle Bob's clean architecture.

The following project has been developed as an assessment project; however, I decided to address the challenge by incorporating some battle-tested, industry-proven architectural patterns that are highly suggested by Clean Architecture, such as Separation of Concerns and the MVP Pattern. Additionally, I've implemented a folder structure that sticks to the conceptual structure of Domain-Driven Design (DDD).

Modules:

![image](https://drive.google.com/uc?export=view&id=1DS2oWRevoD2e47nteN2JNJ1vDkE4-Pwd)

# Domain

This module exposes Use Cases to process business logic. I use abstractions as a means of communication between the Repository and Data Layers. The layer distribution is through bounded contexts, and every one of these has a Entities, Gateways, and Usecase folders. This layer or module gets connect with the presentation layer too and serves as a bridge to return the data to display.

# Data
This module is responsible of getting all the data necessary for the app. It has the same folder structure that the domain layer has, but inside it has a repository folder that belongs to every bounded context, that has two data source: Mocks (Testing) and the actual repositories connected to the Marvel api. The Data layer also has the apiService implementation where I setup all the connection to the api, also, a jsonmapper to decode all data to become the models in app.

# Presentation
This module presents data to a screen and handle user interactions, we can found here: Controllers, Views (built Programmatically), datasources and Presenter, the last one is responsible of communicating with use cases depending of the feature.

# Dependency Injector
Framework responsible for linking the Interfaces to the Factories, in this case, the chosen framework choose was SwiftInject. I used an extension to handle all interactions with the dependency container.

# Testing
Testing was implemented using GIVEN-WHEN-THEN pattern.
