## Prueba técnica Memorándum

<p>Prueba técnica realizada para Memorándum, esto ha sido una aplicación móvil sencilla que la he tenido que realizar en 3 horas aproximadamente.</p>

<p>La Aplicación tiene como arquitectura la recomendada según la recomendación de Flutter BLoC, está dividido en presentation, data y bloc donde, además, a mi me gusta poner una carpeta que es config donde allí se hace logica de configuración de la app como por ejemplo el Router, la inyección de dependencias y, también, se podría hacer el AppTheme en caso de querer hacer una aplicación con Dark y Light mode.</p>

<p>He realizado la Aplicación sencilla utilizando solo un BLoC ya que era más recomendable utilizar BLoC en este caso en vez de Cubit</p>

>[!TIP]
> No estoy muy orgulloso del diseño pero es lo que me ha dado tiempo a realizar en este tiempo.
> No me ha dado tiempo a hacer la parte opcional pero, tenia parte de la lógica para poder hacerlo, la idea era hacer un filtrado de las Listas actuales de cervezas ya sea por nombre o título. ¿Por qué con las listas que nos llega en un principio? Porqué a priori he utilizado el endpoint que devuelve TODAS las cervezas que hay en la BD, entonces, como que no he encontrado ningún endpoint para filtrar, pues lo podía hacer yo con una función que reduzca la Lista según el nombre o el título que se pase.

>[!NOTE]
> - Como mejoras, hay un par de buggs que he podido encontrar. Primero, hay algunos textos que salen de la pantalla aún poniendo el maxlines y el textOverflow.
> - Cuando entras a los detalles de una cerveza y le das al BackButton, sigue quedándose el BackButton en la página de HomePage y, si le vuelves a dar, sigues yendo hacia atrás, esto se soluciona con un .pop() en vez de un pushReplacement()
> - Mejorar muchísimo el diseño sobre todo, en el de detalles de la cerveza.
