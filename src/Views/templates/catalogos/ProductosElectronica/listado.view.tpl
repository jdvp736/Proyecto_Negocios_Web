<section class="container">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        th, td {
            border: 1px solid #bfbfbf;
            padding: 8px 10px;
            text-align: left;
        }
        th {
            background-color: #e5e5e5;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f7f7f7;
        }
        tr:hover {
            background-color: #ececec;
        }
        a {
            text-decoration: none;
        }
    </style>
    <table class="">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Tipo</th>
                <th>Precio</th>
                <th>Marca</th>
                <th>Fecha Lanzamiento</th>
                <th>
                    <a href="index.php?page=Catalogos-ProductosElectronica-Formulario&mode=INS&id=0">
                        Nuevo
                    </a>
                </th>
            </tr>
        </thead>
        <tbody>
            {{foreach productos}}
            <tr>
                <td>{{id_producto}}</td>
                <td>{{nombre}}</td>
                <td>{{tipo}}</td>
                <td>{{precio}}</td>
                <td>{{marca}}</td>
                <td>{{fecha_lanzamiento}}</td>
                <td>
                    <a href="index.php?page=Catalogos-ProductosElectronica-Formulario&mode=DSP&id={{id_producto}}">
                        Mostrar
                    </a>
                    <br/>

                    <a href="index.php?page=Catalogos-ProductosElectronica-Formulario&mode=UPD&id={{id_producto}}">
                        Actualizar
                    </a>
                    <br/>

                    <a href="index.php?page=Catalogos-ProductosElectronica-Formulario&mode=DEL&id={{id_producto}}">
                        Eliminar
                    </a>
                </td>
            </tr>
            {{endfor productos}}
        </tbody>
    </table>
</section>