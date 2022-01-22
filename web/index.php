<?php declare(strict_types=1);

use splintist\MyFirstClass;

require_once('/var/www/vendor/autoload.php');

#init your App here
$myClass = MyFirstClass::createFromString('Hello World');

echo $myClass->asString();
phpinfo();