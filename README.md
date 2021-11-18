# README

- Ruby version
ruby 2.7.2p137

- System dependencies
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'devise'
gem "pundit"
gem 'bootsnap', '>= 1.4.4', require: false
gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
gem 'rails_real_favicon'
gem 'web-console', '>= 4.1.0'
gem 'rack-mini-profiler', '~> 2.0'
gem 'listen', '~> 3.3'
gem 'spring'
gem 'capybara', '>= 3.26'
gem 'selenium-webdriver'
gem 'webdrivers'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "aws-sdk-s3", "~> 1.105"
gem "stripe", "~> 5.39"

(apart from rails packages all that is required is

stripe

aws-sdk-s3

devise

pundit

(cant find where bootstrap has ran off too... so not sure)
)
- Database creation

rails db:create

- Database initialization

rails db:migrate

(sorry lads no seed file here)

- Services (job queues, cache servers, search engines, etc.)

stripe purchasing and redirects

aws s3 bucket picture hosting and uploads

R1	Create your app using Ruby on Rails.
Check this has been created by rails new

R2	Use Postgresql database in development and production.
postgres is the current db that is running this app

R3	Your app will have authentication (eg. Devise).
Devise is the main part that my user is constructed from and slightly modifyed with

R4	Your app will have authorisation (i.e. users have restrictions on what they can see and edit).
some manual restriction has been implemented however Pundit has been used for further authorization of the app
only allowing users that own a ferret that has been created can modify, or delete that ferret.

R5	Your app will have some type of file (eg. images) uploading capability.
each ferret has a title picture that is uploaded on creation to AWS S3 bucket and is hosted there

R6	Your app is to be deployed to Heroku (recommended) or AWS.
The app is deployed and currently running on a Heroku deployment
https://ferret-adoption-marketplace.herokuapp.com/

- ...
  R7 Identification of the problem you are trying to solve by building this particular marketplace app.
  The problem I am solving with this application is part of a few groups I am in that take care of rescue ferrets
  and one gentleman that has a website that hasn't been updated in 5 years so I felt like it was a good real world use
  of my time if I were able to set up a place for them to put information on the rescues they have and are wanting to give a new home.

R8 Why is it a problem that needs solving?
as stated above the only site used hasn't been updated for several years and it needs to be a controlled marketplace with oversight
due to breeders of ferrets needing to be specialized otherwise they can and do cause disfiguration and disease through the population with
inbreeding and malnutrition to ferrets produced for gumtree, etc..
please refer to slides for more detailed information on the problem attempted to solve.

R9 A link (URL) to your deployed app (i.e. website)
https://ferret-adoption-marketplace.herokuapp.com/ (upload is crashing unsure of why)
R10 A link to your GitHub repository (repo).
https://github.com/jacobknighj12/ferret_adoption


  R11 Description of your marketplace app (website), including:
- Purpose
purpose of the website is to provide a contained space for trusted vendors of ferrets and adoption places due to an old site, rampant backyard breeders, diseases 
and wanting to give to the community.
- Functionality / features
functionality of the site currently is a database serving a list of ferrets to guests, while providing detailed information on ferrets, their ownership and how to care for them.
meanwhile serving for vendors to have a place to post ferrets for adoption, and being able to gather applicants for adoption in a adoption list that they can veiw update and change to their needs.
- Sitemap
refer to sitemap
![sitemap](docs/sitemap.png)
- Screenshots
![Pdf slideshow](ppt/Ferret-Adoption-place.pdf)
- Target audience
target audience is the facebook groups in my area that are super into ferret ownership, generally ages between 16-70 with an average owner/adoptee age of 40
these groups are gennerally located in east melbourne, however cover most of victoria.
- Tech stack (e.g. html, css, deployment platform, etc)
  R12 User stories for your app
  https://trello.com/b/8XK2H0fb/marketplace-project
  R13 Wireframes for your app
  refer to wireframes
  ![Wireframe](docs/1.png)
  ![Wireframe](docs/1.1.png)
  ![Wireframe](docs/2.png)
  ![Wireframe](docs/3.png)
  ![Wireframe](docs/4.png)
  ![Wireframe](docs/5.png)
  ![Wireframe](docs/6.png)
  ![Wireframe](docs/7.png)
  ![Wireframe](docs/8.png)
  ![Wireframe](docs/9.png)

  R14 An ERD for your app
  refer to erd file
  ![ERD](docs/DBMS_ER_diagram(UML_notation).jpeg)
  R15 Explain the different high-level components (abstractions) in your app
  In this app the database is very basic with not much to it, having 2 model controller pairs, the ferret model being the main ticket item the site revolves around, contiaining all the required data and information when called upon each time shows a card holding all of the attributes and provides its data, it is used through most of the main functionality on the site and is interacted with through all of the CRUD features in the model, it has also been updated to only allow users that are logged in to see/access the crud features other than read.
  the user model came baked in with devise so the only modification I have done was to create the username row, however havent implemented the username further just yet its intended to be used to display on the ferret card items to show who is the owner, the model holds all of the users data that allows them to login, reset passwords etc.. 

  R16 Detail any third party services that your app will use
  The third party services in use are AWS(S3) bucket image hosting and Heroku to serve and host the site currently and
  Stripe for all transactions between parties.
  No other 3rd party services have been identified or implemented as of currently.

  R17 Describe your projects models in terms of the relationships (active record associations) they have with each other
  User model is related to the ferret model by has_many ferrets however functionality has not been implemented yet.
  similarly the ferret model belongs_to user optional: true. These are to produce the result of for users to own each created instance of a ferret to be sold
  and they only have authorization to edit(modify) and delete(destroy) their own ferrets

  R18 Discuss the database relations to be implemented in your application
  the result of the relations that have been created for users to own each created instance of a ferret to be adopted
  and they only have authorization to edit(modify) and delete(destroy) their own ferrets this is the only relation in the database that is actively
  implemented.

  R19 Provide your database schema design
  The schema design for this project was done mostly on the fly due to not requiring each part to be planed out due to is small scale nature
  and each peice that was added on between the username onto the user and the user_id onto the ferret were very simple additions and no large scale changes to the project were done.
  that being said it was mainly done inside of the ERD file to keep things simple and streight forwards.
  ![ERD](docs/DBMS_ER_diagram(UML_notation).jpeg)

  R20 Describe the way tasks are allocated and tracked in your project
  The tasks are determined by how important they are to the MVP initally going through a planned stage, a in progress stage, to then rest in a completed stage or into a dropped stage if the
  step is not compatable or completable in the frame of time given. importance is from top to bottom in the columns
  https://trello.com/b/8XK2H0fb/marketplace-project