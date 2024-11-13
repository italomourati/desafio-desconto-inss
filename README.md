# Desconto INSS

Uma aplicação em Rails para cálculo progressivo de desconto do INSS com listagem paginada de funcionários e geração de relatório com gráfico.

## Tecnologias Utilizadas

- **Ruby on Rails**: 7.x
- **PostgreSQL**: Banco de dados
- **Redis**: Para processamento de jobs em background
- **Sidekiq**: Processamento de jobs com Redis
- **Bootstrap**: Estilização do frontend
- **Chart.js**: Visualização de gráficos
- **Kaminari**: Paginação de dados
- **Rubocop-rails**: Para linting e boas práticas de Rails
- **RSpec**: Para testes unitários e de integração
- **capybara**: Para testes interface
- **requestjs**: Encapsula a lógica para enviar por padrão alguns cabeçalhos que são necessários para aplicativos Rails como o X-CSRF-Token.

## Funcionalidades

1. **CRUD de Proponentes**: Gerenciamento dos proponentes, incluindo dados pessoais, endereço, telefone e salário.
2. **Cálculo do Desconto INSS**: Cálculo progressivo do INSS baseado em faixas salariais com atualização via AJAX.
3. **Relatório de Faixas Salariais**: Exibição do total de proponentes em cada faixa salarial, tanto em listagem quanto em gráfico.
4. **Atualização de Salário**: Uso do Sidekiq para atualização de salários em background.
5. **Autenticação**: Implementada com Devise para segurança do sistema.

## Requisitos

- **Docker** (para execução com Docker)
- **Ruby** 3.2.2 e **Rails** 7.x (para execução sem Docker)
- **PostgreSQL**
- **Redis**

## Configuração

### Com Docker

1. Clone o repositório e acesse o diretório:

  ```bash
  git clone [URL do repositório]
  cd nome_do_projeto
  ```

2. Construa e inicie os containers:

  ```bash
  docker compose -f ./.devcontainer/docker-compose.yml up --build
  ```

3. Execute as migrations e seeds:

  ```bash
  docker-compose -f ./.devcontainer/docker-compose.yml run rails_app rails db:create db:migrate db:seed
  ```

4. Acesse a aplicação em `http://localhost:3000`.

### Sem Docker

1. Clone o repositório e acesse o diretório:

  ```bash
  git clone [URL do repositório]
  cd nome_do_projeto
  ```

2. Instale as dependências do projeto:

  ```bash
  bundle install
  ```

3. Crie o arquivo `.env` baseado no `.env.example` e configure as variáveis de ambiente.

4. Execute as migrations e seeds:

  ```bash
  docker-compose run rails_app rails db:create db:migrate db:seed
  ```

5. Inicie o Redis e o Sidekiq para os jobs em background:

  ```bash
  redis-server
  bundle exec sidekiq
  ```

6. Inicie o servidor Rails:

  ```bash
  bin/rails s
  ```

## Testes

Testes foram desenvolvidos em RSpec seguindo o TDD. Para executar:

```bash
bundle exec rspec
```

## Linters

Para manter a consistência do código, utilize o Rubocop:

```bash
bundle exec rubocop
```

## Estrutura do Projeto

- app/models: Modelos e cálculos de desconto de INSS.
- app/controllers: CRUD de proponentes e lógica de relatórios.
- app/jobs: Jobs para atualização de salários.
- app/views: Templates com Bootstrap para UI e Chart.js para gráficos.

## Considerações Finais

Este projeto foi desenvolvido com foco em boas práticas de desenvolvimento em Rails, implementando um sistema de cálculo progressivo de INSS e uma funcionalidade de relatório com gráficos. Utilizamos o Sidekiq para o processamento de tarefas em segundo plano, e o RSpec para testes unitários, garantindo a qualidade do código. Também foi implementado o Capybara para testes de interface. Para a interação dinâmica no frontend, utilizamos o Stimulus para calcular o INSS e atualizar o valor em tempo real, proporcionando uma experiência mais fluida ao usuário. Além disso, o [**Request.js**](https://github.com/rails/request.js) foi utilizado para otimizar e ajustar as requisições, garantindo uma comunicação eficiente entre o frontend e o backend.

Durante o desenvolvimento, percebi alguns pontos de melhoria para projetos futuros:

- **Paginação**: Em vez de utilizar o Kaminari, recomendaria o uso do Pagy, que apresenta um desempenho superior e é mais leve, especialmente em aplicações com grande volume de dados.
- **Arquitetura de Frontend**: Para tornar a interface mais modular e reutilizável, sugeriria a adoção do conceito de componentes, utilizando ferramentas como o Phlex ou o ViewComponents. Esses frameworks proporcionam uma maneira mais eficiente e escalável de organizar as views.
- **Design Customizado**: Para um design mais flexível e com total controle sobre o estilo, recomendaria o uso do Tailwind CSS em vez do Bootstrap. O Tailwind oferece uma abordagem utilitária que permite um design totalmente customizado, além de ser mais leve e eficiente para personalização.

Essas melhorias podem proporcionar uma maior performance, escalabilidade e flexibilidade ao projeto, mantendo a consistência e a modularidade ao longo do desenvolvimento.
