# myfitnesspal-minder

Synchronize beeminder data points with entered meals on MyFitnessPal. It looks at breakfast,
lunch and dinner and enters "1" if it has any entry. This way, a goal with 3 "meals" per day should
properly motivate to always file meals.

## The Simplest Thing that Could Possible Work

Prerequisites:
* Docker installed and running.
* Create a new "Do More" goal with 3 meals/day at https://www.beeminder.com/new and call it "mfp-meals".
* Get your auth token by visiting (need to be logged in): https://www.beeminder.com/api/v1/auth_token.json
* Copy the `.env.template` file to `.env` and fill in the variables.

    make dev

The `dev` target creates a Docker image and runs it in dev mode, meaning the source directory is mounted inside the container. So, any changes will be reflected - just run `make run-dev` afterwards, no need to build the image again.

## Deploy to Heroku

Create a heroku account, then:

    heroku login
    heroku create
    heroku config:set MFP_USERNAME=email@address.com
    heroku config:set MFP_PASSWORD=xyz..
    heroku config:set BM_USERNAME=username
    heroku config:set BM_AUTH_TOKEN=auth-token
    heroku config:set BM_GOAL=mfp-meals

Deploy the app:

    git push heroku master

Look at the logs:

    heroku logs --tail

Then, open the [scheduler](https://devcenter.heroku.com/articles/scheduler#scheduling-jobs) add-on:

    heroku addons:open scheduler

And create a new job with the command: `python bin/myfitnesspal-minder` and a frequency of `hourly`.

## Thanks

Derived from katrielalex's script: https://gist.github.com/katrielalex/6302010eaf3fb5d25359
