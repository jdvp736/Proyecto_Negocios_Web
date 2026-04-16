<div style="max-width:1000px; margin:40px auto; font-family:Arial;">

    <h1 style="text-align:center; margin-bottom:25px;">
        Historial de Compras
    </h1>

    {{foreach historial}}
    <div style="
        background:#fff;
        border-radius:10px;
        margin-bottom:15px;
        box-shadow:0 4px 10px rgba(0,0,0,0.1);
        overflow:hidden;
    ">

        <div style="
            background:#0d2b45;
            color:white;
            padding:12px;
            font-weight:bold;
        ">
            Orden #{{id}} - {{fecha}}
        </div>

        <div style="padding:15px;">

            <p><strong>Total:</strong> L {{total}}</p>
            <p><strong>Estado:</strong> 
                <span style="color:green; font-weight:bold;">
                    {{estado}}
                </span>
            </p>

            <a href="index.php?page=Checkout_Detalle&orden={{id}}"
               style="color:#0d2b45; font-weight:bold;">
               Ver Detalle 
            </a>

        </div>
    </div>
    {{endfor historial}}

</div>