<style>
body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background: linear-gradient(135deg, #eef2f7, #e3e9f2);
}

.container {
    max-width:1100px;
    margin:40px auto;
    background:white;
    padding:25px;
    border-radius:16px;
    box-shadow:0 10px 30px rgba(0,0,0,0.15);
    animation:fadeIn 0.6s ease;
}

h1 {
    text-align:center;
    color:#0b2c4a;
}

.btn {
    padding:10px 15px;
    color:white;
    text-decoration:none;
    border-radius:0 !important;
    font-weight:bold;
    transition:0.3s;
    display:inline-block;
}

.btn-ver {
    background:#28a745 !important;
}

.btn-ver:hover {
    background:#1e7e34 !important;
}

.btn-editar {
    background:#ffc107 !important;
    color:black !important;
}

.btn-editar:hover {
    background:#e0a800 !important;
}

.btn-eliminar {
    background:#dc3545 !important;
}

.btn-eliminar:hover {
    background:#a71d2a !important;
}

.btn-primary {
    background:#0d6efd !important;
}

.btn-primary:hover {
    background:#0b5ed7 !important;
}

.btn-secondary {
    background:#6c757d !important;
}

.btn-secondary:hover {
    background:#495057 !important;
}

table {
    width:100%;
    border-collapse:collapse;
    margin-top:20px;
}

thead {
    background:#0b2c4a;
    color:white;
}

th, td {
    padding:12px;
    text-align:center;
    border-bottom:1px solid #ddd;
}

tr:hover {
    background:#f2f6fb;
}

.total {
    color:#0d6efd;
    font-weight:bold;
}

.estado {
    color:green;
    font-weight:bold;
}

.acciones {
    display:flex;
    gap:8px;
    justify-content:center;
}

.acciones .btn {
    min-width:75px;
    text-align:center;
    font-size:13px;
    padding:8px 10px;
}

@keyframes fadeIn {
    from {opacity:0; transform:translateY(20px);}
    to {opacity:1; transform:translateY(0);}
}
</style>

<div class="container">

<h1>Listado de Órdenes</h1>

<a href="index.php?page=Mantenimientos-Ordenes-Formulario&mode=INS" class="btn btn-primary">
    Nueva Orden
</a>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Usuario</th>
            <th>Total</th>
            <th>Estado</th>
            <th>Fecha</th>
            <th>Acciones</th>
        </tr>
    </thead>

    <tbody>

        {{foreach ordenes}}
        <tr>
            <td>{{id}}</td>

            <td><strong>{{nombre}}</strong></td>

            <td>
                <span class="total">
                    L. {{total}}
                </span>
            </td>

            <td>
                <span class="estado">
                    {{estado}}
                </span>
            </td>

            <td>{{fecha}}</td>

            <td>
                <div class="acciones">

                    <a class="btn btn-ver"
                       href="index.php?page=Mantenimientos-Ordenes-Formulario&mode=DSP&id={{id}}">
                        Ver
                    </a>

                    <a class="btn btn-editar"
                       href="index.php?page=Mantenimientos-Ordenes-Formulario&mode=UPD&id={{id}}">
                        Editar
                    </a>

                    <a class="btn btn-eliminar"
                       href="index.php?page=Mantenimientos-Ordenes-Formulario&mode=DEL&id={{id}}"
                       onclick="return confirm('¿Seguro que deseas eliminar esta orden?');">
                        Eliminar
                    </a>

                </div>
            </td>
        </tr>
        {{endfor ordenes}}

        {{ifnot ordenes}}
        <tr>
            <td colspan="6" style="color:gray;">
                No hay órdenes registradas
            </td>
        </tr>
        {{endifnot ordenes}}

    </tbody>
</table>

<br>

<div style="text-align:center;">
    <a href="index.php?page=Mantenimientos-Dashboard-Dashboard" class="btn btn-secondary">
        Volver al Dashboard
    </a>
</div>

</div>