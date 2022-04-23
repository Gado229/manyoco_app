# Task

| Column name | Data type |
| --- | ----------- |
| title | string |
| content |text|
| deadline | datetime |
| status | string |
| priority | integer |
| user_id | integer |

# Deployment on Heroku

1. Make login to Heroku
  - [x] heroku login or
  - [x] heroku login -i (if you use vagrant)

2. Make create an app on Heroku
  - [x] heroku create

3. Make add all app
  - [x] git add .

4. Make commit an app with message
  - [x] git commit -am "make it better"

5. After creating, adding and commiting, make push the code on heroku
  - [x] git push heroku master

6. To Finish make migration to migrate your database on heroku
  - [x] heroku run rails db:migrate)
