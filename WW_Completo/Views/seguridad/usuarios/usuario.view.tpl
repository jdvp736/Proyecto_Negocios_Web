<h1>{{modeDsc}}</h1>

<section class="grid row">
<form class="depth-0 offset-3 col-6" action="index.php?page=Seguridad-Usuarios-Usuario&mode={{mode}}&id={{usercod}}" method="POST">

<div class="row align-center">
    <div class="col-4">
        <label for="usercod">Código</label>
    </div>
    <div class="col-8">
        <input type="text" id="usercod" value="{{usercod}}" disabled readonly>
        <input type="hidden" name="usercod" value="{{usercod}}">
    </div>
</div>

<div class="row align-center">
    <div class="col-4">
        <label for="useremail">Email</label>
    </div>
    <div class="col-8">
        <input type="text" id="useremail" name="useremail" value="{{useremail}}" placeholder="Correo del usuario" {{isReadonly}}>
    </div>
</div>

<div class="row align-center">
    <div class="col-4">
        <label for="username">Nombre</label>
    </div>
    <div class="col-8">
        <input type="text" id="username" name="username" value="{{username}}" placeholder="Nombre del usuario" {{isReadonly}}>
    </div>
</div>

<div class="row align-center">
    <div class="col-4">
        <label for="userpswd">Contraseña</label>
    </div>
    <div class="col-8">
        <input type="text" id="userpswd" name="userpswd" value="{{userpswd}}" placeholder="Contraseña del usuario" {{isReadonly}}>
    </div>
</div>

<div class="row align-center">
    <div class="col-4">
        <label for="usertipo">Tipo Usuario</label>
    </div>
    <div class="col-8">
        <input type="text" id="usertipo" name="usertipo" value="{{usertipo}}" placeholder="Tipo de usuario" {{isReadonly}}>
    </div>
</div>

<div class="row align-center">
    <div class="col-4">
        <label for="userest">Estado</label>
    </div>
    <div class="col-8">
        <input type="text" id="userest" name="userest" value="{{userest}}" placeholder="Estado del usuario" {{isReadonly}}>
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
document.addEventListener("DOMContentLoaded", ()=>{
    document.getElementById("btnCancelar").addEventListener("click",(e)=>{
        e.preventDefault();
        window.location.assign("index.php?page=Seguridad-Usuarios-Usuarios");
    });
});
</script>