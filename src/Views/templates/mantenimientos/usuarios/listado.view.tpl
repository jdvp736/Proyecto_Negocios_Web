<h1>👤 Listado de Usuarios</h1>

<a href="index.php?page=Mantenimientos-Usuarios-Formulario&mode=INS">
    ➕ Nuevo Usuario
</a>

<br><br>

<table border="1" cellpadding="8" cellspacing="0" width="100%">
    <thead style="background-color: #333; color: white;">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Email</th>
            <th>Rol</th>
            <th>Estado</th>
            <th>Fecha Creación</th>
            <th>Acciones</th>
        </tr>
    </thead>

    <tbody>

        {{foreach usuarios}}
        <tr>
            <td>{{id}}</td>

            <td><strong>{{nombre}}</strong></td>

            <td>{{email}}</td>

            <td>
                <span style="color: blue;">
                    {{rol_id}}
                </span>
            </td>

            <td>
                <span style="color: green; font-weight: bold;">
                    {{estado}}
                </span>
            </td>

            <td>{{creado_en}}</td>

            <td>

                <a href="index.php?page=Mantenimientos-Usuarios-Formulario&mode=DSP&id={{id}}">
                    👁️ Ver
                </a>

                |

                <a href="index.php?page=Mantenimientos-Usuarios-Formulario&mode=UPD&id={{id}}">
                    ✏️ Editar
                </a>

                |

                <a href="index.php?page=Mantenimientos-Usuarios-Formulario&mode=DEL&id={{id}}"
                   onclick="return confirm('¿Eliminar este usuario?');"
                   style="color: red;">
                    🗑️ Eliminar
                </a>

            </td>
        </tr>
        {{endfor usuarios}}

        {{ifnot usuarios}}
        <tr>
            <td colspan="7" style="text-align: center; color: gray;">
                ⚠️ No hay usuarios registrados
            </td>
        </tr>
        {{endifnot usuarios}}

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