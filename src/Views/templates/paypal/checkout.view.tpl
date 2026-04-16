<div style="max-width:1100px; margin:40px auto; font-family:Arial;">

    <h1 style="text-align:center; margin-bottom:20px;">
        Resumen de Compra
    </h1>

    <div style="display:flex; flex-wrap:wrap; gap:20px; justify-content:center;">

        {{foreach carrito}}
        <div style="
            width:300px;
            background:#fff;
            border-radius:12px;
            box-shadow:0 4px 12px rgba(0,0,0,0.1);
            overflow:hidden;
        ">

            <div style="
                background:#0d2b45;
                color:white;
                padding:15px;
                font-weight:bold;
                text-align:center;
            ">
                {{origen}} → {{destino}}
            </div>

            <div style="padding:15px; text-align:left;">

                <p><strong>Precio:</strong> L {{precio}}</p>
                <p><strong>Cantidad:</strong> {{cantidad}}</p>
                <p><strong>Subtotal:</strong> 
                    <span style="color:#27ae60; font-weight:bold;">
                        L {{subtotal}}
                    </span>
                </p>

                <div style="margin-top:10px;">

                    <a href="index.php?page=Checkout_Checkout&add={{viaje_id}}"
                       style="margin-right:5px; text-decoration:none;">
                        ➕
                    </a>

                    <a href="index.php?page=Checkout_Checkout&less={{viaje_id}}"
                       style="margin-right:10px; text-decoration:none;">
                        ➖
                    </a>

                    <a href="index.php?page=Checkout_Checkout&remove={{viaje_id}}"
                       style="color:red; font-weight:bold; text-decoration:none;">
                       Eliminar
                    </a>

                </div>

            </div>
        </div>
        {{endfor carrito}}

    </div>

    <div style="
        text-align:center;
        margin-top:30px;
        font-size:22px;
        font-weight:bold;
    ">
        Total: L {{total}}
    </div>

    <div style="text-align:center; margin-top:20px;">
        <form action="index.php?page=Checkout_Checkout" method="post">
            <button style="
                background:#0d2b45;
                color:white;
                padding:12px 25px;
                border:none;
                border-radius:6px;
                font-size:16px;
                cursor:pointer;
            ">
                Pagar con PayPal
            </button>
        </form>
    </div>

</div>