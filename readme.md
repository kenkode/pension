Hasoft Laravel Demo
-------------------

Steps
-----

- First clone this repository


```sh
git clone https://gitlab.com/hasoft/laravel-demo.git
```

- Now get the composer dependancies

```sh
composer install
```

- Copy .env.example to .env

- Now edit the .env file to add your database credentials.
You can also update the APP_URL variable to point to your current working webserver.

- Now generate your unique app key with the command

```sh
php artisan key:generate
```

