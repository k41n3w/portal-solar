# Portal Solar
> Indica equipamentos e calcula frete.

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/d5e958c3b48740f1a9c6db272a7cc3dc)](https://app.codacy.com/manual/kaineo/portal-solar?utm_source=github.com&utm_medium=referral&utm_content=kaioramos/portal-solar&utm_campaign=Badge_Grade_Dashboard)
[![Build Status](https://travis-ci.com/kaioramos/portal-solar.svg?branch=master)](https://travis-ci.com/kaioramos/portal-solar)[![Maintainability](https://api.codeclimate.com/v1/badges/7120af2306b15e9ccd9d/maintainability)](https://codeclimate.com/github/kaioramos/portal-solar/maintainability)[![codecov](https://codecov.io/gh/kaioramos/portal-solar/branch/master/graph/badge.svg)](https://codecov.io/gh/kaioramos/portal-solar)




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
