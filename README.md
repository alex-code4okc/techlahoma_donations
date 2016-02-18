== README


getting started
==========

## Prerequisites

You will need the following things properly installed on your computer.

* postgres


## Project Dependencies

To access the admin area you will need the following related projects installed and running on
your computer.

* [techlahoma/techlahoma](https://github.com/techlahoma/techlahoma)

## Rails setup
```
> git clone https://github.com/techlahoma/techlahoma_donations.git
> cd techlahoma_donations
> bundle install
```

## Database setup

Make sure that postgress is running locally and then run:

```
> rake db:create
> rake db:migrate
```

## Configuration

This app relies on several environment variables being set. You should copy the
`dotenv.sample.env` file to `.env` and update the values there as
needed. The default values should get you going with a complete local
setup.

If you're working directly with one of the integrated services
(Stripe, etc...) you'll want to create your own development
account there in order to see exactly what's happening. If you do that
make sure to update your `.env` file accordingly. (Don't forget to also
update `.env` in the related projects!)

## Auth Configuration

Go to the /oauth/applications endpoint on the Techlahoma installation that you want to integrate with.
For development this will probably be http://localhost:3000/oauth/applications.

Create a new application, and set the callback URL to http://localhost:5001/auth/techlahoma/callback.
Change the port if you plan to run this app on a different port.

After creating the app copy the Application ID and Secret into your `.env` file.

## Running tests

```
> rake test
```

## Starting the rails server
```
> foreman start
```

## Running a rails console
```
> rails c
```

## Deployment

Deployment happens automatically through [WE_NEED_A_CI_SERVICE]. Any pushes to `master` will be deployed. **This isn't actually true yet.**
This is deployed on heroku, and currently is deployed through direct pushing.


