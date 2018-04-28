# myfitnesspal-minder

Add a beeminder data point every day you enter a meal in myfitnesspal.

## The Simplest Thing that Could Possible Work

Prerequisites:
* Docker installed and running.
* Create a new "Do More" goal at https://www.beeminder.com/new
* Get your auth token by visiting: https://www.beeminder.com/api/v1/auth_token.json
* Copy the `.env.template` file to `.env` and fill in the variables.

    docker-compose up

## Thanks

Derived from katrielalex's script: https://gist.github.com/katrielalex/6302010eaf3fb5d25359
