<section class="container-l">
  <h1>Panel de Seguridad</h1>
  <p>Administre usuarios, roles y permisos del sistema de transporte.</p>

  <section class="depth-1 px-4 py-4">
    <h2>Asignar Rol a Usuario</h2>

    <form method="post" class="grid">
      <div class="row">
        <label class="col-12 col-m-3" for="id">Usuario</label>
        <div class="col-12 col-m-9">
          <select class="width-full" id="id" name="id">
            {{foreach usuarios}}
              <option value="{{id}}">{{nombre}} - {{email}}</option>
            {{endfor usuarios}}
          </select>
        </div>
      </div>

      <div class="row">
        <label class="col-12 col-m-3" for="rolescod">Rol</label>
        <div class="col-12 col-m-9">
          <select class="width-full" id="rolescod" name="rolescod">
            {{foreach roles}}
              <option value="{{nombre}}">{{nombre}}</option>
            {{endfor roles}}
          </select>
        </div>
      </div>

      <div class="row right flex-end">
        <button type="submit" class="primary">Asignar Rol</button>
      </div>
    </form>
  </section>

  <section class="depth-1 px-4 py-4 mt-4">
    <h2>Asignar Función a Rol</h2>

    <form method="post" class="grid">
      <div class="row">
        <label class="col-12 col-m-3" for="fncod">Función</label>
        <div class="col-12 col-m-9">
          <select class="width-full" id="fncod" name="fncod">
            {{foreach funciones}}
              <option value="{{fncod}}">{{fndsc}}</option>
            {{endfor funciones}}
          </select>
        </div>
      </div>

      <div class="row">
        <label class="col-12 col-m-3" for="rolescod_fn">Rol</label>
        <div class="col-12 col-m-9">
          <select class="width-full" id="rolescod_fn" name="rolescod_fn">
            {{foreach roles}}
              <option value="{{nombre}}">{{nombre}}</option>
            {{endfor roles}}
          </select>
        </div>
      </div>

      <div class="row right flex-end">
        <button type="submit" class="primary">Asignar Función</button>
      </div>
    </form>
  </section>

  <section class="depth-1 px-4 py-4 mt-4">
    <h2>Gestión de Usuarios</h2>

    <div style="overflow-x:auto;">
      <table class="full-width">
        <thead>
          <tr>
            <th>ID</th>
            <th>Usuario</th>
            <th>Correo Electrónico</th>
            <th>Estado</th>
            <th>Acciones</th>
          </tr>
        </thead>

        <tbody>
          {{foreach usuarios}}
          <tr>
            <td>{{id}}</td>
            <td>{{nombre}}</td>

            <td>
              <form method="post" class="grid">
                <input type="hidden" name="edit_user_id" value="{{id}}">
                <input class="width-full" type="email" name="edit_email" value="{{email}}">
            </td>

            <td>
                <select class="width-full" name="edit_estado">
                  <option value="1">Activo</option>
                  <option value="0">Inactivo</option>
                </select>
            </td>

            <td>
                <button type="submit" class="primary">Guardar</button>
              </form>

              <form method="post" style="display:inline;">
                <input type="hidden" name="delete_user_id" value="{{id}}">
                <button
                  type="submit"
                  class="secondary"
                  onclick="return confirm('¿Está seguro de eliminar este usuario?');">
                  Eliminar
                </button>
              </form>
            </td>
          </tr>
          {{endfor usuarios}}
        </tbody>
      </table>
    </div>
  </section>
</section>