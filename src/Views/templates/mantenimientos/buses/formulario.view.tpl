<h1>{{modeDsc}}</h1>

<form method="post" action="index.php?page=Mantenimientos-Buses-Formulario&mode={{mode}}&id={{id}}">

    <!-- Token -->
    <input type="hidden" name="uuid" value="{{xsrf_token}}">
    <input type="hidden" name="id" value="{{id}}">

    <label>Placa:</label><br>
    <input type="text" name="placa" value="{{placa}}" {{isReadonly}} required>
    <br><br>

    <label>Tipo de Bus:</label><br>
    <select name="tipo_id" {{isReadonly}}>
        {{foreach tipos}}
            <option value="{{id}}" {{selected}}>
                {{nombre}}
            </option>
        {{endfor tipos}}
    </select>
    <br><br>

    <label>Estado:</label><br>
    <input type="text" name="estado" value="{{estado}}" {{isReadonly}}>
    <br><br>

    {{ifnot hideConfirm}}
        <button type="submit" title="{{confirmToolTip}}">
            💾 Confirmar
        </button>
    {{endifnot hideConfirm}}

</form>

<br>

<a href="index.php?page=Mantenimientos-Buses-Listado">
    ⬅️ Volver al listado
</a>