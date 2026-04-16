<div style="max-width: 1200px; margin:auto; padding:20px; font-family:'Segoe UI', sans-serif;">

    <h2 style="margin-bottom:20px;">🔐 Panel de Seguridad</h2>

    <div style="background:#fff; padding:20px; border-radius:12px; margin-bottom:25px; box-shadow:0 4px 10px rgba(0,0,0,0.08);">
        <h3>👤 Asignar Rol</h3>

        <form method="post" style="display:flex; gap:10px; flex-wrap:wrap;">

            <select name="id" style="flex:1; padding:8px; border-radius:6px;">
                {{foreach usuarios}}
                    <option value="{{id}}">{{nombre}} ({{email}})</option>
                {{endfor usuarios}}
            </select>

            <select name="rolescod" style="flex:1; padding:8px; border-radius:6px;">
                {{foreach roles}}
                    <option value="{{nombre}}">{{nombre}}</option>
                {{endfor roles}}
            </select>

            <button type="submit" 
                style="background:#007bff; color:white; border:none; padding:8px 15px; border-radius:6px;">
                Asignar
            </button>
        </form>
    </div>


    <div style="background:#fff; padding:20px; border-radius:12px; margin-bottom:25px; box-shadow:0 4px 10px rgba(0,0,0,0.08);">
        <h3>⚙️ Asignar Función</h3>

        <form method="post" style="display:flex; gap:10px; flex-wrap:wrap;">

            <select name="fncod" style="flex:1; padding:8px; border-radius:6px;">
                {{foreach funciones}}
                    <option value="{{fncod}}">{{fndsc}}</option>
                {{endfor funciones}}
            </select>

            <select name="rolescod_fn" style="flex:1; padding:8px; border-radius:6px;">
                {{foreach roles}}
                    <option value="{{nombre}}">{{nombre}}</option>
                {{endfor roles}}
            </select>

            <button type="submit" 
                style="background:#28a745; color:white; border:none; padding:8px 15px; border-radius:6px;">
                Asignar
            </button>
        </form>
    </div>


    <div style="background:#fff; padding:20px; border-radius:12px; box-shadow:0 4px 12px rgba(0,0,0,0.08);">

        <h3>👥 Gestión de Usuarios</h3>

        <div style="overflow-x:auto;">

            <table style="width:100%; border-collapse:collapse; margin-top:15px; font-size:14px;">

                <thead>
                    <tr style="background:#f4f6f9;">
                        <th style="padding:10px;">ID</th>
                        <th style="padding:10px;">Usuario</th>
                        <th style="padding:10px;">Estado</th>
                        <th style="padding:10px; text-align:center;">Acciones</th>
                    </tr>
                </thead>

                <tbody>
                    {{foreach usuarios}}
                    <tr style="border-bottom:1px solid #eee;">

                        <td style="padding:10px;">{{id}}</td>

                        <td style="padding:10px;">
                            <form method="post">
                                <input type="hidden" name="edit_user_id" value="{{id}}">

                                <div style="font-weight:600;">{{nombre}}</div>

                                <input type="text" name="edit_email" value="{{email}}" 
                                    style="margin-top:5px; padding:6px; border-radius:6px; border:1px solid #ccc; width:220px;">
                        </td>

                        <td style="padding:10px;">
                                <select name="edit_estado" 
                                    style="padding:6px; border-radius:6px; border:1px solid #ccc;">
                                    <option value="1">Activo</option>
                                    <option value="0">Inactivo</option>
                                </select>
                        </td>

                        <td style="padding:10px; text-align:center;">

                                <button type="submit"
                                    style="background:#f1c40f; border:none; padding:6px 12px; border-radius:6px; cursor:pointer; margin-right:5px;">
                                    Editar
                                </button>
                            </form>

                            <form method="post" style="display:inline;">
                                <input type="hidden" name="delete_user_id" value="{{id}}">

                                <button type="submit"
                                    onclick="return confirm('¿Eliminar usuario?');"
                                    style="background:#e74c3c; color:white; border:none; padding:6px 12px; border-radius:6px; cursor:pointer;">
                                    Borrar
                                </button>
                            </form>

                        </td>

                    </tr>
                    {{endfor usuarios}}
                </tbody>

            </table>

        </div>

    </div>

</div>