<h1>{{modeDsc}}</h1>

<form method="post" action="index.php?page=Mantenimientos-Ordenes-Formulario&mode={{mode}}&id={{id}}">

    <input type="hidden" name="uuid" value="{{xsrf_token}}">
    <input type="hidden" name="id" value="{{id}}">

    <!-- USUARIO -->
    <label>Usuario:</label><br>
    <select name="usuario_id" {{isReadonly}}>
        {{foreach usuarios}}
            <option value="{{id}}" {{selected}}>
                {{nombre}} ({{email}})
            </option>
        {{endfor usuarios}}
    </select>
    <br><br>

    <!-- TOTAL -->
    <label>Total:</label><br>
    <input type="number" step="0.01" name="total" value="{{total}}" {{isReadonly}}>
    <br><br>

    <!-- ESTADO -->
    <label>Estado:</label><br>
    <input type="text" name="estado" value="{{estado}}" {{isReadonly}}>
    <br><br>

    <!-- FECHA -->
    <label>Fecha:</label><br>
    <input type="text" value="{{fecha}}" readonly>
    <br><br>

    {{ifnot hideConfirm}}
        <button type="submit" title="{{confirmToolTip}}">
            💾 Confirmar
        </button>
    {{endifnot hideConfirm}}

</form>

<br>

<a href="index.php?page=Mantenimientos-Ordenes-Listado">
    ⬅️ Volver al listado
</a>