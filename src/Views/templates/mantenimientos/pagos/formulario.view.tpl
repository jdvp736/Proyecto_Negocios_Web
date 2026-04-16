<section class="container-m">
  <h1>{{modeDsc}}</h1>
  <p>Formulario para registrar, consultar, actualizar o eliminar pagos realizados.</p>

  <form method="post" action="index.php?page=Mantenimientos-Pagos-Formulario&mode={{mode}}&id={{id}}" class="grid">
    <input type="hidden" name="id" value="{{id}}">
    <input type="hidden" name="uuid" value="{{xsrf_token}}">

    <section class="depth-1 px-4 py-4">
      <div class="row">
        <label class="col-12 col-m-4" for="orden_id">Orden</label>
        <div class="col-12 col-m-8">
          <select class="width-full" id="orden_id" name="orden_id" {{if isReadonly}}disabled{{endif isReadonly}} required>
            <option value="">Seleccione una orden</option>
            {{foreach ordenes}}
              <option value="{{id}}">Orden #{{id}} - Total L. {{total}}</option>
            {{endfor ordenes}}
          </select>
        </div>
      </div>

      <div class="row">
        <label class="col-12 col-m-4" for="metodo">Método de Pago</label>
        <div class="col-12 col-m-8">
          <select class="width-full" id="metodo" name="metodo" {{if isReadonly}}disabled{{endif isReadonly}} required>
            <option value="">Seleccione un método</option>
            <option value="PayPal">PayPal</option>
            <option value="Tarjeta">Tarjeta</option>
            <option value="Efectivo">Efectivo</option>
            <option value="Transferencia">Transferencia</option>
          </select>
        </div>
      </div>

      <div class="row">
        <label class="col-12 col-m-4" for="estado">Estado del Pago</label>
        <div class="col-12 col-m-8">
          <select class="width-full" id="estado" name="estado" {{if isReadonly}}disabled{{endif isReadonly}} required>
            <option value="">Seleccione un estado</option>
            <option value="pendiente">Pendiente</option>
            <option value="aprobado">Aprobado</option>
            <option value="rechazado">Rechazado</option>
            <option value="reembolsado">Reembolsado</option>
          </select>
        </div>
      </div>

      <div class="row">
        <label class="col-12 col-m-4" for="transaction_id">ID de Transacción</label>
        <div class="col-12 col-m-8">
          <input
            class="width-full"
            type="text"
            id="transaction_id"
            name="transaction_id"
            value="{{transaction_id}}"
            placeholder="Ejemplo: PAY-2026-0001"
            {{isReadonly}}
            required>
        </div>
      </div>

      <div class="row flex-end">
        <a href="index.php?page=Mantenimientos-Pagos-Listado" class="secondary">Cancelar</a>

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