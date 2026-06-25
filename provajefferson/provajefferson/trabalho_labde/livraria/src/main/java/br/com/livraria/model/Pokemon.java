package br.com.livraria.model;

import java.sql.Date;

public class Pokemon {

    private int id;
    private String nome;
    private String tipo;
    private int nivel;
    private Date dataCaptura;

    public Pokemon() {
    }

    public Pokemon(int id, String nome, String tipo, int nivel, Date dataCaptura) {
        this.id = id;
        this.nome = nome;
        this.tipo = tipo;
        this.nivel = nivel;
        this.dataCaptura = dataCaptura;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public Date getDataCaptura() {
        return dataCaptura;
    }

    public void setDataCaptura(Date dataCaptura) {
        this.dataCaptura = dataCaptura;
    }
}
