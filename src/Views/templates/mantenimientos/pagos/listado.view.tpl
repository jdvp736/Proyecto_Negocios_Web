<h1>💳 Listado de Pagos</h1>

<a href="index.php?page=Mantenimientos-Pagos-Formulario&mode=INS">
    ➕ Nuevo Pago
</a>

<br><br>

<table border="1" cellpadding="8" cellspacing="0" width="100%">
    <thead style="background-color: #333; color: white;">
        <tr>
            <th>ID</th>
            <th>Orden</th>
            <th>Monto</th>
            <th>Método</th>
            <th>Fecha</th>
            <th>Acciones</th>
        </tr>
    </thead>

    <tbody>

        {{foreach pagos}}
        <tr>
            <td>{{id}}</td>

            <td><strong>#{{orden_id}}</strong></td>

            <td>
                <span style="color: blue; font-weight: bold;">
                    L. {{monto}}
                </span>
            </td>

            <td>{{metodo}}</td>

            <td>{{fecha}}</td>

            <td>

                <!-- VER -->
                <a href="index.php?page=Mantenimientos-Pagos-Formulario&mode=DSP&id={{id}}">
                    👁️ Ver
                </a>

                |

                <!-- EDITAR -->
                <a href="index.php?page=Mantenimientos-Pagos-Formulario&mode=UPD&id={{id}}">
                    ✏️ Editar
                </a>

                |

                <!-- ELIMINAR -->
                <a href="index.php?page=Mantenimientos-Pagos-Formulario&mode=DEL&id={{id}}"
                   onclick="return confirm('¿Seguro que deseas eliminar este pago?');"
                   style="color: red;">
                    🗑️ Eliminar
                </a>

            </td>
        </tr>
        {{endfor pagos}}

        {{ifnot pagos}}
        <tr>
            <td colspan="6" style="text-align: center; color: gray;">
                ⚠️ No hay pagos registrados
            </td>
        </tr>
        {{endifnot pagos}}

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