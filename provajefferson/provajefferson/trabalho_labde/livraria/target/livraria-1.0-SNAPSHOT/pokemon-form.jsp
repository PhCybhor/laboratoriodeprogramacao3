<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pokemon | Gerenciar</title>
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
            --input-bg: #18181b;
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
            max-width: 800px;
            margin: auto;
            padding: 4rem 2rem;
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .form-card {
            background: var(--card-bg);
            border: 1px solid var(--border);
            border-radius: 24px;
            padding: 4rem;
            width: 100%;
        }

        .form-title {
            font-size: 2.5rem;
            font-weight: 800;
            margin-bottom: 2rem;
            text-align: center;
        }

        .form-group { margin-bottom: 1.75rem; }

        .form-label {
            display: block;
            font-size: 0.875rem;
            color: var(--text-muted);
            margin-bottom: 0.5rem;
        }

        .form-control {
            width: 100%;
            padding: 0.875rem 1.25rem;
            font-family: inherit;
            font-size: 1rem;
            color: var(--text-main);
            background: var(--input-bg);
            border: 1px solid var(--border);
            border-radius: 12px;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 4px rgba(13, 148, 136, 0.15);
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }

        .action-buttons {
            display: flex;
            gap: 1.25rem;
            margin-top: 2rem;
        }

        .btn {
            flex: 1;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 1rem;
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

        .nav-links {
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .nav-links a {
            color: var(--primary);
            text-decoration: none;
            margin: 0 0.75rem;
            font-size: 0.875rem;
        }

        @media (max-width: 640px) {
            .form-row { grid-template-columns: 1fr; }
            .form-card { padding: 2rem 1.5rem; }
            .action-buttons { flex-direction: column-reverse; }
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="form-card">
            <div class="nav-links">
                <a href="${pageContext.request.contextPath}/pokemons">Pokemon</a>
                <a href="${pageContext.request.contextPath}/">Menu</a>
            </div>

            <h2 class="form-title">
                <c:choose>
                    <c:when test="${pokemon != null && pokemon.id > 0}">Editar Pokemon</c:when>
                    <c:otherwise>Novo Pokemon</c:otherwise>
                </c:choose>
            </h2>

            <form action="${pageContext.request.contextPath}/pokemons/${pokemon != null && pokemon.id > 0 ? 'atualizar' : 'inserir'}" method="post">
                <c:if test="${pokemon != null && pokemon.id > 0}">
                    <input type="hidden" name="id" value="<c:out value='${pokemon.id}' />" />
                </c:if>

                <div class="form-group">
                    <label class="form-label" for="nome">Nome</label>
                    <input type="text" id="nome" class="form-control" name="nome"
                           value="<c:out value='${pokemon.nome}' />"
                           required maxlength="255">
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label" for="tipo">Tipo</label>
                        <input type="text" id="tipo" class="form-control" name="tipo"
                               value="<c:out value='${pokemon.tipo}' />"
                               required maxlength="100">
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="nivel">Nivel</label>
                        <input type="number" id="nivel" class="form-control" name="nivel"
                               value="<c:out value='${pokemon.nivel}' />"
                               required min="1" max="100">
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="dataCaptura">Data Captura</label>
                    <input type="date" id="dataCaptura" class="form-control" name="dataCaptura"
                           value="<fmt:formatDate value='${pokemon.dataCaptura}' pattern='yyyy-MM-dd' />"
                           required>
                </div>

                <div class="action-buttons">
                    <a href="${pageContext.request.contextPath}/pokemons" class="btn btn-outline">Cancelar</a>
                    <button type="submit" class="btn btn-primary">Salvar</button>
                </div>
            </form>
        </div>
    </div>

</body>
</html>
