<section class="container-m">
  <h1>{{modeDsc}}</h1>
  <p>Formulario para registrar, consultar, actualizar o eliminar viajes disponibles.</p>

  <form method="post" action="index.php?page=Mantenimientos-Viajes-Formulario&mode={{mode}}&id={{id}}" class="grid">
    <input type="hidden" name="id" value="{{id}}">
    <input type="hidden" name="uuid" value="{{xsrf_token}}">

    <section class="depth-1 px-4 py-4">
      <div class="row">
        <label class="col-12 col-m-4" for="ruta_id">Ruta</label>
        <div class="col-12 col-m-8">
          <select class="width-full" id="ruta_id" name="ruta_id" {{if isReadonly}}disabled{{endif isReadonly}} required>
            <option value="">Seleccione una ruta</option>
            {{foreach rutas}}
              <option value="{{id}}">{{origen}} - {{destino}}</option>
            {{endfor rutas}}
          </select>
        </div>
      </div>

      <div class="row">
        <label class="col-12 col-m-4" for="bus_id">Bus</label>
        <div class="col-12 col-m-8">
          <select class="width-full" id="bus_id" name="bus_id" {{if isReadonly}}disabled{{endif isReadonly}} required>
            <option value="">Seleccione un bus</option>
            {{foreach buses}}
              <option value="{{id}}">{{placa}} - {{estado}}</option>
            {{endfor buses}}
          </select>
        </div>
      </div>

      <div class="row">
        <label class="col-12 col-m-4" for="fecha_salida">Fecha y Hora de Salida</label>
        <div class="col-12 col-m-8">
          <input
            class="width-full"
            type="datetime-local"
            id="fecha_salida"
            name="fecha_salida"
            value="{{fecha_salida}}"
            {{isReadonly}}
            required>
        </div>
      </div>

      <div class="row">
        <label class="col-12 col-m-4" for="precio">Precio del Boleto</label>
        <div class="col-12 col-m-8">
          <input
            class="width-full"
            type="number"
            step="0.01"
            min="0"
            id="precio"
            name="precio"
            value="{{precio}}"
            placeholder="Ejemplo: 350.00"
            {{isReadonly}}
            required>
        </div>
      </div>

      <div class="row">
        <label class="col-12 col-m-4" for="estado">Estado del Viaje</label>
        <div class="col-12 col-m-8">
          <select class="width-full" id="estado" name="estado" {{if isReadonly}}disabled{{endif isReadonly}} required>
            <option value="programado">Programado</option>
            <option value="en_ruta">En ruta</option>
            <option value="finalizado">Finalizado</option>
            <option value="cancelado">Cancelado</option>
          </select>
        </div>
      </div>

      <div class="row flex-end">
        <a href="index.php?page=Mantenimientos-Viajes-Listado" class="secondary">Cancelar</a>

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