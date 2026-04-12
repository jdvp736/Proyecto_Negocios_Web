<h1>{{modeDsc}}</h1>

<section class="grid row">

<form class="depth-0 offset-3 col-6" action="index.php?page=Seguridad-Funciones-Funcion&mode={{mode}}&id={{fncod}}" method="POST">

<div class="row align-center">
<div class="col-4">
<label for="fncod">Código</label>
</div>

<div class="col-8">
<input type="text" id="fncod" value="{{fncod}}" disabled readonly>
<input type="hidden" name="fncod" value="{{fncod}}">
</div>
</div>


<div class="row align-center">
<div class="col-4">
<label for="fndsc">Descripción</label>
</div>

<div class="col-8">
<input type="text" id="fndsc" name="fndsc" value="{{fndsc}}" {{isReadonly}} placeholder="Descripción de la función">
</div>
</div>


<div class="row align-center">
<div class="col-4">
<label for="fnest">Estado</label>
</div>

<div class="col-8">
<input type="text" id="fnest" name="fnest" value="{{fnest}}" {{isReadonly}} placeholder="Estado">
</div>
</div>


<div class="row align-center">
<div class="col-4">
<label for="fntyp">Tipo</label>
</div>

<div class="col-8">
<input type="text" id="fntyp" name="fntyp" value="{{fntyp}}" {{isReadonly}} placeholder="Tipo de función">
</div>
</div>


{{if confirmToolTip}}
<div class="error">
{{confirmToolTip}}
</div>
{{endif confirmToolTip}}


<div class="right">

{{ifnot hideConfirm}}
<button type="submit">Confirmar</button>
{{endifnot hideConfirm}}

&nbsp;

<button id="btnCancelar">Cancelar</button>

</div>

</form>

</section>


<script>

document.addEventListener("DOMContentLoaded",()=>{

document.getElementById("btnCancelar").addEventListener("click",(e)=>{

e.preventDefault();

window.location.assign("index.php?page=Seguridad-Funciones-Funciones");

});

});

</script>