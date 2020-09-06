/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author pfela
 */
public class Produto {
    private int idProduto;
    private String nome;
    private int qtd;
    private double valor;

    public Produto() {
    }

    public Produto(int idProduto, String nome, int qtd, double valor) {
        this.idProduto = idProduto;
        this.nome = nome;
        this.qtd = qtd;
        this.valor = valor;
    }

    public int getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getQtd() {
        return qtd;
    }

    public void setQtd(int qtd) {
        this.qtd = qtd;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    @Override
    public String toString() {
        return "Produto{" + "nome=" + nome + '}';
    }
    
    
    
    
}
