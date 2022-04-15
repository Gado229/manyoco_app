# el-training

## About this curriculum

This document is a curriculum for new employee education to learn the basics of Ruby on Rails and its peripheral technologies, which are essential for Manyo.
Regardless of the ability of new employees, you will be required to carry out one step.
The training period is not specified.
Training will be completed when all steps are completed.

The following characters are assumed in this curriculum.

--New employee: A student of this curriculum.
--Supporter: We provide education, guidance, and advice for new employees. It also plays the role of consulting with new employees and deciding specifications together.

It is up to the supporter's discretion to determine how much the supporter is involved in the guidance. In addition, regarding the training period, the supporters will set a guideline in advance, taking into consideration the skill level of new employees and the status of internal projects.

## Overview

### System requirements In

this curriculum, you will develop a task management system as an issue.
The task management system wants to do the following:

--I want to easily register my
task-I want to be able to set an end deadline for a task-I want
to prioritize tasks -I
want to manage status (not started / started / completed)-with
-I want to narrow down tasks by status
--I want to search for a task by task name / description of the task-I want
to list the tasks. I want to sort on the list screen (based on priority, deadline, etc.)
-I want to classify tasks with labels, etc.-I want to
register as a user so that only the tasks I registered can be seen.

Also, the above requirements In order to meet, we would like to have the following management functions.

--User management function

### Support browser

-Support browser is assumed to be the latest version of macOS / Chrome

### Application (server) configuration

Please build using the following languages ​​and middleware () Both are the latest stable versions).

--Ruby
--Ruby on Rails --For the
PostgreSQL

server, please use the following.

--Heroku

* Performance requirements and security requirements are not specified, but please make them with general quality.
  If the response of the site is too bad, please improve it.

## Final goal of

this curriculum At the end of this curriculum, it is assumed that you will learn the following items.

--Being able to implement basic Web applications using Rails
-Being able to publish applications using a general environment in Rails applications
add functions and maintain data for published Rails applications
--Learn the flow of PR and merging on GitHub. Also, learn the necessary Git commands-to
  be able to commit at the right level of granularity-to be able
  to write a proper PR description-to be
  able to respond to reviews and make corrections
-to team up with unclear points at the right time You can ask questions to members and related parties (this time you will be a supporter) verbally or by chat.

## Recommended Books

In advancing the training curriculum, we recommend the following books as recommended books.

