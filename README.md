# README OFFLINE VERSION

- master key : f74aeef664d004203a9a077e870a34e5

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

- Database creation
  Database is running with postgresql will need to run this to get app to work if not already running(mine needs to be started manually):sudo service postgresql restart

rails db:create

- Database initialization

rails db:migrate

(sorry lads no seed file here HOWEVER categories will need to be manually created
1.toys
2.beds
3.food
)

- Services (job queues, cache servers, search engines, etc.)

stripe purchasing and redirects

aws s3 bucket picture hosting and uploads

R1 Create your app using Ruby on Rails.
Check- this has been created by rails new

R2 Use Postgresql database in development and production.
Check- postgres is the current db that is running this app

R3 Your app will have authentication (eg. Devise).
Devise is the main part that my user is constructed from and slightly modified with and used to authenticate users with
at multiple points to barricade from certain areas.

R4 Your app will have authorization (i.e. users have restrictions on what they can see and edit).
some manual restriction has been implemented however Pundit has been used for further authorization of the app
only allowing users that own a ferret that has been created can modify, edit or delete that ferret.
Also the exact same way with items, users only being able to modify, edit or delete items they own or are assigned too
unless they are an admin.

R5 Your app will have some type of file (eg. images) uploading capability.
each ferret has a title picture that is uploaded on creation to AWS S3 bucket and is hosted there
through the rails relation of having_one_attached picture having the keys uploaded to heroku, it too has
the ability to upload.

R6 Your app is to be deployed to Heroku (recommended) or AWS.
The app is deployed and currently running on a Heroku deployment with all features created, have been
tested and is fully functioning.
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
however the main point is to mitigate maintenance and micro management from the assigned admins and giving them a place to send their
interested persons to familiarize themselves with the basics then apply, however that being said there will most probably be a wait list as there are more
people willing to adopt than there are ferrets.
Please refer to slides for more detailed information on the problem attempted to solve.

R9 A link (URL) to your deployed app (i.e. website)
https://ferret-adoption-marketplace.herokuapp.com/
R10 A link to your GitHub repository (repo).
https://github.com/jacobknighj12/ferret_adoption

R11 Description of your marketplace app (website), including:

- Purpose
  purpose of the website is to provide a contained space for trusted vendors of ferrets and adoption places due to an old site, rampant backyard breeders, diseases
  and wanting to give to the community.
- Functionality / features
  functionality of the site currently is a database serving a list of ferrets to guests, while providing detailed information on ferrets, their ownership and how to care for them.
  meanwhile serving for vendors to have a place to post ferrets for adoption, and being able to gather applicants for adoption in a adoption list that they can veiw update and change to their needs.
  allowing for vendors to easily manage, allot and assess how many people are in the wait list, who is familiar with ferrets and has the appropriate knowledge, space and time for the
  critters.
- Sitemap
  refer to sitemap here:
  ![sitemap](docs/sitemap.png)
- Screenshots
  refer to the slideshow for all screenshots here:
  ![Pdf slideshow](ppt/Ferret-Adoption-place.pdf)
- Target audience
  target audience is the facebook groups in my area that are super into ferret ownership, generally ages between 16-70 with an average owner/adoptee age of 40
  these groups are generally located in east melbourne, however cover most of victoria.
- Tech stack (e.g. html, css, deployment platform, etc)
  R12 User stories for your app
  https://trello.com/b/8XK2H0fb/marketplace-project
  R13 Wireframes for your app
  refer to wireframes here:
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
  ![ERD](<docs/DBMS_ER_diagram(UML_notation).jpeg>)
  R15 Explain the different high-level components (abstractions) in your app
  -outdated but wanted to keep it in to track progress.
  In this app the database is very basic with not much to it, having 2 model controller pairs, the ferret model being the main ticket item the site revolves around, containing all the required data and information when called upon each time shows a card holding all of the attributes and provides its data, it is used through most of the main functionality on the site and is interacted with through all of the CRUD features in the model, it has also been updated to only allow users that are logged in to see/access the crud features other than read.
  the user model came baked in with devise so the only modification I have done was to create the username row, however haven't implemented the username further just yet its intended to be used to display on the ferret card items to show who is the owner, the model holds all of the users data that allows them to login, reset passwords etc..
  -Updated
  after the extension this is no longer the case the database has been enhanced and expanded to show capability, the dominant models are still the ferret and user models the user model handling the data for the login, ownership and details, the ferret model handling the ferret adoption marketplace with it containing the references for the user ownership to show who you are
  adopting from. The ferret model has pundit restrictions from the devise generated user that together works to ensure the correct user is interacting with the CRUD other than read in that specific instance or if that user has been given admin privileges they can use all of the functions even without ownership.
  The other side of the site that has been expanded is an extra side second hand marketplace that is structured to have categories of each item, each item also belonging to the user and each item having one category, in this way the items have listings similar to the ferret model with increased complexity.

  R16 Detail any third party services that your app will use
  The third party services in use are AWS(S3) bucket image hosting and Heroku to serve and host the site currently and
  Stripe for all transactions between parties.
  Google form is embedded in the waiting list page for guests to apply for specific ferrets and to get into contact with the vendors if they have adoptable ferrets available.
  No other 3rd party services have been identified or implemented as of currently.

  R17 Describe your projects models in terms of the relationships (active record associations) they have with each other
  User model is related to the ferret model by has_many ferrets and the ferret model belongs_to the user model through the references row the ferret model takes in the user_id to use to refer to the user model that it belongs to in any required instance. the main way that is used is through the policies given in ferret_policy for pundit ensuring that only a user that owns an instance of a ferret by checking their user_id against the foreign key in the ferret table or if that user is an admin they are allowed to use all of the CRUD functionality without ownership.
  similarly with the newly implemented secondhand items section the items belong_to a user that created the instance with their user_id being input into that instance to be checked later for authorization, on top of that the item also has_one category that it is part of and the categories belong_to item by passing in the category_id that is the foreign key in this instance to the item identifying the category it is in(no further use of the category other than displayed id has been used).

  R18 Discuss the database relations to be implemented in your application
  The result of the relations that have been created for users to own each created instance of a ferret to be adopted
  and they only have authorization to edit, modify and destroy their own ferrets similarly to the items that are also set up to be
  authorized through the foreign key given to the item from the user that it belongs to, the items however also have a foreign key from the
  categories that display the category id to the user to show what category the item is in as well as the user that owns the item they are viewing.
  The ferret relation also gives the access to show the user the person they will be applying to adopt from.

  R19 Provide your database schema design
  The schema design for this project is straight forwards with all of the given values being provided in the ERD designs that give a very clear insight into the directions
  the foreign keys go, the only thing that is unused currently in the schema/database is the datetimes provided by rails generation as currently due to time restrictions and scoping
  they have not been included in any of the outcomes.
  ![ERD](<docs/DBMS_ER_diagram(UML_notation).jpeg>)

  R20 Describe the way tasks are allocated and tracked in your project
  The tasks are determined by how important they are to the MVP initially going through a planned stage, a in progress stage, to then rest in a completed stage or into a dropped stage if the
  step is not compatible or completable in the frame of time given. importance is from top to bottom in the columns.
  https://trello.com/b/8XK2H0fb/marketplace-project
