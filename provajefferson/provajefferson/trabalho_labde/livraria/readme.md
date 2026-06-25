# Sistema de Livraria

Trabalho desenvolvido para a disciplina de **Laboratorio de Programacao 3** (3º Semestre).

---

### Integrantes
*   **Murilo Rocha Silva**
*   **Pedro Henrique Rodrigues da Silva**
*   **Marcos Paulo Coleta Caetano**

---

### Tecnologias (conforme curso Java JSP)
*   **Java JDK 17** (Eclipse Temurin)
*   **Apache Tomcat 9**
*   **Apache NetBeans**
*   **Java Web** (Servlets e JSP)
*   **Maven**
*   **PostgreSQL**

---

### Estrutura do Projeto

```
livraria/
├── pom.xml
├── sql/
│   └── pokemon.sql
└── src/main/
    ├── java/br/com/livraria/
    │   ├── controller/   (Servlets)
    │   ├── dao/          (Acesso ao banco)
    │   ├── model/        (Classes de dominio)
    │   └── util/         (Conexao JDBC)
    └── webapp/
        ├── index.jsp
        ├── META-INF/context.xml
        └── *.jsp
```

---

### Como Executar

#### 1. Banco de Dados
Certifique-se de que o **PostgreSQL** esteja rodando na porta `5432`. Verifique o usuario e a senha no arquivo:
`src/main/java/br/com/livraria/util/Conexao.java`

As tabelas sao criadas automaticamente na primeira conexao.

#### 2. Execucao via NetBeans
1. Abra a pasta `livraria` no **Apache NetBeans**.
2. Configure o **JDK 17** e o **Apache Tomcat 9** nas propriedades do projeto.
3. Execute **Clean and Build**.
4. Clique em **Run** para iniciar no Tomcat.

#### 3. Execucao via Maven
```bash
set JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-17.0.10.7-hotspot
mvn clean package
```

#### 4. Acesso ao Sistema
Acesse o sistema pelo endereco:
**http://localhost:8080/livraria/**

- Livros: `/livros`
- Estados: `/estados`
- Pokemon (AV2): `/pokemons`

#### 5. Tabela Pokemon (AV2)
A tabela `pokemon` possui:
- `id` SERIAL PRIMARY KEY
- `nome` VARCHAR(255)
- `tipo` VARCHAR(100)
- `nivel` INTEGER
- `data_captura` DATE
