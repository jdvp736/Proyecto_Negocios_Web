<style>
body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background: linear-gradient(135deg, #dfe9f3, #ffffff);
}

.container {
    max-width:1100px;
    margin:40px auto;
    text-align:center;
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

.container {
    animation:fadeIn 0.7s ease;
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

    <div style="
        background:#ffffff;
        border-radius:20px;
        padding:35px 30px;
        box-shadow:0 10px 25px rgba(0,0,0,0.08);
        border:1px solid #e2e8f0;
    ">

        <h1 style="
            text-align:center;
            margin:0 0 10px 0;
            color:#0f172a;
            font-size:42px;
        ">⚙️ Módulo de Mantenimientos</h1>

        <p style="
            text-align:center;
            color:#64748b;
            font-size:17px;
            margin:0 0 30px 0;
        ">
            Panel central para gestionar el sistema
        </p>

        <div style="
            display:flex;
            flex-wrap:wrap;
            gap:22px;
            justify-content:center;
            margin-top:20px;
        ">

            <!-- BUSES -->
            <div style="
                width:190px;
                min-height:130px;
                padding:22px 16px;
                background:#ffffff;
                border-radius:16px;
                box-shadow:0 8px 20px rgba(0,0,0,0.08);
                border:1px solid #e2e8f0;
                text-align:center;
                transition:0.3s;
                position:relative;
                overflow:hidden;
            ">
                <div style="
                    position:absolute;
                    top:0;
                    left:0;
                    width:100%;
                    height:5px;
                    background:linear-gradient(90deg, #2563eb, #38bdf8);
                "></div>

                <h3 style="margin:12px 0 10px 0; font-size:26px; color:#0f172a;">🚌 Buses</h3>

                <a href="index.php?page=Mantenimientos-Buses-Listado" style="
                    display:inline-block;
                    margin-top:8px;
                    background:linear-gradient(90deg, #2563eb, #38bdf8);
                    color:#ffffff;
                    text-decoration:none;
                    padding:10px 18px;
                    border-radius:10px;
                    font-weight:bold;
                    font-size:14px;
                ">Administrar</a>
            </div>

            <!-- VIAJES -->
            <div style="
                width:190px;
                min-height:130px;
                padding:22px 16px;
                background:#ffffff;
                border-radius:16px;
                box-shadow:0 8px 20px rgba(0,0,0,0.08);
                border:1px solid #e2e8f0;
                text-align:center;
                position:relative;
                overflow:hidden;
            ">
                <div style="
                    position:absolute;
                    top:0;
                    left:0;
                    width:100%;
                    height:5px;
                    background:linear-gradient(90deg, #2563eb, #38bdf8);
                "></div>

                <h3 style="margin:12px 0 10px 0; font-size:26px; color:#0f172a;">🧭 Viajes</h3>

                <a href="index.php?page=Mantenimientos-Viajes-Listado" style="
                    display:inline-block;
                    margin-top:8px;
                    background:linear-gradient(90deg, #2563eb, #38bdf8);
                    color:#ffffff;
                    text-decoration:none;
                    padding:10px 18px;
                    border-radius:10px;
                    font-weight:bold;
                    font-size:14px;
                ">Administrar</a>
            </div>

            <!-- RUTAS -->
            <div style="
                width:190px;
                min-height:130px;
                padding:22px 16px;
                background:#ffffff;
                border-radius:16px;
                box-shadow:0 8px 20px rgba(0,0,0,0.08);
                border:1px solid #e2e8f0;
                text-align:center;
                position:relative;
                overflow:hidden;
            ">
                <div style="
                    position:absolute;
                    top:0;
                    left:0;
                    width:100%;
                    height:5px;
                    background:linear-gradient(90deg, #2563eb, #38bdf8);
                "></div>

                <h3 style="margin:12px 0 10px 0; font-size:26px; color:#0f172a;">🛣️ Rutas</h3>

                <a href="index.php?page=Mantenimientos-Rutas-Listado" style="
                    display:inline-block;
                    margin-top:8px;
                    background:linear-gradient(90deg, #2563eb, #38bdf8);
                    color:#ffffff;
                    text-decoration:none;
                    padding:10px 18px;
                    border-radius:10px;
                    font-weight:bold;
                    font-size:14px;
                ">Administrar</a>
            </div>

            <!-- ORDENES -->
            <div style="
                width:190px;
                min-height:130px;
                padding:22px 16px;
                background:#ffffff;
                border-radius:16px;
                box-shadow:0 8px 20px rgba(0,0,0,0.08);
                border:1px solid #e2e8f0;
                text-align:center;
                position:relative;
                overflow:hidden;
            ">
                <div style="
                    position:absolute;
                    top:0;
                    left:0;
                    width:100%;
                    height:5px;
                    background:linear-gradient(90deg, #2563eb, #38bdf8);
                "></div>

                <h3 style="margin:12px 0 10px 0; font-size:26px; color:#0f172a;">📦 Órdenes</h3>

                <a href="index.php?page=Mantenimientos-Ordenes-Listado" style="
                    display:inline-block;
                    margin-top:8px;
                    background:linear-gradient(90deg, #2563eb, #38bdf8);
                    color:#ffffff;
                    text-decoration:none;
                    padding:10px 18px;
                    border-radius:10px;
                    font-weight:bold;
                    font-size:14px;
                ">Administrar</a>
            </div>

            <!-- PAGOS -->
            <div style="
                width:190px;
                min-height:130px;
                padding:22px 16px;
                background:#ffffff;
                border-radius:16px;
                box-shadow:0 8px 20px rgba(0,0,0,0.08);
                border:1px solid #e2e8f0;
                text-align:center;
                position:relative;
                overflow:hidden;
            ">
                <div style="
                    position:absolute;
                    top:0;
                    left:0;
                    width:100%;
                    height:5px;
                    background:linear-gradient(90deg, #2563eb, #38bdf8);
                "></div>

                <h3 style="margin:12px 0 10px 0; font-size:26px; color:#0f172a;">💳 Pagos</h3>

                <a href="index.php?page=Mantenimientos-Pagos-Listado" style="
                    display:inline-block;
                    margin-top:8px;
                    background:linear-gradient(90deg, #2563eb, #38bdf8);
                    color:#ffffff;
                    text-decoration:none;
                    padding:10px 18px;
                    border-radius:10px;
                    font-weight:bold;
                    font-size:14px;
                ">Administrar</a>
            </div>

            <!-- USUARIOS -->
            <div style="
                width:190px;
                min-height:130px;
                padding:22px 16px;
                background:#ffffff;
                border-radius:16px;
                box-shadow:0 8px 20px rgba(0,0,0,0.08);
                border:1px solid #e2e8f0;
                text-align:center;
                position:relative;
                overflow:hidden;
            ">
                <div style="
                    position:absolute;
                    top:0;
                    left:0;
                    width:100%;
                    height:5px;
                    background:linear-gradient(90deg, #2563eb, #38bdf8);
                "></div>

                <h3 style="margin:12px 0 10px 0; font-size:26px; color:#0f172a;">👤 Usuarios</h3>

                <a href="index.php?page=Mantenimientos-Usuarios-Listado" style="
                    display:inline-block;
                    margin-top:8px;
                    background:linear-gradient(90deg, #2563eb, #38bdf8);
                    color:#ffffff;
                    text-decoration:none;
                    padding:10px 18px;
                    border-radius:10px;
                    font-weight:bold;
                    font-size:14px;
                ">Administrar</a>
            </div>

        </div>

    </div>
</div>