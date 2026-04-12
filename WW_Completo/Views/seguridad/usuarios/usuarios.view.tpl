<section class="container">

<table>

<thead>
<tr>
<th>Código</th>
<th>Email</th>
<th>Nombre</th>
<th>
<a href="index.php?page=Seguridad-Usuarios-Usuario&mode=INS&id=0">Nuevo</a>
</th>
</tr>
</thead>

<tbody>

{{foreach usuarios}}

<tr>
<td>{{usercod}}</td>
<td>{{useremail}}</td>
<td>{{username}}</td>

<td>
<a href="index.php?page=Seguridad-Usuarios-Usuario&mode=DSP&id={{usercod}}">Mostrar</a>
<br>
<a href="index.php?page=Seguridad-Usuarios-Usuario&mode=UPD&id={{usercod}}">Actualizar</a>
<br>
<a href="index.php?page=Seguridad-Usuarios-Usuario&mode=DEL&id={{usercod}}">Eliminar</a>
</td>

</tr>

{{endfor usuarios}}

</tbody>
</table>

</section>