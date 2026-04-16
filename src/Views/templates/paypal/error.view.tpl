<div style="
    max-width:600px;
    margin:60px auto;
    padding:30px;
    border-radius:12px;
    background:#fff3f3;
    border:1px solid #ff4d4d;
    text-align:center;
    font-family:Arial, sans-serif;
    box-shadow:0px 5px 15px rgba(0,0,0,0.1);
">

    <h1 style="color:#e60000; margin-bottom:10px;">
        Pago Fallido
    </h1>

    <p style="font-size:18px; color:#333; margin-top:15px;">
        {{mensaje}}
    </p>

    <p style="color:#666; margin-top:10px;">
        No se pudo completar la transacción.  
        Puedes intentar nuevamente o revisar tu método de pago.
    </p>

    <br>

    <div style="margin-top:20px;">

        <a href="index.php?page=Checkout_Checkout"
           style="
            display:inline-block;
            padding:12px 20px;
            background:#2c3e50;
            color:white;
            text-decoration:none;
            border-radius:6px;
            font-weight:bold;
            margin-right:10px;
           ">
           Intentar de nuevo
        </a>

        <a href="index.php"
           style="
            display:inline-block;
            padding:12px 20px;
            background:#bdc3c7;
            color:#2c3e50;
            text-decoration:none;
            border-radius:6px;
            font-weight:bold;
           ">
           Volver al inicio
        </a>

    </div>

</div>