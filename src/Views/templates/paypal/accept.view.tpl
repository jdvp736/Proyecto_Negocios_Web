<section class="container-l">
  <h1>Compra Confirmada</h1>
  <p>{{paymentMessage}}</p>

  <section class="depth-1 px-4 py-4">
    <h2>Resumen de la Transacción</h2>

    <table class="full-width">
      <tbody>
        <tr>
          <th>Estado del pago</th>
          <td>{{paymentStatus}}</td>
        </tr>
        <tr>
          <th>Servicio</th>
          <td>Compra de boletos de bus</td>
        </tr>
        <tr>
          <th>Mensaje</th>
          <td>Gracias por utilizar nuestro sistema de transporte.</td>
        </tr>
      </tbody>
    </table>

    <div class="row mt-4">
      <a href="index.php" class="primary">Volver al Inicio</a>
      <a href="index.php?page=checkout_checkout" class="secondary">Realizar otra compra</a>
    </div>
  </section>

  {{if orderjson}}
  <section class="depth-1 px-4 py-4 mt-4">
    <h2>Detalle técnico de la transacción</h2>
    <pre>{{orderjson}}</pre>
  </section>
  {{endif orderjson}}
</section>