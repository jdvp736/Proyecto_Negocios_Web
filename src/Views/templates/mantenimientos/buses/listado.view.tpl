<h1>Listado de Buses</h1>

<a href="index.php?page=Mantenimientos-Buses-Formulario&mode=INS">
    ➕ Nuevo Bus
</a>

<br><br>

<table border="1" cellpadding="5" cellspacing="0">
    <thead>
        <tr>
            <th>ID</th>
            <th>Placa</th>
            <th>Tipo</th>
            <th>Estado</th>
            <th>Acciones</th>
        </tr>
    </thead>

    <tbody>

        {{foreach buses}}
        <tr>
            <td>{{id}}</td>
            <td>{{placa}}</td>
            <td>{{tipo}}</td>
            <td>{{estado}}</td>
            <td>
                <a href="index.php?page=Mantenimientos-Buses-Formulario&mode=UPD&id={{id}}">
                    ✏️ Editar
                </a>
                |
                <a href="index.php?page=Mantenimientos-Buses-Formulario&mode=DEL&id={{id}}"
                   onclick="return confirm('¿Seguro que deseas eliminar este bus?');">
                    🗑️ Eliminar
                </a>
                |
                <a href="index.php?page=Mantenimientos-Buses-Formulario&mode=DSP&id={{id}}">
                    👁️ Ver
                </a>
            </td>
        </tr>
        {{endfor buses}}

        {{ifnot buses}}
        <tr>
            <td colspan="5">No hay buses registrados</td>
        </tr>
        {{endifnot buses}}

    </tbody>
</table>