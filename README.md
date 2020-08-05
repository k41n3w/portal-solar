[![Maintainability](https://api.codeclimate.com/v1/badges/7120af2306b15e9ccd9d/maintainability)](https://codeclimate.com/github/kaioramos/portal-solar/maintainability)

Commands to make run this project:
```
sudo docker-compose build
sudo docker-compose run --rm web bash
```

Inside the container
```
- bundle install
- yarn
```

Once again outside the container type
sudo docker-compose up web

If you run rspec suite test, inside the container type:
```
rspec
```

If you run rubocop bettercode test suite, inside the container type:
```
rubocop
```

If you run simplecov to check tests status, inside the container type:
```
COVERAGE=true rspec
```

To check the simplecov reports, go to coverage folder on root_path, open index.html with your browser. Today we've a 100.0% covered. 

LINK TO HEROKU DEPLOY: https://portal-solar-v2.herokuapp.com/
