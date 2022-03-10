# PHP Infection - Mutation Test


Este repositório demonstra como realizar [testes de mutação](https://pt.wikipedia.org/wiki/Teste_de_muta%C3%A7%C3%A3o) 
utilizando a biblioteca [Infection](https://github.com/infection/infection), com o propósito de identificar brechas em testes automatizados e melhorá-los.

Teste de mutação consiste em realizar pequenas alterações no código fonte, a fim de verificar se os testes criados para aquela funcionalidade 
continuam passando, caracterizando um falso positivo.

---

## Dependências

- [Infection](https://github.com/infection/infection): `composer require --dev infection/infection`
- [PHPUnit](https://github.com/sebastianbergmann/phpunit): `composer require --dev phpunit/phpunit`

---

## Caso de exemplo

Dado uma função que realiza uma simples operação de soma:
```php
function somar(int $a, int $b): int {
    return $a + $b;
}
```

Dado a criação do teste:

```php
class MathTest extends \PHPUnit\Framework\TestCase
{
    public function testSum()
    {
        // When
        $value = somar(1,0);

        // Then
        $this->assertEquals(1, $value);
    }
}
```

Temos a falsa impressão de que o teste criado é suficiente, porém existe um problema, se algum desenvolvedor 
alterar o comportamento da função `somar` mudando o operador `+` por `-`, o teste continuaria funcionando, 
porém essa alteração criaria bugs na aplicação.


Para identificar essas brechas em testes automatizados, é utilizado testes de mutação, 
que faria esse trabalho de mudar partes do código (apenas em memória) e aplicar os testes do PHPUnit,
a fim de encontrar esses casos de falso positivo e gerar um relatório deles, facilitando a correção.

---

## Comandos para executar os testes

Testes comuns com PHPUnit: `composer test`

Testes de mutação: `composer test-mutant`

Após rodar os teste mutantes, será apresentado no console a porcentagem de mutantes encontrados, 
e um log mais detalhado estará disponível em `tests/infection-result.log`.

É importante ressaltar que testes de mutação são pesados, pois é aplicado os testes a cada modificação, então devem ser aplicados em momentos propícios.




