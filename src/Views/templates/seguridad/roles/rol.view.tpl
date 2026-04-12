<h1>Rol</h1>

<section class="grid row">

<form action="index.php?page=Seguridad-Roles-Rol&mode={{mode}}&id={{rolescod}}" method="POST">

<label>Código</label>
<input type="text" name="rolescod" value="{{rolescod}}">

<label>Descripción</label>
<input type="text" name="rolesdsc" value="{{rolesdsc}}">

<label>Estado</label>
<input type="text" name="rolesest" value="{{rolesest}}">

<button type="submit">Guardar</button>

<button onclick="window.location='index.php?page=Seguridad-Roles-Roles'">
Cancelar
</button>

</form>

</section>