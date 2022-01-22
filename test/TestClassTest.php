<?php

namespace splintist\test;

use PHPUnit\Framework\TestCase;
use splintist\MyFirstClass;

class TestClassTest extends TestCase
{
    public function testCanBeCreatedFromString()
    {
        $testClass = MyFirstClass::createFromString('Yo');

        $this->assertInstanceOf(MyFirstClass::class, $testClass);
    }

    public function testCanBeReturnedAsString()
    {
        $testClass = MyFirstClass::createFromString('Yo');

        $value = $testClass->asString();

        $this->assertEquals('Yo', $value);
    }
}
