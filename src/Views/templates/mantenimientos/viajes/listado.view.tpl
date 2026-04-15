<h1>🧭 Listado de Viajes</h1>

<a href="index.php?page=Mantenimientos-Viajes-Formulario&mode=INS">
    ➕ Nuevo Viaje
</a>

<br><br>

<table border="1" cellpadding="8" cellspacing="0" width="100%">
    <thead style="background-color: #333; color: white;">
        <tr>
            <th>ID</th>
            <th>Ruta</th>
            <th>Bus</th>
            <th>Fecha Salida</th>
            <th>Precio</th>
            <th>Estado</th>
            <th>Acciones</th>
        </tr>
    </thead>

    <tbody>

        {{foreach viajes}}
        <tr>
            <td>{{id}}</td>

            <td><strong>{{ruta}}</strong></td>

            <td>{{placa}}</td>

            <td>{{fecha_salida}}</td>

            <td>
                <span style="color: blue; font-weight: bold;">
                    L. {{precio}}
                </span>
            </td>

            <td>
                <span style="color: green; font-weight: bold;">
                    {{estado}}
                </span>
            </td>

            <td>

                <a href="index.php?page=Mantenimientos-Viajes-Formulario&mode=DSP&id={{id}}">
                    👁️ Ver
                </a>

                |

                <a href="index.php?page=Mantenimientos-Viajes-Formulario&mode=UPD&id={{id}}">
                    ✏️ Editar
                </a>

                |

                <a href="index.php?page=Mantenimientos-Viajes-Formulario&mode=DEL&id={{id}}"
                   onclick="return confirm('¿Eliminar este viaje?');"
                   style="color: red;">
                    🗑️ Eliminar
                </a>

            </td>
        </tr>
        {{endfor viajes}}

        {{ifnot viajes}}
        <tr>
            <td colspan="7" style="text-align: center; color: gray;">
                ⚠️ No hay viajes registrados
            </td>
        </tr>
        {{endifnot viajes}}

    </tbody>
</table>

<div style="text-align:center; margin-top:20px;">
    <a href="index.php?page=Mantenimientos-Dashboard-Dashboard"
       style="
        display:inline-block;
        padding:12px 20px;
        background:linear-gradient(135deg, #6c757d, #495057);
        color:white;
        text-decoration:none;
        border-radius:4px;
        font-weight:bold;
        transition:0.3s;
    ">
        ⬅ Volver al Dashboard
    </a>
</div>