-- AV2 - Laboratorio de Programacao III
-- Tabela Pokemon (banco livraria - PostgreSQL)

CREATE TABLE IF NOT EXISTS pokemon (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    nivel INTEGER NOT NULL,
    data_captura DATE NOT NULL
);
