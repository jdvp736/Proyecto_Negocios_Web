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
    background:#6c757d !important;
    border-radius:0 !important;
}

.btn-secondary:hover {
    background:#495057 !important;
}

@keyframes fadeIn {
    from {opacity:0; transform:translateY(20px);}
    to {opacity:1; transform:translateY(0);}
}
</style>

<div class="form-container">

<h1>{{modeDsc}}</h1>

<form method="post" action="index.php?page=Mantenimientos-Pagos-Formulario&mode={{mode}}&id={{id}}">

    <input type="hidden" name="uuid" value="{{xsrf_token}}">
    <input type="hidden" name="id" value="{{id}}">

    <div class="form-group">
        <label>Orden</label>
        <select name="orden_id" {{isReadonly}}>
            {{foreach ordenes}}
                <option value="{{id}}" {{selected}}>
                    Orden #{{id}}
                </option>
            {{endfor ordenes}}
        </select>
    </div>

    <div class="form-group">
        <label>Método de Pago</label>
        <input type="text" name="metodo" value="{{metodo}}" {{isReadonly}}>
    </div>

    <div class="form-group">
        <label>Estado</label>
        <select name="estado" {{isReadonly}}>
            <option value="PEN">Pendiente</option>
            <option value="PAG">Pagado</option>
            <option value="CAN">Cancelado</option>
        </select>
    </div>

    <div class="form-group">
        <label>Transaction ID</label>
        <input type="text" name="transaction_id" value="{{transaction_id}}" {{isReadonly}}>
    </div>

    {{ifnot hideConfirm}}
        <button type="submit" class="btn">
            Confirmar
        </button>
    {{endifnot hideConfirm}}

</form>

<a href="index.php?page=Mantenimientos-Pagos-Listado" class="btn btn-secondary">
    Volver al listado
</a>

</div>