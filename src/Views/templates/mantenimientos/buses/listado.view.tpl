<h1>Listado de Buses</h1>

<table border="1">
    <thead>
        <tr>
            <th>ID</th>
            <th>Placa</th>
            <th>Tipo</th>
            <th>Estado</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($buses as $bus): ?>
            <tr>
                <td><?= $bus["id"] ?></td>
                <td><?= $bus["placa"] ?></td>
                <td><?= $bus["tipo"] ?></td>
                <td><?= $bus["estado"] ?></td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>