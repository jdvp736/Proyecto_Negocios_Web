<style>
body {
    font-family: Arial, sans-serif;
    background:#f4f6f9;
}

/* TITULO */
.header {
    text-align:center;
    padding:20px;
}

.header h1 {
    margin:0;
}

.header p {
    color:gray;
}

/* GRID */
.container {
    display:flex;
    flex-wrap:wrap;
    gap:25px;
    justify-content:center;
    padding:20px;
}

/* CARD */
.card {
    width:280px;
    border-radius:12px;
    overflow:hidden;
    background:white;
    box-shadow:0px 8px 20px rgba(0,0,0,0.15);
    transition:0.3s;
}

.card:hover {
    transform:translateY(-8px);
}

/* HEADER CARD */
.card-header {
    background:#0b2c4a;
    color:white;
    padding:20px;
    font-size:20px;
    font-weight:bold;
    text-align:center;
}

/* BODY */
.card-body {
    padding:15px;
    font-size:14px;
}

.card-body p {
    margin:5px 0;
}

/* DISPONIBLE */
.available {
    color:green;
    font-weight:bold;
}

/* BOTÓN */
.btn {
    display:block;
    margin-top:10px;
    padding:10px;
    text-align:center;
    background:#0b2c4a;
    color:white;
    text-decoration:none;
    border-radius:4px;
}

.btn:hover {
    background:#28a745;
}

/* BACK */
.back {
    text-align:center;
    margin:20px;
}
</style>

<div class="header">
    <h1>🛣️ Nuestros Viajes</h1>
    <p>Encuentra tu próximo destino con nosotros</p>
</div>

<div class="container">

{{foreach viajes}}
<div class="card">

    <div class="card-header">
        {{origen}} → {{destino}}
    </div>

    <div class="card-body">
        <p><strong>🚌 Bus:</strong> {{placa}}</p>
        <p><strong>💺 Tipo:</strong> {{tipo_bus}}</p>
        <p><strong>📅 Fecha:</strong> {{fecha_salida}}</p>

        <p class="available">✔ Disponible</p>

        <a href="index.php?page=Compra&viaje={{id}}" class="btn">
            Ver Detalle
        </a>
    </div>

</div>
{{endfor viajes}}

{{ifnot viajes}}
<p>No hay viajes disponibles</p>
{{endifnot viajes}}

</div>

<div class="back">
    <a href="index.php?page=Home-Inicio" class="btn">
        ← Volver al inicio
    </a>
</div>