# Microblog

YOLO You are hyped when someone mention microservices?
Look no further Microblog is the first blog in Lotus Framework - EVER!

The app is created to demo the modularity of Lotus. It consists of 3
apps:

* admin - web frontend for administration
* web   - web frontend for public
* api   - web api

## Bootstrap

Run `./setup.sh`

## It works ma!

To start the server:

```
bundle exec lotus server
```

Then you could browse the site with `0.0.0.0:2300`

The admin page is at `/admin` and the default username/password is "admin/password". You can change
password to what you like by modifying `ADMIN_PASSWORD` variable in `config/env.development`.

If you are interested in Web API, please look into `apps/api/v1`.
You can do API call with curl: `curl -i -H "Accept: application/json" http://0.0.0.0:2300/api/v1/posts` or `curl -i -H "Accept: application/json" http://0.0.0.0:2300/api/v1/posts/:id`

## Ma! I passed my test!

To run tests:

```
bundle exec rake spec
```

## Deployment to Heroku

Set up Heroku:

```
heroku create
```

Set up DB URL by getting the URL with:

```
heroku config | grep HEROKU_POSTGRESQL
```

You should get something like HEROKU_POSTGRESQL_COLOR, which value is used to set DB URI:


```
heroku config:set MICROBLOG_DATABASE_URL="postgres://something:something@ec2-54-225-101-202.compute-1.amazonaws.com:5432/something"
```

Then run

```
heroku run rake db:migrate
heroku run rake db:seed
```

Last step is to set admin password:

```
heroku config:set ADMIN_PASSWORD="password"
```

Deploy with:

```
git push heroku master
```

Once done, try to the deployed app with:

```
heroku open
```

## Credits

* Great thanks to Luca Guidi for creating [Lotus Framework](http://lotusrb.org)
* Also thanks to Nikolay Nemshilov for his [pain.less.css](https://github.com/MadRabbit/pain.less.css)
* Thanks to Mike Williams for his [representative](https://github.com/mdub/representative) gem that I used
to generate JSON

## License

MIT

## TODO

* Add support for migration generator / schema for Lotus Framework
* Add pagination
* Use named routes for Admin templates/forms (must be fixed in Lotus core)
* Add unit / integration tests
* Support user login feature (waiting for session non-persistence error to be resolved upstream in Lotus core)
* Find a way to share vendor JS/stylesheets between 2 apps

## Contribution

Please feel free to submit PRs :)

## Copyright

© 2014-2015 Trung Lê
