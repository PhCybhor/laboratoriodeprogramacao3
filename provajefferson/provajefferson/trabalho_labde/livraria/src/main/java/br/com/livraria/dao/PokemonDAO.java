package br.com.livraria.dao;

import br.com.livraria.model.Pokemon;
import br.com.livraria.util.Conexao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PokemonDAO {

    private final Conexao fonteDados;

    public PokemonDAO() {
        this.fonteDados = new Conexao();
    }

    public void adicionar(Pokemon registro) {
        String consulta = "INSERT INTO pokemon (nome, tipo, nivel, data_captura) VALUES (?, ?, ?, ?)";
        try (Connection conexaoJdbc = fonteDados.getConexao();
             PreparedStatement comando = conexaoJdbc.prepareStatement(consulta)) {

            comando.setString(1, registro.getNome());
            comando.setString(2, registro.getTipo());
            comando.setInt(3, registro.getNivel());
            comando.setDate(4, registro.getDataCaptura());
            comando.execute();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao adicionar pokemon", e);
        }
    }

    public void atualizar(Pokemon registro) {
        String consulta = "UPDATE pokemon SET nome = ?, tipo = ?, nivel = ?, data_captura = ? WHERE id = ?";
        try (Connection conexaoJdbc = fonteDados.getConexao();
             PreparedStatement comando = conexaoJdbc.prepareStatement(consulta)) {

            comando.setString(1, registro.getNome());
            comando.setString(2, registro.getTipo());
            comando.setInt(3, registro.getNivel());
            comando.setDate(4, registro.getDataCaptura());
            comando.setInt(5, registro.getId());
            comando.execute();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao atualizar pokemon", e);
        }
    }

    public void remover(int id) {
        String consulta = "DELETE FROM pokemon WHERE id = ?";
        try (Connection conexaoJdbc = fonteDados.getConexao();
             PreparedStatement comando = conexaoJdbc.prepareStatement(consulta)) {

            comando.setInt(1, id);
            comando.execute();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao remover pokemon", e);
        }
    }

    public List<Pokemon> listarTodos() {
        List<Pokemon> retorno = new ArrayList<>();
        String consulta = "SELECT * FROM pokemon ORDER BY id ASC";

        try (Connection conexaoJdbc = fonteDados.getConexao();
             PreparedStatement comando = conexaoJdbc.prepareStatement(consulta);
             ResultSet resultado = comando.executeQuery()) {

            while (resultado.next()) {
                retorno.add(montarPokemon(resultado));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao listar pokemons", e);
        }
        return retorno;
    }

    public Pokemon buscarPorId(int id) {
        String consulta = "SELECT * FROM pokemon WHERE id = ?";

        try (Connection conexaoJdbc = fonteDados.getConexao();
             PreparedStatement comando = conexaoJdbc.prepareStatement(consulta)) {

            comando.setInt(1, id);
            try (ResultSet resultado = comando.executeQuery()) {
                if (resultado.next()) {
                    return montarPokemon(resultado);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao buscar pokemon", e);
        }
        return null;
    }

    private Pokemon montarPokemon(ResultSet resultado) throws SQLException {
        Pokemon item = new Pokemon();
        item.setId(resultado.getInt("id"));
        item.setNome(resultado.getString("nome"));
        item.setTipo(resultado.getString("tipo"));
        item.setNivel(resultado.getInt("nivel"));
        item.setDataCaptura(resultado.getDate("data_captura"));
        return item;
    }
}