-[Ruby on Rails 5 Quick Learning Practice Guide that can be used in the field] (https://book.mynavi.jp/ec/products/detail/id=93905)

The Ruby on Rails 5 Quick Learning Practice Guide that can be used in the field is a training curriculum. The subject is the task management system as well.
Therefore, I think there are many points that can be helpful in advancing this training.

It also explains the contents that could not be covered in this training and how to proceed with team development. Please refer to it.

## A collection of topics useful for development topics

that were not included in a specific issue step, but are summarized in topics.md. Please refer to and utilize it as necessary when implementing the curriculum.

## Challenge Step
#### 1-1: Install Ruby

### Step 1: Build a Rails development environment


-use [rbenv] (https://github.com/rbenv/rbenv) to install the latest version of Ruby
-`ruby -v` command Make sure you see the Ruby version in

#### 1-2: Install Rails-Install

Rails with the Gem command-Install the
latest version of Rails
-`rails -v` Make sure that the Rails version is displayed by the command

#### 1-3: Install database (PostgreSQL) -Install Ruby

on your OS-Install with
  `brew` etc. for macOS Please

### Step 2: Create a repository on GitHub

-Install Git at hand
  -For macOS, install it with `brew` etc.
  -Register your user name and email address with` gitconfig`
Let's think about the app name (= repository name)-Create a repository-
  Get it if you don't have an account-
Create
  an empty repository on it

### Step 3: Let's create a Rails project

--First, let's cut a new topic branch with Git
  -After that, we will work on the topic branch and make a commit
  -
Let's create the minimum required directories and files for the application with the `rails new` command- Find out how to add only the bare essentials and explain to your supporters what the rails new command does and what you plan to remove-
the project directory (app name directory) created by `rails new`. Create a directory called `docs` directly under, and commit this document file-to keep
  the specifications of this app under control so that you can see them at any time
-to specify the version, the version of Ruby to use. Write it in the `Gemfile` (make sure the version of Rails is already listed) --Create a
PR on GitHub for review
  -with WIP (Work In Progress) as needed Let's issue a PR. See the topic collection for more details
  -please respond to any comments. If you have two LGTMs (Looks Good To Me), merge them into the main branch.

### Step 4: Think about the image of the application you want to create

-Before designing, make a complete image of what the application will look like ( Think (with your supporters). Screen design by paper prototyping is recommended
  -Also, think about how this app will be used (whether it will be published on the Internet, for internal use, etc ...) (with supporters). Let's
read the system requirements and think about the required data structure
  -what kind of table is likely to be needed, each table name, column name, data type, constraint, etc., necessary for creating a schema Think about the information
-If you think about the data structure, transcribe it as a table diagram -When it's
  done, shoot it and ask the
  supporters to review it-The problem as a result of having the supporters review it If not, put the table diagram in the repository
  -write the table schema in `README.md` to create a PR and have it reviewed.

* Create the correct table diagram at this time. No need yet. Let's make it as an assumption at the moment (Imagine fixing it if you think it is wrong in future steps)

### Step 5: Let's set the database connection (peripheral setting)

-Let's install Bundler-
` Let's install `pg` (PostgreSQL database driver) with Gemfile`-let's set`
database.yml`
Gemfile`-Create a database with the` rails db: create` command
-Check the connection to the database with the `rails db` command
-On GitHub Create a PR and have it reviewed

### Step 6:

Let's set up RuboCop-Set up RuboCop as Linter / Formatter
-This curriculum has been adjusted to match the Rails app creation [retrieva-cop] (https://github.com/retrieva) Use / retrievea-cop)
-Install [retrieva-cop] (https://github.com/retrieva/retrieva-cop) with `Gemfile`-
(Ask supporters) RuboCop runs when creating PR Let's set Circle CI so that it will be set
  -Because the initial setting of CI is a little out of the items you want to learn in the curriculum, please make sure that the supporter sets CI
-Since the coding standard is the supporter・ Let's update as needed in consultation with the reviewer

### Step 7: Let's create a task model Create

a CRUD to manage the task.
First of all, let's make it with a simple structure where only the name and details can be registered.

--Let's create the model class required for CRUD of the task with the `rails generate` command-
  forget to set DB constraints as well.
migration and use it to create a table
  ――It is important to ensure that the migration can be returned to the previous state! Get in the habit of playing `redo` to check -make
sure you can connect to the database via the model with the` rails c` command-let's
  try creating a record with ActiveRecord at this time-
set validation Let's
  -think which validation should be added to which column-
create a PR on GitHub for review

### Step 8: Allow you to view / register / update / delete tasks Let's

create a task list screen, detail screen, create screen, edit screen, and delete function.

Creating these features all at once tends to make the PR huge.
Therefore, in step 8, we will proceed with PR by dividing it into multiple parts.

Even in future steps, if the PR is likely to increase, consider whether you can issue the PR in two or more.

### Step 8-1: Let's create a task list screen and detail screen-

Let's make it possible to display the task created in step 7 on the list screen and detail screen
-Controller and view with `rails generate` command -Determine
  which template engine to use in consultation with your supporters
-Add the required implementations to your controller and view
--Edit `routes.rb` so that the task list screen is displayed at` http: // localhost: 3000 / `  
-Let's find out what HTTP is interacting with when accessing the list screen and explain it to our supporters.

### Step 8-2: Create and edit the task screen Let's create-Let's make

it possible to create and edit tasks from the screen- Let
's display a flash message on the screen after creating and updating
  -If a validation error occurs, display an error message on the screen Let's
-Create a PR on GitHub for review

### Step 8-3: Let's make it possible to delete tasks-Let's make it

possible to delete created tasks-
Flash message after deletion Let's display on the screen
-Create a PR on GitHub and have it reviewed

### Step 8-4: Let's look back

at the added code-The code added in steps 8-1 to 8-3 Let's explain to supporters
  -classes, methods, variables
  -process flow

### Step 9: Let's touch SQL

-manipulate the
  database-connect to the database with the `rails db` command Let
  's view, create, update, and delete
tasks in SQL-Access the task list screen and check that the SQL log is flowing
  --Let 's explain to the supporters what kind of SQL is being executed-Let's  
Let's see what SQL is executed by the method of
  execute `find`,` where`, etc. with `rails c`-
"SQL injection" and "SQL with Rails" Let's explain to supporters how to write to prevent injection

### Step 10: Write a test

-Get ready to write a
  spec-`spec / spec_helper.rb`,` spec / rails_helper Let's prepare .rb`
-let's write model spec for validation
  -actually we don't write much validation test, but let's do it to get a better understanding of model spec
-system spec Let's write for the task function
-Let's integrate RSpec with Circle CI and notify Slack-
  Similar to step 6, it can be done by the supporter
-Reference book: https: // leanpub.com/everydayrailsrspec-jp

### Step 11: Let's standardize the Japanese part of the app-Using

Rails' i18n mechanism, model name / attribute name and validation error message can be displayed in Japanese let's do it
  --At that time, [locale file provided by rails-i18] (https://github.com/svenfuchs/rails-i18n/blob/master/rails/locale/ja.yml) and the locale to the model added independently Let's manage files separately

separately for ### Step 12: Set the Rails time zone

-Set Rails time zone to Japan (Tokyo)

### Step 13: Sort task list by creation date and time

-Currently sorted by ID But let's sort this in descending order of creation date-let's
write in the system spec that the sorting is working

### Step 14: Let's deploy

-a simple task in the main branch Now that we have a management system, let's deploy it.
--Let's deploy to Heroku-
  Let's register if you don't have an account
  -You can use either a company or an individual email address to register
  - Let's
touch the deployed app on Heroku- From now on, let's register tasks in this app and proceed with development-
  * However, Heroku applications can be referenced anywhere on the Internet, so do not post information that is bad to publish
    -Basic authentication at this point Maybe
  -in the future, continue to deploy your app to Heroku after each step
--Let's describe the deployment method in `README.md`
  -At that time, it is better to also describe the version information of the framework used in this app

### Step 15: Add the expiration date Let's

date-Let's register an expiration date for a task
-Let's sort by expiration date on the list screen
--Expand specs
-PR and get reviews, then release

### Step 16: Add status to make it searchable

-Status (not started / started / completed )
  -[Option] If you are not a beginner, you may install a Gem that manages the state
-Let's make it possible to search by title and status on the list screen-
  [Option] If you are not a beginner, you can introduce a gem that makes it convenient to implement search such as ransack-
when narrowing down, let's check the log and check the changes in the issued
  SQL- Get in the habit of checking even in steps as needed
-Paste a search index-
  Prepare a certain amount of test data, check the operation while looking at log / development.log, and add an index to improve speed. Let's confirm that it is
  done-[Option] Let's see the index usage status on the database side using PostgreSQL explain etc.-Let's
add a model spec to the search (system) Let's expand the spec as well)
it) --You can register the priority (high, medium, low) for the task. Let's-let's
be able to sort by priority

### Step 17: Let's set the priority (* If you have similar implementation experience, you can omit it)

--Let's expand the system spec-Let's
release it after PR and review

### Step 18: Let's add pagenations-Let's add pagenations

to the list screen using a gem called Kaminari

### Step 19: Let's guess the design

-Introduce Bootstrap , Let's apply the design to the application created so far-
  [Option] Write and design CSS by yourself

### Step 20:

Let's create a user model-Let's create a user model-Let's create the
first user Let's create it with seed-Let's associate
the task with the first user created with seed- Let's
  index the association-
  * Tasks already registered when deploying to Heroku (Data maintenance)

### Step 21: Let's implement login / logout function

-Let's implement it by ourselves without using additional Gem
  -Gem such as Devise By not using it, the purpose is to deepen the understanding of the mechanism such as HTTP Cookie and Session in Rails.
  --It also aims to give you a better understanding of general authentication (such as how to handle passwords)  
login screen Let's
-If you're not logged in, don't go to the task management page
--When you create a task, try to associate the task with the logged-in user-
Create it yourself. Let's display only the tasks that have been done
-Let's implement the logout function

### Step 22: Let's implement the user's management screen -

Let's add the management menu on the
screen-Always `/ admin` on the management screen Let's add the URL at the beginning
  -Before adding it to `routes.rb`, let's design by assuming the URL and routing name (name that becomes` * _path`) in advance-User
list- Let's implement create / update / delete-
If you delete a user, try to delete the task that
the user has-Display the number of tasks that the user has on the user list screen. Let's
  -Incorporate a mechanism to avoid the N + 1 problem-Let's see a list of user
-
created tasks

### Step 23: Add a role to the user-
Let users distinguish between administrative and general users
-let only administrative users access the user management screen
  -if a general user accesses the management screen, make a special exception Let's look at
  --Catch the exception and display the error page properly (you can do it in step 25) --Control
  -Logging
's make the role selectable in the user management screen
--Let's control the deletion so that no one is lost-Let's
  use the model callback-
* You can use or not use Gem freely

### Step 24: Label the task Let's make it possible-

Let's make it possible to attach multiple labels to a task-Let's make it
possible to search by the attached label

### Step 25: Let's set the error page properly

-Rails prepares Let's make the default error page you have created your own screen
-Set the error page appropriately according to the situation
  -The two types of status code 404 page and 500 page are required at least. Masu

## Afterword Thank you for your

hard work.
You have completed the entire educational curriculum !!

I couldn't cover it in this curriculum, but I think that the following topics will be needed in the future, so I think it is good to proceed with learning (learning through projects). I think there are many).

--Deepen a basic understanding of web applications-
  Understanding HTTP and HTTPS
-Learn a little more advanced use of Rails
  -STI
  -Explicit transactions
  -Asynchronous processing
  -Asset pipeline (rather a release topic)
--A better understanding of frontends such as JavaScript and CSS-A better understanding of
databases
  -SQL
  -Building more performance-focused queries-A
  better understanding of indexes-A better understanding of
server environments
  -Linux OS
  -Web Server (Nginx) Settings
  -Application Server (Unicorn) Settings
  -Understanding PostgreSQL Settings-Understanding
Release Tools
  -Capistrano
  --Ansible
