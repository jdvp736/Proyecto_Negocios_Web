<style>
/* 🌟 GENERAL */
body {
    margin:0;
    font-family: Arial, sans-serif;
    background:#f4f6f9;
}

/* NAVBAR */
.navbar {
    background:#0d6efd;
    color:white;
    padding:15px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

/* LINKS */
.navbar a {
    color:white;
    margin-right:15px;
    text-decoration:none;
}

/* HERO */
.hero {
    text-align:center;
    padding:30px;
}

/* CARRUSEL */
.carousel-img {
    width:100%;
    height:350px;
    object-fit:cover;
    transition: opacity 1s ease-in-out;
}

/* ANIMACIONES */
.fade-in {
    opacity:0;
    transform:translateY(20px);
    transition:all 0.8s ease;
}

.fade-in.visible {
    opacity:1;
    transform:translateY(0);
}

/* CARDS */
.card {
    border-radius:12px;
    width:300px;
    padding:15px;
    background:white;
    box-shadow:0px 6px 15px rgba(0,0,0,0.15);
    transition:all 0.3s ease;
}

.card:hover {
    transform:translateY(-10px) scale(1.03);
    box-shadow:0px 12px 25px rgba(0,0,0,0.25);
}

/* BOTÓN */
.btn {
    display: block;
    width: 100%;
    text-align: center;
    background: #0d6efd;
    color: white;
    padding: 12px;
    border-radius: 0 !important; /* 💥 fuerza que sea cuadrado */
    text-decoration: none;
    margin-top: 10px;
    font-weight: bold;
    border: none;
    cursor: pointer;
}

/* HOVER */
.btn:hover {
    background: #28a745;
}

/* STATS */
.stats {
    display:flex;
    justify-content:space-around;
    text-align:center;
}

/* FOOTER */
.footer {
    background:#222;
    color:white;
    text-align:center;
    padding:15px;
}
</style>

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

<!-- VIAJES -->
<h2 style="text-align:center;">🎟️ Compra tu Viaje</h2>

<div style="display:flex; flex-wrap:wrap; gap:25px; justify-content:center;">

{{foreach viajes}}
<div class="card fade-in">

    <img src="public/img/bus.jpg" width="100%" style="border-radius:10px;">

    <h3>{{ruta}}</h3>

    <p>🚌 {{placa}}</p>
    <p>💺 {{tipo_bus}}</p>
    <p>📅 {{fecha_salida}}</p>

    <a href="index.php?page=Catalogo-Viajes-Listado" class="btn">
        Ver catalogo de rutas
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
/* ANIMACIÓN SCROLL */
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