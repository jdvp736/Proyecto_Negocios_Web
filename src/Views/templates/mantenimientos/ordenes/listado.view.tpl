<h1>Listado de Órdenes</h1>

<table border="1" cellpadding="5">
    <thead>
        <tr>
            <th>ID</th>
            <th>Usuario</th>
            <th>Email</th>
            <th>Total</th>
            <th>Estado</th>
            <th>Fecha</th>
        </tr>
    </thead>
    <tbody>
        <?php if (!empty($ordenes)): ?>
            <?php foreach ($ordenes as $orden): ?>
                <tr>
                    <td><?= $orden["id"] ?></td>
                    <td><?= $orden["usuario"] ?></td>
                    <td><?= $orden["email"] ?></td>
                    <td>L. <?= number_format($orden["total"], 2) ?></td>
                    <td><?= $orden["estado"] ?></td>
                    <td><?= $orden["fecha"] ?></td>
                </tr>
            <?php endforeach; ?>
        <?php else: ?>
            <tr>
                <td colspan="6">No hay órdenes registradas</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>