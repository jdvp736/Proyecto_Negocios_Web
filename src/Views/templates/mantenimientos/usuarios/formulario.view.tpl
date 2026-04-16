<section class="container-m">
  <h1>{{modeDsc}}</h1>
  <p>Formulario para registrar, consultar, actualizar o eliminar usuarios del sistema.</p>

  <form method="post" action="index.php?page=Mantenimientos-Usuarios-Formulario&mode={{mode}}&id={{id}}" class="grid">
    <input type="hidden" name="id" value="{{id}}">
    <input type="hidden" name="uuid" value="{{xsrf_token}}">

    <section class="depth-1 px-4 py-4">
      <div class="row">
        <label class="col-12 col-m-4" for="nombre">Nombre</label>
        <div class="col-12 col-m-8">
          <input
            class="width-full"
            type="text"
            id="nombre"
            name="nombre"
            value="{{nombre}}"
            placeholder="Nombre completo del usuario"
            {{isReadonly}}
            required>
        </div>
      </div>

      <div class="row">
        <label class="col-12 col-m-4" for="email">Correo Electrónico</label>
        <div class="col-12 col-m-8">
          <input
            class="width-full"
            type="email"
            id="email"
            name="email"
            value="{{email}}"
            placeholder="correo@ejemplo.com"
            {{isReadonly}}
            required>
        </div>
      </div>

      {{ifnot isReadonly}}
      <div class="row">
        <label class="col-12 col-m-4" for="password">Contraseña</label>
        <div class="col-12 col-m-8">
          <input
            class="width-full"
            type="password"
            id="password"
            name="password"
            placeholder="Contraseña segura">
          <small>Solo se requiere al crear un usuario nuevo.</small>
        </div>
      </div>
      {{endifnot isReadonly}}

      <div class="row">
        <label class="col-12 col-m-4" for="rol_id">Rol</label>
        <div class="col-12 col-m-8">
          <select class="width-full" id="rol_id" name="rol_id" {{if isReadonly}}disabled{{endif isReadonly}} required>
            <option value="">Seleccione un rol</option>
            {{foreach roles}}
              <option value="{{id}}">{{nombre}}</option>
            {{endfor roles}}
          </select>
        </div>
      </div>

      <div class="row">
        <label class="col-12 col-m-4" for="estado">Estado</label>
        <div class="col-12 col-m-8">
          <select class="width-full" id="estado" name="estado" {{if isReadonly}}disabled{{endif isReadonly}} required>
            <option value="1">Activo</option>
            <option value="0">Inactivo</option>
          </select>
        </div>
      </div>

      <div class="row flex-end">
        <a href="index.php?page=Mantenimientos-Usuarios-Listado" class="secondary">Cancelar</a>

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

