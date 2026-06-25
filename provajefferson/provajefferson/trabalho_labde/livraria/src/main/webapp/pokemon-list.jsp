<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pokemon | Cadastro</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #0d9488;
            --primary-hover: #0f766e;
            --bg-dark: #18181b;
            --card-bg: #27272a;
            --text-main: #fafafa;
            --text-muted: #a1a1aa;
            --border: #3f3f46;
            --danger: #dc2626;
            --accent: #f59e0b;
        }

        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--bg-dark);
            color: var(--text-main);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .container {
            width: 100%;
            max-width: 1100px;
            margin: 0 auto;
            padding: 4rem 2rem;
            flex: 1;
        }

        .nav-links a {
            color: var(--primary);
            text-decoration: none;
            margin-right: 1rem;
            font-size: 0.875rem;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 3rem;
            flex-wrap: wrap;
            gap: 1.5rem;
        }

        .header h1 { font-size: 2.5rem; font-weight: 800; }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.75rem 1.5rem;
            font-size: 1rem;
            font-weight: 600;
            text-decoration: none;
            border-radius: 12px;
            border: none;
            cursor: pointer;
        }

        .btn-primary {
            background: linear-gradient(to right, var(--primary), var(--primary-hover));
            color: #fff;
        }

        .btn-outline {
            background: rgba(255, 255, 255, 0.05);
            color: var(--text-main);
            border: 1px solid var(--border);
        }

        .btn-danger {
            background: rgba(220, 38, 38, 0.1);
            color: var(--danger);
            border: 1px solid rgba(220, 38, 38, 0.2);
        }

        .table-card {
            background: var(--card-bg);
            border: 1px solid var(--border);
            border-radius: 24px;
            overflow: hidden;
        }

        table { width: 100%; border-collapse: collapse; }

        th, td {
            padding: 1.25rem 1.5rem;
            text-align: left;
            border-bottom: 1px solid var(--border);
        }

        th {
            color: var(--text-muted);
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        tr:last-child td { border-bottom: none; }

        .tipo-badge {
            display: inline-block;
            background: rgba(245, 158, 11, 0.2);
            color: var(--accent);
            font-weight: 700;
            padding: 0.25rem 0.75rem;
            border-radius: 8px;
        }

        .nivel-badge {
            display: inline-block;
            background: rgba(13, 148, 136, 0.2);
            color: var(--primary);
            font-weight: 700;
            padding: 0.25rem 0.75rem;
            border-radius: 8px;
        }

        .actions { display: flex; gap: 0.75rem; }
        .actions .btn { padding: 0.5rem 1rem; font-size: 0.875rem; }

        .empty-state {
            text-align: center;
            padding: 4rem;
            color: var(--text-muted);
        }

        .footer {
            padding: 3rem 2rem;
            text-align: center;
            border-top: 1px solid var(--border);
            color: var(--text-muted);
            font-size: 0.875rem;
        }

        @media (max-width: 768px) {
            .table-card { overflow-x: auto; }
            table { min-width: 700px; }
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/livros">Livros</a>
            <a href="${pageContext.request.contextPath}/estados">Estados</a>
            <a href="${pageContext.request.contextPath}/">Menu</a>
        </div>

        <header class="header">
            <h1>Pokemon</h1>
            <a href="${pageContext.request.contextPath}/pokemons/novo" class="btn btn-primary">+ Novo Pokemon</a>
        </header>

        <c:choose>
            <c:when test="${empty listaPokemons}">
                <div class="empty-state">
                    <h2 style="margin-bottom: 1rem;">Nenhum pokemon cadastrado</h2>
                    <p>Cadastre o primeiro pokemon do sistema.</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="table-card">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nome</th>
                                <th>Tipo</th>
                                <th>Nivel</th>
                                <th>Data Captura</th>
                                <th>Acoes</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="pokemon" items="${listaPokemons}">
                                <tr>
                                    <td><c:out value="${pokemon.id}" /></td>
                                    <td><c:out value="${pokemon.nome}" /></td>
                                    <td><span class="tipo-badge"><c:out value="${pokemon.tipo}" /></span></td>
                                    <td><span class="nivel-badge">Nv. <c:out value="${pokemon.nivel}" /></span></td>
                                    <td>
                                        <fmt:formatDate value="${pokemon.dataCaptura}" pattern="dd/MM/yyyy" />
                                    </td>
                                    <td>
                                        <div class="actions">
                                            <a href="${pageContext.request.contextPath}/pokemons/editar?id=<c:out value='${pokemon.id}' />"
                                               class="btn btn-outline">Editar</a>
                                            <a href="${pageContext.request.contextPath}/pokemons/excluir?id=<c:out value='${pokemon.id}' />"
                                               class="btn btn-danger"
                                               onclick="return confirm('Excluir este pokemon?');">Excluir</a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <footer class="footer">
        <p>AV2 - Laboratorio de Programacao III • Pedro Henrique Rodrigues da Silva</p>
        <p>phessilva@gmail.com</p>
    </footer>

</body>
</html>
