<h1>🛣️ Listado de Rutas</h1>

<a href="index.php?page=Mantenimientos-Rutas-Formulario&mode=INS">
    ➕ Nueva Ruta
</a>

<br><br>

<table border="1" cellpadding="8" cellspacing="0" width="100%">
    <thead style="background-color: #333; color: white;">
        <tr>
            <th>ID</th>
            <th>Origen</th>
            <th>Destino</th>
            <th>Distancia (km)</th>
            <th>Acciones</th>
        </tr>
    </thead>

    <tbody>

        {{foreach rutas}}
        <tr>
            <td>{{id}}</td>

            <td><strong>{{origen}}</strong></td>

            <td>{{destino}}</td>

            <td>
                <span style="color: blue; font-weight: bold;">
                    {{distancia_km}} km
                </span>
            </td>

            <td>

                <a href="index.php?page=Mantenimientos-Rutas-Formulario&mode=DSP&id={{id}}">
                    👁️ Ver
                </a>

                |

                <a href="index.php?page=Mantenimientos-Rutas-Formulario&mode=UPD&id={{id}}">
                    ✏️ Editar
                </a>

                |

                <a href="index.php?page=Mantenimientos-Rutas-Formulario&mode=DEL&id={{id}}"
                   onclick="return confirm('¿Eliminar esta ruta?');"
                   style="color: red;">
                    🗑️ Eliminar
                </a>

            </td>
        </tr>
        {{endfor rutas}}

        {{ifnot rutas}}
        <tr>
            <td colspan="5" style="text-align: center; color: gray;">
                ⚠️ No hay rutas registradas
            </td>
        </tr>
        {{endifnot rutas}}

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