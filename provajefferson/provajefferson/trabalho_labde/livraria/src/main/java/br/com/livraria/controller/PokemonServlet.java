package br.com.livraria.controller;

import br.com.livraria.dao.PokemonDAO;
import br.com.livraria.model.Pokemon;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(urlPatterns = {"/pokemons", "/pokemons/novo", "/pokemons/inserir", "/pokemons/editar", "/pokemons/atualizar", "/pokemons/excluir"})
public class PokemonServlet extends HttpServlet {

    private PokemonDAO repositorioPokemon;

    @Override
    public void init() {
        repositorioPokemon = new PokemonDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rota = request.getServletPath();

        switch (rota) {
            case "/pokemons/novo":
                mostrarFormularioNovo(request, response);
                break;
            case "/pokemons/editar":
                mostrarFormularioEdicao(request, response);
                break;
            case "/pokemons/excluir":
                excluirPokemon(request, response);
                break;
            default:
                listarPokemons(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String rota = request.getServletPath();

        switch (rota) {
            case "/pokemons/inserir":
                inserirPokemon(request, response);
                break;
            case "/pokemons/atualizar":
                atualizarPokemon(request, response);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/pokemons");
                break;
        }
    }

    private void listarPokemons(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Pokemon> listaPokemons = repositorioPokemon.listarTodos();
        request.setAttribute("listaPokemons", listaPokemons);
        request.getRequestDispatcher("/pokemon-list.jsp").forward(request, response);
    }

    private void mostrarFormularioNovo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/pokemon-form.jsp").forward(request, response);
    }

    private void mostrarFormularioEdicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Pokemon pokemonEdicao = repositorioPokemon.buscarPorId(id);
        request.setAttribute("pokemon", pokemonEdicao);
        request.getRequestDispatcher("/pokemon-form.jsp").forward(request, response);
    }

    private void inserirPokemon(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Pokemon registroPokemon = extrairPokemonDoRequest(request);
        repositorioPokemon.adicionar(registroPokemon);
        response.sendRedirect(request.getContextPath() + "/pokemons");
    }

    private void atualizarPokemon(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Pokemon pokemonModificado = extrairPokemonDoRequest(request);
        pokemonModificado.setId(Integer.parseInt(request.getParameter("id")));
        repositorioPokemon.atualizar(pokemonModificado);
        response.sendRedirect(request.getContextPath() + "/pokemons");
    }

    private void excluirPokemon(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        repositorioPokemon.remover(id);
        response.sendRedirect(request.getContextPath() + "/pokemons");
    }

    private Pokemon extrairPokemonDoRequest(HttpServletRequest request) {
        String nome = request.getParameter("nome");
        String tipo = request.getParameter("tipo");
        int nivel = Integer.parseInt(request.getParameter("nivel"));
        Date dataCaptura = Date.valueOf(request.getParameter("dataCaptura"));

        return new Pokemon(0, nome, tipo, nivel, dataCaptura);
    }
}
