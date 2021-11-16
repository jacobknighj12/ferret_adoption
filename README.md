# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
  R7 Identification of the problem you are trying to solve by building this particular marketplace app.
  The problem I am solving with this application is part of a few groups I am in that take care of rescue ferrets
  and one gentleman that has a website that hasn't been updated in 5 years so I felt like it was a good real world use
  of my time if I were able to set up a place for them to put information on the rescues they have and are wanting to give a new home.

R8 Why is it a problem that needs solving?
as stated above the only site used hasn't been updated for several years and it needs to be a controlled marketplace with oversight
due to breeders of ferrets needing to be specialized otherwise they can and do cause disfiguration and disease through the population with
inbreeding and malnutrition to ferrets produced for gumtree, etc..

R9 A link (URL) to your deployed app (i.e. website)
https://ferret-adoption-marketplace.herokuapp.com/ (upload is crashing unsure of why)
R10 A link to your GitHub repository (repo).
https://github.com/jacobknighj12/ferret_adoption


  R11 Description of your marketplace app (website), including:
- Purpose
- Functionality / features
- Sitemap
- Screenshots
- Target audience
- Tech stack (e.g. html, css, deployment platform, etc)
  R12 User stories for your app
  https://trello.com/b/8XK2H0fb/marketplace-project
  R13 Wireframes for your app
  refer to wireframes
  
  R14 An ERD for your app
  refer to erd file
  
  R15 Explain the different high-level components (abstractions) in your app
  In this app the database is very basic with not much to it, having 2 model controller pairs, the ferret model being the main ticket item the site revolves around, contiaining all the required data and information when called upon each time shows a card holding all of the attributes and provides its data, it is used through most of the main functionality on the site and is interacted with through all of the CRUD features in the model, it has also been updated to only allow users that are logged in to see/access the crud features other than read.
  the user model came baked in with devise so the only modification I have done was to create the username row, however havent implemented the username further just yet, this holds all of the users data that allows them to login, reset passwords etc.. 

  R16 Detail any third party services that your app will use
  The third party services in use are AWS(S3) bucket image hosting and Heroku to serve and host the site currently, no other 3rd party services have been identified or implemented as of currently.

  R17 Describe your projects models in terms of the relationships (active record associations) they have with each other
  user model is related to the ferret model by has_many ferrets however functionality has not been implemented yet.
  similarly the ferret model belongs_to user optional: true and has not been further explored yet. these are intended to produce the result of for users to own each created instance of a ferret to be sold

  R18 Discuss the database relations to be implemented in your application
  as stated above unfortunately at this time the implementations are not yet present.

  R19 Provide your database schema design

  R20 Describe the way tasks are allocated and tracked in your project
  The tasks are determined by how important they are to the MVP initally going through a planned stage, a in progress stage, to then rest in a completed stage or into a dropped stage if the
  step is not compatable or completable in the frame of time given. importance is from top to bottom in the columns
