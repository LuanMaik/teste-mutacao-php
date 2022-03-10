<?php

use App\Math;

class MathTest extends \PHPUnit\Framework\TestCase
{
    public function testSum()
    {
        // Given
        $math = new Math();

        // When
        $value = $math->sum(1,0);

        // Then
        $this->assertEquals(1, $value);
    }
}