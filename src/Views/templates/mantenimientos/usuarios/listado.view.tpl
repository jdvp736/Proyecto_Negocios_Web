<div style="max-width:1400px; margin:35px auto; padding:25px;">

    <div style="
        background:#ffffff;
        border-radius:20px;
        padding:35px 30px;
        box-shadow:0 10px 25px rgba(0,0,0,0.08);
        border:1px solid #e2e8f0;
    ">

        <div style="
            display:flex;
            justify-content:space-between;
            align-items:center;
            flex-wrap:wrap;
            gap:15px;
            margin-bottom:25px;
        ">
            <div>
                <h1 style="
                    margin:0 0 8px 0;
                    color:#0f172a;
                    font-size:38px;
                ">👤 Listado de Usuarios</h1>

                <p style="
                    margin:0;
                    color:#64748b;
                    font-size:16px;
                ">
                    Administración y control de los usuarios registrados en el sistema.
                </p>
            </div>

            <a href="index.php?page=Mantenimientos-Usuarios-Formulario&mode=INS"
               style="
                    display:inline-block;
                    padding:12px 18px;
                    background:linear-gradient(90deg, #2563eb, #38bdf8);
                    color:#ffffff;
                    text-decoration:none;
                    border-radius:10px;
                    font-weight:bold;
                    font-size:15px;
                    box-shadow:0 6px 14px rgba(37,99,235,0.20);
               ">
                ➕ Nuevo Usuario
            </a>
        </div>

        <div style="
            overflow-x:auto;
            border-radius:16px;
            border:1px solid #e2e8f0;
            box-shadow:0 8px 20px rgba(0,0,0,0.06);
        ">
            <table style="
                width:100%;
                border-collapse:collapse;
                background:#ffffff;
                min-width:1150px;
            ">
                <thead style="
                    background:linear-gradient(90deg, #0f172a, #1e293b);
                    color:#ffffff;
                ">
                    <tr>
                        <th style="padding:16px; text-align:left;">ID</th>
                        <th style="padding:16px; text-align:left;">Nombre</th>
                        <th style="padding:16px; text-align:left;">Email</th>
                        <th style="padding:16px; text-align:left;">Rol</th>
                        <th style="padding:16px; text-align:left;">Estado</th>
                        <th style="padding:16px; text-align:left;">Fecha Creación</th>
                        <th style="padding:16px; text-align:center;">Acciones</th>
                    </tr>
                </thead>

                <tbody>

                    {{foreach usuarios}}
                    <tr style="border-bottom:1px solid #e2e8f0;">
                        <td style="padding:15px; color:#334155;">{{id}}</td>

                        <td style="padding:15px; color:#0f172a; font-weight:bold;">
                            {{nombre}}
                        </td>

                        <td style="padding:15px; color:#334155;">
                            {{email}}
                        </td>

                        <td style="padding:15px;">
                            <span style="
                                display:inline-block;
                                padding:7px 12px;
                                background:#dbeafe;
                                color:#1d4ed8;
                                border-radius:999px;
                                font-weight:bold;
                                font-size:14px;
                            ">
                                {{rol_id}}
                            </span>
                        </td>

                        <td style="padding:15px;">
                            <span style="
                                display:inline-block;
                                padding:7px 12px;
                                background:#dcfce7;
                                color:#166534;
                                border-radius:999px;
                                font-weight:bold;
                                font-size:14px;
                            ">
                                {{estado}}
                            </span>
                        </td>

                        <td style="padding:15px; color:#334155;">
                            {{creado_en}}
                        </td>

                        <td style="padding:15px; text-align:center;">

                            <a href="index.php?page=Mantenimientos-Usuarios-Formulario&mode=DSP&id={{id}}"
                               style="
                                    display:inline-block;
                                    margin:4px;
                                    padding:9px 14px;
                                    background:#e0f2fe;
                                    color:#0369a1;
                                    text-decoration:none;
                                    border-radius:8px;
                                    font-weight:bold;
                                    font-size:14px;
                               ">
                                👁️ Ver
                            </a>

                            <a href="index.php?page=Mantenimientos-Usuarios-Formulario&mode=UPD&id={{id}}"
                               style="
                                    display:inline-block;
                                    margin:4px;
                                    padding:9px 14px;
                                    background:#fef3c7;
                                    color:#b45309;
                                    text-decoration:none;
                                    border-radius:8px;
                                    font-weight:bold;
                                    font-size:14px;
                               ">
                                ✏️ Editar
                            </a>

                            <a href="index.php?page=Mantenimientos-Usuarios-Formulario&mode=DEL&id={{id}}"
                               onclick="return confirm('¿Eliminar este usuario?');"
                               style="
                                    display:inline-block;
                                    margin:4px;
                                    padding:9px 14px;
                                    background:#fee2e2;
                                    color:#b91c1c;
                                    text-decoration:none;
                                    border-radius:8px;
                                    font-weight:bold;
                                    font-size:14px;
                               ">
                                🗑️ Eliminar
                            </a>

                        </td>
                    </tr>
                    {{endfor usuarios}}

                    {{ifnot usuarios}}
                    <tr>
                        <td colspan="7" style="
                            text-align:center;
                            color:#64748b;
                            padding:30px;
                            font-size:16px;
                            background:#f8fafc;
                        ">
                            ⚠️ No hay usuarios registrados
                        </td>
                    </tr>
                    {{endifnot usuarios}}

                </tbody>
            </table>
        </div>

        <div style="text-align:center; margin-top:25px;">
            <a href="index.php?page=Mantenimientos-Dashboard-Dashboard"
               style="
                    display:inline-block;
                    padding:12px 20px;
                    background:linear-gradient(135deg, #6b7280, #374151);
                    color:white;
                    text-decoration:none;
                    border-radius:10px;
                    font-weight:bold;
                    box-shadow:0 6px 14px rgba(0,0,0,0.15);
               ">
                ⬅ Volver al Dashboard
            </a>
        </div>

    </div>
</div>