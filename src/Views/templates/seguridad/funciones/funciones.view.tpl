<section class="container">

<table>

<thead>
<tr>
<th>Código</th>
<th>Descripción</th>
<th>Estado</th>
<th>Tipo</th>
<th>
<a href="index.php?page=Seguridad-Funciones-Funcion&mode=INS&id=0">Nuevo</a>
</th>
</tr>
</thead>

<tbody>

{{foreach funciones}}

<tr>

<td>{{fncod}}</td>
<td>{{fndsc}}</td>
<td>{{fnest}}</td>
<td>{{fntyp}}</td>

<td>

<a href="index.php?page=Seguridad-Funciones-Funcion&mode=DSP&id={{fncod}}">
Mostrar
</a>

<br/>

<a href="index.php?page=Seguridad-Funciones-Funcion&mode=UPD&id={{fncod}}">
Actualizar
</a>

<br/>

<a href="index.php?page=Seguridad-Funciones-Funcion&mode=DEL&id={{fncod}}">
Eliminar
</a>

</td>

</tr>

{{endfor funciones}}

</tbody>

</table>

</section>