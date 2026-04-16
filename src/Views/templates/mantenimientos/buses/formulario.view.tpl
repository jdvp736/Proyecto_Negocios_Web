<section class="container-m">
  <h1>{{modeDsc}}</h1>
  <p>Formulario para registrar, consultar, actualizar o eliminar buses del sistema.</p>

  <form method="post" action="index.php?page=Mantenimientos-Buses-Formulario&mode={{mode}}&id={{id}}" class="grid">
    <input type="hidden" name="id" value="{{id}}">
    <input type="hidden" name="uuid" value="{{xsrf_token}}">

    <section class="depth-1 px-4 py-4">
      <div class="row">
        <label class="col-12 col-m-4" for="placa">Placa del Bus</label>
        <div class="col-12 col-m-8">
          <input
            class="width-full"
            type="text"
            id="placa"
            name="placa"
            value="{{placa}}"
            placeholder="Ejemplo: HAA-1234"
            {{isReadonly}}
            required>
        </div>
      </div>

      <div class="row">
        <label class="col-12 col-m-4" for="tipo_id">Tipo de Bus</label>
        <div class="col-12 col-m-8">
          <select class="width-full" id="tipo_id" name="tipo_id" {{if isReadonly}}disabled{{endif isReadonly}} required>
            <option value="">Seleccione un tipo de bus</option>
            {{foreach tipos}}
              <option value="{{id}}">{{nombre}}</option>
            {{endfor tipos}}
          </select>
        </div>
      </div>

      <div class="row">
        <label class="col-12 col-m-4" for="estado">Estado</label>
        <div class="col-12 col-m-8">
          <select class="width-full" id="estado" name="estado" {{if isReadonly}}disabled{{endif isReadonly}} required>
            <option value="activo">Activo</option>
            <option value="mantenimiento">Mantenimiento</option>
            <option value="inactivo">Inactivo</option>
          </select>
        </div>
      </div>

      <div class="row flex-end">
        <a href="index.php?page=Mantenimientos-Buses-Listado" class="secondary">Cancelar</a>

        {{ifnot hideConfirm}}
          <button
            type="submit"
            class="primary"
            title="{{confirmToolTip}}">
            Confirmar
          </button>
        {{endifnot hideConfirm}}
      </div>
    </section>
  </form>
</section>