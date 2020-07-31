# Portal Solar - Dev Test

## Teste para vagas de Desenvolvimento



### Introdução

Aqui na Portal Solar utilizamos a linguagem Ruby juntamente com o framework Rails, famoso "RoR",
em grande parte das soluções que desenvolvemos para nossos produtos, mais pensamos muito na usabilidade 
dos nossos times e clientes, assim os frameworks JavaScripts são vistos com bons olhos.

Este teste tem foco nestes quesitos, onde buscamos profissionais com capacidade de abstração, organização,
e resolução de problemas.


#### O que procuramos?

Queremos profissionais que não apenas saibam escrever códigos, mais sim resolver problemas com eles, que não fiquem presos apenas a 
"sopa de letrinhas" mais consigam entregar soluções para os diversos problemas que surgem todos os dias aqui no Portal Solar. 
Estas soluções nem sempre é escrever um código Ruby por exemplo!
Leia com atenção pois a compreensão faz parte do processo, faça o máximo que conseguir do requisitos do Teste e não deixe de enviar no prazo estabelicido, isto já faz parte de sua avaliação.

Good Luck!


### Requisitos 

Este projeto utiliza:

- Ruby versão `2.6.3`
- Rails versão `5.2`

O banco de dados já está com o schema "pré pronto" e algumas informações necessárias o projeto.
Execute os comandos abaixo:

`$ bundle exec rails db:create db:migrate db:seed`


#### Objetivo geral

Implementar novas funcionalidades ao sistema de busca, recomendação e melhor custo de frete para geradores de energia.

#### Requisitos Principais

* Implementar uma funcionalidade de recomendação geradores de energia para o usuário utilizando os campos que existem no modelo de PowerGenerator. Em outras palavras, o usuário poderá informar alguns dados que possa ser utilizado para recomendar estes geradores de energia. Não se prenda a quantos e quais informações o usuário poderá informar. O algoritmo de escolha é livre, fique a vontade.

* Implementar função para consultar o custo do frete (_*model*_ Freight) baseado no CEP informado. Ao clicar no produto deve ser abrir uma modal, uma nova tela ou uma partial para tal função.
Dica: Utilize alguma API pública para descobrir cidade e estado através do CEP, irá ajudar no processo de precificação do frete. 

#### Requisitos Secundários

* Implementar um filtro simples que ordene por preço na tela inicial, trazendo os resultados ordenados por nome e adicionando paginação para mostrar somente 6 itens por página.

* Aplicar um segundo filtro baseado no anterior, ordenando por KWP.

* Implementar função para calcular o peso cubado do produto e persistir isso no banco.
Dica: [Cálculo para o peso cubado](https://blog.cargobr.com/cubagem-sem-misterio/) -> `Comprimento x Largura x Altura x Fator cubagem (300)`

* Modificar consulta do custo do frete afim de trazer o valor com o PESO MENOR do produto, ou seja, o valor do frete não importa e sim o peso do produto.
Dica: Verifique o valor baseado no peso do produto ou no peso cubado. (menor = melhor)

* Fazer ao menos testes unitários para serviços e métodos criados para a recomendação de geradores, consulta de CEP e a busca simples por nome, mas não se limitando, testes são sempre bem vindos.

#### Dicas marotas 

* Utilize as `gems` que achar necessário, porém o algoritmo de recomendação e melhor custo de frete será de sua responsabilidade.

* A descrição do produto também contém informações interessantes para recomendação de geradores de energia.

* As buscas e consulta de frete podem ser implementadas de maneira assíncrona via JavaScript, sem a necessidade de recarregar a página cada
vez que o usuário realizar uma buscar.

* Utilizar alguma plataforma para fazer deploy e deixar o projeto rodando, podendo ser o heroku por exemplo.

* Docker, Dockerfile, docker compose, images, volumes, network, CI, CD, enfim, gostamos muitos de tudo isso!

* Crie um repositório para a solução desenvolvida no Github.


#### Você será avalidado como:

* Cumprimento dos requisitos principais.

* Cumprimento dos requisitos secundárias, caso faça.

* Testes, caso faça.

* Extras sugeridos por nós ou que tenha feito, desde que justifique o uso, assim podemos análisar e validar.

* Organização e estrutura dos códigos implementados.



### Ao Finalizar

Envie seu projeto, links, repositório, o que julgar necessário para avaliação do teste para o email:

*dev@portalsolar.com.br*


Assunto: Dev Teste - Meu Nome


