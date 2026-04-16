<div style="max-width:800px; margin:40px auto; font-family:Arial;">

    <h1>🧾 Detalle de Orden</h1>

    <table style="width:100%; border-collapse: collapse; text-align:center;">
        <tr style="background:#0d2b45; color:white;">
            <th>Ruta</th>
            <th>Cantidad</th>
            <th>Precio</th>
        </tr>

        {{foreach detalle}}
        <tr>
            <td>{{origen}} - {{destino}}</td>
            <td>{{cantidad}}</td>
            <td>L {{precio}}</td>
        </tr>
        {{endfor detalle}}

    </table>

</div>