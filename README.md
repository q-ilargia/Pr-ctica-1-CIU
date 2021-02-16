# Práctica 1 CIU

La práctica presentada a continuación consiste en la realización de una réplica del famoso juego clásico PONG empleando la herramienta Processing 3, presentándose el resultado obtenido a continuación para su posterior desglose.
Inicialmente la aplicación comienza con una breve pantalla que te explica cómo funciona el juego, una vez pulsada la tecla ENTER como indica comienza el juego, "sirviendo" la figura colocada al lado izquierdo de la pantalla, denominada como P1.


  ![Ejemplo](https://github.com/q-ilargia/Pr-ctica-1-CIU/blob/main/Gif.gif?raw=true)

#Desarrollo

El proceso de desarrollo de esta práctica siguió una serie de pasos diferenciados:
-Análisis del producto original
Como el trabajo a realizar es una réplica de un juego ya existente lo primero que realicé fue buscar el original para tener una idea más clara del producto final a realizar, permitiéndome saltarme la fase de bocetado pues el original iba a servir de plantilla.
-Diseño del apartado gráfico
Una vez tuve claro el apartado gráfico lo diseñé, dejándolo todo completo antes de comenzar con las funcionalidades básicas del juego. Dentro del apartado gráfico una de las decisiones de diseño tomadas fue el emplear una fuente lo más parecida a la original.
-Introducción de las funcionalidades
Una vez acabado el apartado gráfico el apartado definitivo fue añadir las funcionalidades, comenzando por dotar de movimiento a la pelota del juego, inicialmente fue un movimiento fijo, para posteriormente ser aleatorizado. Lo siguiente en introducir fue el movimiento de las figuras de juego para completar con el añadido de las físicas de rebote.

#Ideas desechadas

Hubieron varias ideas desechadas que debido a falta de control sobre la herramienta fueron desechadas, entre ellas se encuentran:
-Final del juego con un ganador.
-Modo de juego contra la máquina con movimiento aleatorio de una de las figuras.

#Breve resumen del funcionamiento

La implementación en sí es bastante simple, implementando cada apartado por bloques:
-Un bloque para el apartado visual, donde se implementa el tablero.
-Un bloque para el apartado visual jugable, donde se implementan las figuras de juego y la pelota.
-Un bloque para los desplazamientos, tanto de la pelota como de las figuras de juego.
-Un bloque para la pantalla explicatoria del inicio.
-Un bloque que se encarga de los límites de la pantalla, tanto para llevar a cabo los rebotes en las zonas superior e inferior como para anotar los goles en ambos extremos laterales de la pantalla.
-Un bloque para el rebote de la pelota con las figuras de juego.
-Un bloque que se encarga de la pulsación de las teclas.

#Recursos
[Sonido de rebote](https://www.youtube.com/watch?v=vqPOekmXOu0)
[Sonido de gol](https://www.youtube.com/watch?v=UfumsRKSpeo)
[Fuente](http://www.mattlag.com/bitfonts/) En concreto bit5x3
[Gyazo]() Para la realización del gif
[Ezgif](https://ezgif.com) Para convertir lo obtenido en Gyazo a gif

