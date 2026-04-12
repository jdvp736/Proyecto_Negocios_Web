<h1>{{modeDsc}}</h1>

<section class="grid row">

    <form class="depth-0 offset-3 col-6"
    action="index.php?page=Catalogos_ProductosElectronica_Formulario&mode={{mode}}&id={{id_producto}}"
    method="POST">

<div class="row align-center">

<div class="col-4">
    <label for="id_producto">Código</label>
</div>

<div class="col-8">

    <input type="text"
    value="{{id_producto}}"
    disabled
    name="idux"
    id="id_producto"
    readonly/>

    <input type="hidden"
    name="id_producto"
    value="{{id_producto}}" />

    <input type="hidden"
    name="uuid"
    value="{{xsrf_token}}" />

</div>

</div>

<div class="row align-center">

<div class="col-4">
    <label for="nombre">Nombre</label>
</div>

<div class="col-8">
    <input type="text"
    name="nombre"
    id="nombre"
    value="{{nombre}}"
    placeholder="Nombre del Producto"
    {{isReadonly}} />
</div>

</div>

<div class="row align-center">

<div class="col-4">
    <label for="tipo">Tipo</label>
</div>

<div class="col-8">
    <input type="text"
    name="tipo"
    id="tipo"
    value="{{tipo}}"
    placeholder="Tipo de Producto"
    {{isReadonly}} />
</div>

</div>

<div class="row align-center">

<div class="col-4">
    <label for="precio">Precio</label>
</div>

<div class="col-8">
    <input type="text"
    name="precio"
    id="precio"
    value="{{precio}}"
    placeholder="Precio del Producto"
    {{isReadonly}} />
</div>

</div>

<div class="row align-center">

<div class="col-4">
    <label for="marca">Marca</label>
</div>

<div class="col-8">
    <input type="text"
    name="marca"
    id="marca"
    value="{{marca}}"
    placeholder="Marca del Producto"
    {{isReadonly}} />
</div>

</div>

<div class="row align-center">

<div class="col-4">
    <label for="fecha_lanzamiento">Fecha Lanzamiento</label>
</div>

<div class="col-8">
    <input type="date"
    name="fecha_lanzamiento"
    id="fecha_lanzamiento"
    value="{{fecha_lanzamiento}}"
    {{isReadonly}} />
</div>

</div>

{{if confirmToolTip}}

<div class="error">
{{confirmToolTip}}
</div>

{{endif confirmToolTip}}

<div class="right">

    {{ifnot hideConfirm}}
        <button type="submit" name="btnEnviar">
        Confirmar
        </button>
    {{endifnot hideConfirm}}

&nbsp;

    <button id="btnCancelar">
    Cancelar
    </button>

</div>

</form>

</section>

<script>

    document.addEventListener("DOMContentLoaded", ()=>{

    document.getElementById("btnCancelar").addEventListener("click",(e)=>{

    e.preventDefault();
    e.stopPropagation();

    window.location.assign(
    "index.php?page=Catalogos_ProductosElectronica_Listado"
    );

    });

});

</script>