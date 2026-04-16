<section class="container-m">
  <h1>{{modeDsc}}</h1>
  <p>Formulario para registrar, consultar, actualizar o eliminar órdenes de compra.</p>

  <form method="post" action="index.php?page=Mantenimientos-Ordenes-Formulario&mode={{mode}}&id={{id}}" class="grid">
    <input type="hidden" name="id" value="{{id}}">
    <input type="hidden" name="uuid" value="{{xsrf_token}}">

    <section class="depth-1 px-4 py-4">
      <div class="row">
        <label class="col-12 col-m-4" for="usuario_id">Usuario</label>
        <div class="col-12 col-m-8">
          <select class="width-full" id="usuario_id" name="usuario_id" {{if isReadonly}}disabled{{endif isReadonly}} required>
            <option value="">Seleccione un usuario</option>
            {{foreach usuarios}}
              <option value="{{id}}" {{selected}}>{{nombre}} - {{email}}</option>
            {{endfor usuarios}}
          </select>
        </div>
      </div>

      <div class="row">
        <label class="col-12 col-m-4" for="total">Total de la Orden</label>
        <div class="col-12 col-m-8">
          <input
            class="width-full"
            type="number"
            step="0.01"
            min="0"
            id="total"
            name="total"
            value="{{total}}"
            placeholder="Ejemplo: 700.00"
            {{isReadonly}}
            required>
        </div>
      </div>

      <div class="row">
        <label class="col-12 col-m-4" for="estado">Estado</label>
        <div class="col-12 col-m-8">
          <select class="width-full" id="estado" name="estado" {{if isReadonly}}disabled{{endif isReadonly}} required>
            <option value="pendiente">Pendiente</option>
            <option value="pagada">Pagada</option>
            <option value="cancelada">Cancelada</option>
          </select>
        </div>
      </div>

      {{if fecha}}
      <div class="row">
        <label class="col-12 col-m-4">Fecha de Registro</label>
        <div class="col-12 col-m-8">
          <input class="width-full" type="text" value="{{fecha}}" readonly>
        </div>
      </div>
      {{endif fecha}}

      <div class="row flex-end">
        <a href="index.php?page=Mantenimientos-Ordenes-Listado" class="secondary">Cancelar</a>

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