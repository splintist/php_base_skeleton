<?php declare(strict_types=1);

namespace splintist;

class MyFirstClass
{
    private string $value;

    private function __construct(string $value)
    {
        $this->value = $value;
    }

    public static function createFromString(string $value): MyFirstClass
    {
        return new self($value);
    }

    public function asString(): string
    {
        return $this->value;
    }
}