<style>
body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background: linear-gradient(135deg, #eef2f7, #e3e9f2);
}

.form-container {
    max-width:600px;
    margin:40px auto;
    background:white;
    padding:25px;
    border-radius:16px;
    box-shadow:0 10px 30px rgba(0,0,0,0.15);
    animation:fadeIn 0.6s ease;
}

.form-container h1 {
    text-align:center;
    color:#0b2c4a;
}

.form-group {
    margin-bottom:15px;
}

.form-group label {
    font-weight:bold;
    display:block;
    margin-bottom:5px;
}

.form-group input,
.form-group select {
    width:100%;
    padding:10px;
    border:1px solid #ccc;
    border-radius:8px;
    transition:0.3s;
}

.form-group input:focus,
.form-group select:focus {
    border-color:#0d6efd;
    box-shadow:0 0 5px rgba(13,110,253,0.4);
}

.btn,
a.btn,
button.btn {
    width:100%;
    padding:12px;
    background:#0d6efd;
    color:white;
    border:none;
    border-radius:0 !important;
    font-weight:bold;
    cursor:pointer;
    margin-top:10px;
    transition:0.3s;
    position:relative;
    overflow:hidden;
    text-decoration:none;
    display:block;
    text-align:center;
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

.btn-secondary {
    background:#6c757d;
    border-radius:0 ;
}

.btn-secondary:hover {
    background:#495057 ;
}

@keyframes fadeIn {
    from {opacity:0; transform:translateY(20px);}
    to {opacity:1; transform:translateY(0);}
}
</style>

<div class="form-container">

<h1>{{modeDsc}}</h1>

<form method="post" action="index.php?page=Mantenimientos-Ordenes-Formulario&mode={{mode}}&id={{id}}">

    <input type="hidden" name="uuid" value="{{xsrf_token}}">
    <input type="hidden" name="id" value="{{id}}">

    <div class="form-group">
        <label>Usuario</label>
        <select name="usuario_id" {{isReadonly}}>
            {{foreach usuarios}}
                <option value="{{id}}" {{selected}}>
                    {{nombre}} ({{email}})
                </option>
            {{endfor usuarios}}
        </select>
    </div>

    <div class="form-group">
        <label>Total</label>
        <input type="number" step="0.01" name="total" value="{{total}}" {{isReadonly}}>
    </div>

    <div class="form-group">
        <label>Estado</label>
        <input type="text" name="estado" value="{{estado}}" {{isReadonly}}>
    </div>

    <div class="form-group">
        <label>Fecha</label>
        <input type="text" value="{{fecha}}" readonly>
    </div>

    {{ifnot hideConfirm}}
        <button type="submit" class="btn">
            Confirmar
        </button>
    {{endifnot hideConfirm}}

</form>

<a href="index.php?page=Mantenimientos-Ordenes-Listado" class="btn btn-secondary">
    Volver al listado
</a>

</div>