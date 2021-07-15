# MARKETPLACE BACKOFFICE

> Marketplace Backoffice is a backend to provide marketplace-app needs
> and end-to-end marketplace addons management system.

## Tech Stack

Marketplace Backoffice uses a number of frameworks or libraries to work properly:

- [Rails] - Web application framework written in ruby
- [Postgres] - PostgreSQL is a powerful, open source object-relational database
- [Active Admin] - Active Admin is a Ruby on Rails plugin for generating administration style interfaces
- [Active Storage] - Active Storage facilitates uploading files to a cloud storage service like Amazon S3, Google Cloud Storage, or Microsoft Azure Storage and attaching those files to Active Record objects
- [Docker] - Docker is a set of platform as a service products that use OS-level virtualization to deliver software in packages called containers (soon)

## Installation

Before being able to install, Marketplace Backoffice requires a number of dependencies.
Here are dependencies required by Marketplace Backoffice:

- ruby 2.6.6
- gem
- bundler
- postgresql

Afterwards here are steps how Marketplace Backoffice can be installed and work properly on your machine:

- `cd your/project/path`
- `touch config/application.yml`
  this `yml` used by rails as environment variables definition, here's the example

  ```yaml
  API_SECRET_KEY: "{ASK}"
  CCI_URL: "https://cci-marketplace.herokuapp.com"

  DATABASE_HOST: "{YOUR_HOST}"
  DATABASE_PORT: "{YOUR_DATABASE_PORT}"
  DATABASE_USERNAME: "{YOUR_DATABASE_USERNAME}"
  DATABASE_PASSWORD: "{YOUR_DATABASE_PASSWORD}"
  DATABASE_NAME: "{YOUR_DATABASE_NAME}"

  AWS_ACCESS_KEY_ID: "{ASK}"
  AWS_SECRET_ACCESS_KEY: "{ASK}"

  RAILS_ENV: "development"
  ```

- `bundle install` _this will install rails dependencies using bundle_
- `rake db:migrate`
- `rake db:seed`
- `rails s` _by default rails use port 3000_

Congrats you just install it on your machine if no error happens during installation ofcourse. You can now open in your browser `http://localhost:{desired_port/3000}`

[rails]: https://rubyonrails.org/
[postgres]: https://www.postgresql.org/
[active admin]: https://activeadmin.info/
[active storage]: https://edgeguides.rubyonrails.org/active_storage_overview.html
[docker]: https://www.docker.com/
