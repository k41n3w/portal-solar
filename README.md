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

Heroku deploy url: https://solar-sell.herokuapp.com/
