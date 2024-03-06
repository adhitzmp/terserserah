<?php

use function PHPUnit\Framework\isNull;
?>
<div>
 <!-- Nothing in life is to be feared, it is only to be understood. Now is the time to understand more, so that we may fear less. - Marie Curie -->
    <h1>Welcome to the new world, {{$title}}</h1>
    <form action="" method="GET">
        <div>
            <label>Masukan Nama</label>
            <input type="text" name="title"/>
            <button type="submit">submit</button>
        </div>
    </form>
</div>
