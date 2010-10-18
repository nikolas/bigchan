How to make your own Bigchan
===========================================
Get Bigchan:
`git clone git://github.com/nikolas/bigchan.git`

Make an account at [Heroku](http://heroku.com/) and an account at [AWS](http://aws.amazon.com/). Bigchan uses Amazon S3 for storing pictures, and Heroku hosts Rails applications for free.

Bigchan is aware of three [environment variables](http://en.wikipedia.org/wiki/Environment_variable). `S3_BUCKET`, `S3_KEY`, and `S3_SECRET`. When you make an account at AWS and log in to the S3 admin panel, it should be obvious what these need to be. Define them locally if you want to be able to test bigchan with `rails server`. Otherwise, log in to Heroku and make a new repository, then add the variables like this:

* `heroku config:add S3_BUCKET=bigchan-production --app bigchan`

* `heroku config:add S3_KEY=5555555555555555 --app bigchan`

* `heroku config:add S3_SECRET=secret --app bigchan`

(Replace "bigchan" with whatever you called your instance)

Bigchan is tested with Ruby 1.9.2 on Rails 3.0.1. Tell Heroku to use the right version of Ruby:
`heroku stack:migrate bamboo-mri-1.9.2 --app bigchan`

Now you need to send your bigchan instance over to Heroku so they can have a slug compiled for you.
`git push git@heroku.com:bigchan.git`

And make the database:
`heroku rake db:migrate`


If it doesn't work, then send me an email.
