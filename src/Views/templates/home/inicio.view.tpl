<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Transportes Sosa</title>

<style>
body {
    margin:0;
    font-family: 'Segoe UI', Arial, sans-serif;
    background: linear-gradient(135deg, #eef2f7, #e3e9f2);
}

.hero {
    display:flex;
    align-items:center;
    gap:10px;

    height:60px !important;       /* 👈 controla el alto */
    min-height:60px !important;   /* 👈 evita que crezca */
    padding:0 20px !important;    /* 👈 elimina espacio vertical */

    background: linear-gradient(90deg, #0d6efd, #0b2c4a);
    color:white;

    overflow:hidden;              /* 👈 evita que algo lo estire */
}

/* LOGO */
.hero img {
    width:30px !important;
    height:30px !important;
}

/* TEXTO */
.hero-text {
    display:flex;
    flex-direction:column;
    justify-content:center;
}

/* TITULO */
.hero h1 {
    margin:0;
    font-size:18px;
    line-height:1;
}

/* SUBTITULO */
.hero p {
    margin:0;
    font-size:11px;
    line-height:1;
    color:#d1e7ff;
}

/* CARRUSEL */
.carousel-img {
    width:100%;
    height:350px;
    object-fit:cover;
    transition: opacity 1s ease-in-out, transform 1s ease;
}

.carousel-img:hover {
    transform:scale(1.02);
}

/* ANIMACIONES */
.fade-in {
    opacity:0;
    transform:translateY(30px);
    transition:all 0.8s ease;
}

.fade-in.visible {
    opacity:1;
    transform:translateY(0);
}

/* CARDS */
.card {
    border-radius:16px;
    width:300px;
    padding:15px;
    background:white;
    box-shadow:0 10px 25px rgba(0,0,0,0.1);
    transition:all 0.4s ease;
    position:relative;
    overflow:hidden;
}

.card::before {
    content:"";
    position:absolute;
    width:100%;
    height:4px;
    background:linear-gradient(90deg, #0d6efd, #28a745);
    top:0;
    left:0;
}

.card:hover {
    transform:translateY(-12px) scale(1.04);
    box-shadow:0 20px 40px rgba(0,0,0,0.2);
}

.card img {
    border-radius:12px;
    transition:0.4s;
}

.card:hover img {
    transform:scale(1.05);
}

.card h3 {
    margin-top:10px;
    color:#0b2c4a;
}

/* BOTONES CUADRADOS */
.btn,
a.btn,
button.btn {
    display:block;
    width:100%;
    text-align:center;
    background:#0d6efd;
    color:white;
    padding:12px;
    border-radius:0 !important;
    text-decoration:none;
    margin-top:12px;
    font-weight:bold;
    border:none;
    cursor:pointer;
    position:relative;
    overflow:hidden;
    transition:all 0.3s ease;
}

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

.btn:hover {
    background:#28a745;
    transform:scale(1.05);
}

.btn:active {
    transform:scale(0.95);
}

/* STATS */
.stats {
    display:flex;
    justify-content:space-around;
    text-align:center;
    padding:20px;
}

.stats div {
    background:white;
    padding:20px;
    border-radius:12px;
    box-shadow:0 8px 20px rgba(0,0,0,0.1);
    transition:0.3s;
}

.stats div:hover {
    transform:translateY(-8px);
}

/* TITULOS */
h2 {
    color:#0b2c4a;
}

/* FOOTER */
.footer {
    background:#1c1c1c;
    color:white;
    text-align:center;
    padding:20px;
    margin-top:20px;
    font-size:14px;
}
</style>

</head>
<body>

<!-- HERO -->
<div class="hero">
    <h1>🛣️ Transportes Sosa</h1>
    <p>Tu mejor opción para viajar seguro, cómodo y rápido por Honduras</p>
</div>

<!-- CARRUSEL -->
<div>
    <img id="carousel" class="carousel-img" src="public/imgs/bus.jpg">
</div>

<script>
let imgs = [
    "public/imgs/bus2.jpg",
    "public/imgs/bus1.jpg",
    "public/imgs/bus3.jpg"
];

let i = 0;

setInterval(() => {
    let img = document.getElementById("carousel");
    img.style.opacity = 0;

    setTimeout(() => {
        i = (i + 1) % imgs.length;
        img.src = imgs[i];
        img.style.opacity = 1;
    }, 500);

}, 3000);
</script>

<hr>

<!-- HISTORIA -->
<div class="fade-in" style="padding:20px;">
    <h2>📖 Nuestra Historia</h2>
    <p>
        Transportes Sosa inició operaciones el <strong>15 de marzo de 2015</strong>,
        con la misión de transformar el transporte en Honduras.
    </p>
    <p>
        Hoy contamos con múltiples rutas, buses modernos y una plataforma digital
        que facilita la compra de boletos en línea.
    </p>
</div>

<hr>

<!-- ESTADISTICAS -->
<div class="stats fade-in">
    <div>
        <h2>{{totalBuses}}</h2>
        <p>🚌 Buses</p>
    </div>

    <div>
        <h2>{{totalViajes}}</h2>
        <p>🧭 Viajes</p>
    </div>

    <div>
        <h2>{{totalRutas}}</h2>
        <p>🛣️ Rutas</p>
    </div>
</div>

<hr>

<!-- VIAJES DESTACADOS -->
<h2 style="text-align:center;">🎟️ Compra tu Viaje</h2>

<div style="display:flex; flex-wrap:wrap; gap:25px; justify-content:center;">

{{foreach viajes}}
<div class="card fade-in">

    <img src="public/img/bus.jpg" width="100%">

    <h3>{{ruta}}</h3>

    <p>🚌 {{bus}}</p>

    <p>📅 {{fecha_salida}}</p>

    <a href="index.php?page=Catalogo-Viajes-Listado" class="btn">
        Ver catálogo de rutas
    </a>

</div>
{{endfor viajes}}

</div>

<hr>

<!-- TESTIMONIOS -->
<div class="fade-in" style="padding:20px;">
    <h2>💬 Opiniones</h2>
    <p>"Excelente servicio" ⭐⭐⭐⭐⭐</p>
    <p>"Muy cómodo y seguro" ⭐⭐⭐⭐⭐</p>
</div>

<hr>

<!-- CONTACTO -->
<div class="fade-in" style="text-align:center; padding:20px;">
    <h2>📞 Contáctanos</h2>
    <p>📍 Honduras</p>
    <p>📞 +504 9999-9999</p>
</div>

<!-- FOOTER -->
<div class="footer">
    © 2026 Transportes Sosa
</div>

<script>
const elements = document.querySelectorAll('.fade-in');

const showOnScroll = () => {
    const trigger = window.innerHeight * 0.85;

    elements.forEach(el => {
        const top = el.getBoundingClientRect().top;

        if (top < trigger) {
            el.classList.add('visible');
        }
    });
};

window.addEventListener('scroll', showOnScroll);
window.addEventListener('load', showOnScroll);
</script>

</body>
</html>