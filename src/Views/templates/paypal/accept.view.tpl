<div style="max-width:800px; margin:50px auto; font-family:Arial; text-align:center;">

    <h1 style="margin-bottom:20px; color:#27ae60;">
        Pago Exitoso
    </h1>

    <div style="
        background:#fff;
        border-radius:12px;
        box-shadow:0 4px 12px rgba(0,0,0,0.1);
        overflow:hidden;
        text-align:left;
    ">

        <div style="
            background:#0d2b45;
            color:white;
            padding:15px;
            font-weight:bold;
            text-align:center;
            font-size:18px;
        ">
            Detalle de la Transacción
        </div>

        <div style="padding:20px;">

            <p><strong>Orden ID:</strong> {{id}}</p>
            <p><strong>Estado:</strong> 
                <span style="color:#27ae60; font-weight:bold;">
                    {{status}}
                </span>
            </p>

            <hr style="margin:15px 0;">

            <p><strong>Cliente:</strong> {{nombre}}</p>
            <p><strong>Email:</strong> {{email}}</p>

            <hr style="margin:15px 0;">

            <p><strong>Monto Pagado:</strong> 
                <span style="color:#27ae60; font-weight:bold;">
                    {{moneda}} {{monto}}
                </span>
            </p>

        </div>
    </div>

    <div style="margin-top:25px;">

        <a href="index.php"
           style="
            display:inline-block;
            padding:12px 20px;
            background:#0d2b45;
            color:white;
            text-decoration:none;
            border-radius:6px;
            font-weight:bold;
            margin-right:10px;
           ">
           Ir al inicio
        </a>

        <a href="index.php?page=Checkout_Checkout"
           style="
            display:inline-block;
            padding:12px 20px;
            background:#27ae60;
            color:white;
            text-decoration:none;
            border-radius:6px;
            font-weight:bold;
           ">
           Ver carrito
        </a>

    </div>

</div>