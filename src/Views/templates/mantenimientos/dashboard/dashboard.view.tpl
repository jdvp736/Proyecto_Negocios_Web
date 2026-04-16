<style>
body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background: linear-gradient(135deg, #dfe9f3, #ffffff);
}

.container {
    max-width:1100px;
    margin:40px auto;
    text-align:center;
    animation:fadeIn 0.7s ease;
}

h1 {
    color:#0b2c4a;
    margin-bottom:10px;
}

p {
    color:#6c757d;
}

.grid {
    display:grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap:25px;
    margin-top:30px;
}

.card {
    padding:25px;
    border-radius:16px;
    color:white;
    position:relative;
    overflow:hidden;
    transition:0.4s;
    box-shadow:0px 10px 25px rgba(0,0,0,0.2);
}

.card:nth-child(1){ background:linear-gradient(135deg,#007bff,#00c6ff);}
.card:nth-child(2){ background:linear-gradient(135deg,#28a745,#6dd5ed);}
.card:nth-child(3){ background:linear-gradient(135deg,#ff7e5f,#feb47b);}
.card:nth-child(4){ background:linear-gradient(135deg,#6a11cb,#2575fc);}
.card:nth-child(5){ background:linear-gradient(135deg,#f7971e,#ffd200);}
.card:nth-child(6){ background:linear-gradient(135deg,#ff416c,#ff4b2b);}

.card:hover {
    transform:translateY(-10px) scale(1.05);
    box-shadow:0px 20px 40px rgba(0,0,0,0.3);
}

.card::before {
    content:"";
    position:absolute;
    top:0;
    left:-100%;
    width:100%;
    height:100%;
    background:rgba(255,255,255,0.2);
    transform:skewX(-25deg);
    transition:0.5s;
}

.card:hover::before {
    left:120%;
}

.card h3 {
    margin-bottom:20px;
}

.btn {
    display:inline-block;
    padding:10px 15px;
    background:white;
    color:#333;
    text-decoration:none;
    font-weight:bold;
    border-radius:0 !important;
    transition:0.3s;
}

.btn:hover {
    background:#0b2c4a;
    color:white;
}

@keyframes fadeIn {
    from {opacity:0; transform:translateY(20px);}
    to {opacity:1; transform:translateY(0);}
}
</style>

<div class="container">

<h1>Módulo de Mantenimientos</h1>
<p>Panel central para gestionar el sistema</p>

<div class="grid">

    <div class="card">
        <h3>Buses</h3>
        <a href="index.php?page=Mantenimientos-Buses-Listado" class="btn">Administrar</a>
    </div>

    <div class="card">
        <h3>Viajes</h3>
        <a href="index.php?page=Mantenimientos-Viajes-Listado" class="btn">Administrar</a>
    </div>

    <div class="card">
        <h3>Rutas</h3>
        <a href="index.php?page=Mantenimientos-Rutas-Listado" class="btn">Administrar</a>
    </div>

    <div class="card">
        <h3>Órdenes</h3>
        <a href="index.php?page=Mantenimientos-Ordenes-Listado" class="btn">Administrar</a>
    </div>

    <div class="card">
        <h3>Pagos</h3>
        <a href="index.php?page=Mantenimientos-Pagos-Listado" class="btn">Administrar</a>
    </div>

    <div class="card">
        <h3>Usuarios</h3>
        <a href="index.php?page=Mantenimientos-Usuarios-Listado" class="btn">Administrar</a>
    </div>

</div>

</div>
