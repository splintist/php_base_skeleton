#!/bin/bash
if [[ $1 == 'testdox' ]]; then
  docker exec -it baseapp php ./vendor/bin/phpunit --testdox
else
  docker exec -it baseapp php ./vendor/bin/phpunit
fi