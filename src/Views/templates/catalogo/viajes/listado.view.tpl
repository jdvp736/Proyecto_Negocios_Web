<style>
body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background: linear-gradient(135deg, #eef2f7, #e3e9f2);
    margin:0;
}

/* TITULO */
.header {
    text-align:center;
    padding:30px 20px;
}

.header h1 {
    margin:0;
    font-size:32px;
    color:#0b2c4a;
    letter-spacing:1px;
}

.header p {
    color:#6c757d;
    margin-top:8px;
    font-size:15px;
}

/* GRID */
.container {
    display:flex;
    flex-wrap:wrap;
    gap:30px;
    justify-content:center;
    padding:20px;
}

/* CARD */
.card {
    width:280px;
    border-radius:16px;
    overflow:hidden;
    background:white;
    box-shadow:0 10px 25px rgba(0,0,0,0.1);
    transition: all 0.4s ease;
    position:relative;
    animation: fadeIn 0.8s ease;
}

/* LINEA SUPERIOR */
.card::before {
    content:"";
    position:absolute;
    width:100%;
    height:5px;
    background:linear-gradient(90deg, #0b2c4a, #28a745);
    top:0;
    left:0;
}

/* HOVER CARD */
.card:hover {
    transform:translateY(-10px) scale(1.03);
    box-shadow:0 18px 40px rgba(0,0,0,0.2);
}

/* HEADER CARD */
.card-header {
    background:#0b2c4a;
    color:white;
    padding:18px;
    font-size:18px;
    font-weight:bold;
    text-align:center;
    letter-spacing:0.5px;
}

/* BODY */
.card-body {
    padding:18px;
    font-size:14px;
    color:#333;
}

.card-body p {
    margin:8px 0;
}

/* DISPONIBLE */
.available {
    color:#28a745;
    font-weight:bold;
    margin-top:10px;
    animation: fadeIn 1s ease;
}

/* BOTONES CUADRADOS (FORZADO) */
.btn,
a.btn,
button.btn {
    display:block;
    margin-top:15px;
    padding:12px;
    text-align:center;
    background:#0b2c4a;
    color:white;
    text-decoration:none;
    border-radius:0 !important; /* 🔥 clave */
    font-weight:bold;
    letter-spacing:0.5px;
    transition: all 0.3s ease;
    position:relative;
    overflow:hidden;
    border:none;
}

/* EFECTO BRILLO */
.btn::after {
    content:"";
    position:absolute;
    top:0;
    left:-100%;
    width:100%;
    height:100%;
    background:rgba(255,255,255,0.2);
    transition:0.4s;
}

.btn:hover::after {
    left:100%;
}

/* HOVER */
.btn:hover {
    background:#28a745;
    transform:scale(1.05);
    border-radius:0 !important;
}

/* CLICK */
.btn:active {
    transform:scale(0.95);
}

/* BACK */
.back {
    text-align:center;
    margin:30px;
}

/* ANIMACIONES */
@keyframes fadeIn {
    from {
        opacity:0;
        transform:translateY(15px);
    }
    to {
        opacity:1;
        transform:translateY(0);
    }
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

        <a href="index.php?page=Checkout_Checkout&viaje={{id}}" class="btn">
            Agregar Carrito
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