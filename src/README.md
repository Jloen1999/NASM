# ElaNanguanJoseLuisObiangGrupoCNASM

<span style="font-family:Arial;font-style: normal; font-size:12px">

<img src="svheppSu6-nasm.jpg" alt="NASM" width="100%" height="200px"/>
  
  <h2 style="color: magenta">PRÁCTICA NASM - CRIPTOGRAFÍA</h2>

[![GitHub](https://img.shields.io/badge/github%20NASM-%23181717.svg?&style=for-the-badge&logo=github&logoColor=white)](https://github.com/Jloen1999/NASM) <br>
![Nombre:](https://img.shields.io/badge/Nombre:-Jose%20Luis%20Obiang%20Ela%20Nanguan-orange) <br>
![Grupo](https://img.shields.io/badge/Grupo:-C-orange) <br>
![Profesor](https://img.shields.io/badge/Profesor:-Raúl%20Lérida-orange) <br>
![Fecha](https://img.shields.io/badge/Fecha-29%2F05%2F2022-orange)

<h2><b>Índice</b></h2>
<ol>
<li><strong><a id="1" href="#Enunciado">Enunciado</a></strong>
<li><strong><a id="2" href="#Memoria">Memoria</a></strong></li>
<li><strong><a id="3" href="#Codigo">Codigo</a></strong>
<li><strong><a id="4" href="#Prueba">Datos de prueba</a></strong>
<li><strong><a id="4" href="#Bibliografia">Bibliografía</a></strong>
<li><strong><a id="4" href="#Opinion">Opinión</a></strong>
<ol><br><br>

<strong><a style="color:green; font-size:25px; margin:0" href="#1">1. Enunciado</a></strong>

<p style="font-famlily: Arial, Helvetica, sans-serif; font-size: 12px" id="Enunciado">
  <strong>Enunciado de la Práctica de NASM</strong><br><br>
  
Se trata de realizar, en NASM, un proceso que realice un pequeño
trabajo de “criptografía”.
Lo primero que hará nuestro programa es visualizar por pantalla el literal
“Programa sobre CRIPTOGRAFÍA”, en la posición 2,2 de pantalla (Fila = 2,
Columna = 2), para indicarnos que va a comenzar el proceso de entrada de
valores: <br>

A continuación, nuestro programa, va a ir visualizando las posiciones de
un vector donde vamos a ir introduciendo las **"traducciones alfabéticas"**
correspondientes a la clave numérica introducida. Así, visualizaremos en
posiciones consecutivas de pantalla, los literales correspondientes a la
entrada de los valores para que el usuario los vaya introduciendo “a su
gusto”. En la posición 4, 2, de pantalla (Fila = 4, Columna = 2),
visualizaremos el literal **“Introduce el contenido de la posición 0: "** para
que introduzcamos la letra **A**. En la posición 5, 2, de pantalla (Fila = 5,
Columna = 2), visualizaremos el literal **"Introduce el contenido de la
posición 1: **"para que introduzcamos la letra **B**, … En la posición 13, 2, de
pantalla (Fila = 13, Columna = 2), visualizaremos el literal **"Introduce el
contenido de la posición 9:"** para que introduzcamos la letra **J**.
  
La correspondencia se denota a continuación:
POSICIONES DEL VECTOR CONTENIDOS
  
A su vez, el programa irá almacenando estos valores en sus posiciones del
vector correspondientes.
  
Hay que comprobar que todos los valores introducidos (desde la **A** hasta la
**J**), NO SE REPITAN. Si ocurre esto, se debe sacar un mensaje **"¡CUIDADO!
Ese valor ya existe. "**, en la posición 15, 02 y permitir que se introduzca de
nuevo otro valor no repetido:

  
A continuación, se nos pide que introduzcamos una clave de, al menos, 6
dígitos (**pueden ser menos de 6. 6 máximo**). Para ello visualizaremos en la
posición 15, 2, el literal **“Introduce la CLAVE (6 caracteres numéricos): "**.
  
  Por ejemplo, vamos a meter los dígitos <span style="color:red">189427</span>:
  
El programa nos tiene que devolver los valores correspondientes a la clave
introducida. Es decir, viendo los valores que hemos introducido en el
vector, al <span style="color:red">1</span>, le corresponde el valor <span style="color:blue">B</span>, al <span style="color:red">8</span>, le corresponde el valor I, al 9,
le corresponde el valor <span style="color:blue">J</span>, al <span style="color:red">4</span>, le corresponde el valor <span style="color:blue">E</span>, al <span style="color:red">2</span>, le
corresponde el valor <span style="color:blue">C</span>, y al <span style="color:red">7</span>, le corresponde el valor <span style="color:blue">H</span>.
  
El resultado es: <span style="color:blue">BIJECH</span>

Estos valores los visualizaremos a través del literal **"Solución: "** que
pondremos en la posición 17, 2:
  
Por último, el programa nos preguntará si queremos realizar otra
operación mediante el literal **"¿Otra Operación (S/N)?: "**, en la posición
19, 2. A esta pregunta podemos responder "S" o "s" para realizar otra
operación o “otra respuesta” para finalizar el programa:
  
Si respondemos “s” o “S” volveremos a pedir una nueva clave a través del
literal “Introduce la CLAVE (6 caracteres numéricos): “:
Los literales “Solución: “ y “¿Otra Operación (S/N)?: “ desaparecen de
pantalla.
  
Veamos ahora lo que sucede cuando introducimos una clave de 4 dígitos,
por ejemplo 1234:
Si ahora respondemos “N” o “n”, el programa acaba.
  
  
  </p><br>

<strong><a style="color:green; font-size:25px; margin:0" href="#1">2. Memoria</a></strong>

  <p id="Memoria"></p>
  
<strong>Antes de empezar con el desarrollo del programa en lenguaje de bajo nivel, Ensamblador, primero he conseguido hacerlo en Java(lenguaje interpretado de alto nivel) para que de esta forma sepa cómo proceder a hacerlo en un lenguaje más parecido al lenguaje máquina. He aplicado la ley de divide y vencerás para así segmentar el programa y hacerlo más fácil de entender.<br><br>
 
  <span style="color: green">Este es el Código del programa en Java: </span><br>
  
  <ol style="list-style-type: decimal"><strong>Dicho código se compone de 4 partes:</strong><br>
   <li>Fill array:
       <ul>
          <li>Primero he creado un vector de tipo char con tamaño 10 que almacene cada una de las distintas claves(vClaves)</li>
          <li>letter: variable de tipo char que almacena temporalmente la clave introducida para luego compararlo con cada una de las claves anteriores del vector para asi poder controlar que no estemos introduciendo claves duplicadas, lo que significa que solo se almacenara la clave siempre y cuando no este previamente almacenada en el vector</li>
         <li>verify: funcion que compara la nueva clave introducida con cada una de las claves anteriores del vector</li>
          <li>Luego recorro dicho vector y por cada posición muestro un mensaje al usuario concatenado con la posición actual del vector y así introduzca las claves por cada posición.             </li>
       </ul>
    </li>
    <li>Enter the string Numbers
        <ul>
          <li>clave: variable de tipo string que almacena la cadena de numeros a traducir, pedimos al usuario que introduzca una cadena la cual traduciremos mediante las claves</li> 
          <li>cada caracter de la cadena es un numero que logicamente representa una posicion del vector, entonces para la traduccion lo que he hecho es recorrer la cadena y por cada iteracion he convertido cada caracter a numero para asi pasarlo al vector como indice y acceder a la clave correspondiente a dicha posicion y finalmente almacenarlos todos en una variable "traduccion"</li>
       </ul>
    </li>
    <li>Show translate keys
       <ul>
         <li>Mostramos la traduccion</li> 
         <li>Preguntamos al usuario si quiere volver a traducir, la respuesta se almacena en una variable "resp": while resp='S' || resp='s' && resp!='N'</li><br>
       </ul> 
    </li>
  </ol>
  
<img src="MsemiV9qW-clipboard.png"</img>
  <span style="color: green">Ejecucion del programa en Java:</span><br>
  
  <img src="bHPMj_NKa-clipboard.png"</img>
  
  <br>
  El programa en sí es fácil de de entender pero no es fácil de desarrollar en lenguaje de bajo nivel porque se necesitan muchas más instrucciones ya que existe una correspondencia mas directa entre una instruccion en ensamblador y una en lenguaje maquina, dichas instrucciones se pueden resumir en muy pocas líneas de código como podemos observar en Java. El manejo de los vectores y de las variables es muy sencillo en cuanto a lenguajes de alto nivel, en Ensamblador necesitas un buen conocimiento de las distintas interrupciones que se pueden dar a nivel máquina, los registros, el paso de dirección a memoria o de memoria a dirección, el tamaño de bits por registro a usar, cómo recorrer los vectores y saberse el uso de cada uno de los registros especiales, así como acceder a los distintos valores de un vector y poder compararlos entre sí o con otro registro o valor. <br></strong><br><br>
  
 
  
  <strong style="font-size: 15px"></strong><br>
  
  <ol style="list-style-type: decimal">
    <li style="font-size: 15px; font-width: bold"><strong>Declaracion de Constantes,variables, macros e implementacion de funciones</strong>
      <ol>
        <li><span style="color:blue">Constantes:
          <ul>
            <li><img src="XemhKvMLU-clipboard.png"></img></li>
        <li><img src="4GCd1Bw2V-clipboard.png"</li>
        <li><img src="D6DuWGVnj-clipboard.png"</img></li>
          </ul>
        </li> 
        <li><span style="color:blue">Variables
            <ul>
              <li><img src="eLP0hj3S_-clipboard.png"</img></li>
              <li><img src="-9NXUN3WA-clipboard.png"</img></li>     
          </ul>
          
        </li>
    
       <li><span style="color:blue">Macros: Son basicamente procedimientos ya que son funciones que reciben parametros pero que no devuelven nada. 
           <ul>
             <li><img src="l77piYo_M-clipboard.png"</img></li>
           </ul>  
         
         
         
      </li>
      <li><span style="color:blue">Funciones
          <ul>
            <li><img src="IF_sDuo8i-clipboard.png"</img></li>
            
        </ul>
     </li>
      </ol>  
      
    </li>
  
  </ol><br>
  
  
  <ol style="list-style-type: decimal">
    <li style="font-size: 15px; font-width: bold"><strong>Explicacion del codigo. Mi codigo se estructura en 4 partes: </strong>
      <ol>
        <li><span style="color:blue">Fill Array</span>
         <ul>
          <li>Primero he creado un vector de tamaño 10 que almacene cada una de las distintas claves(vKeys).</li>
          <li>He creado un bucle para recorrer el vector e ir introduciendo las distintas claves por cada posición del vector, cada vez que se introduce una clave se llama a la función <strong>showIntro</strong>, la cual nos muestra <i>"Introduce el contenido de la posición i: "</i>  para que así introduzcamos la clave, dicha clave siempre que se introduce se almacena en dos registros al y bl, de manera que el registro bl es el registro comparador, gracias a la función <strong>verify</strong>, comparamos dicho registro bl con las claves anteriores del vector pero para ello primero inicializamos un registro contador ecx, el cual se incrementa siempre que iteramos por cada comparación del valor del registro bl con los elementos que ocupan posiciones anteriores del array llamando así a la función <strong>incrementIndex</strong> el cual incrementa el registro contador ecx siempre y cuando el total de iteraciones sea inferior al tamaño del vector, en caso contrario y no se encuentre un duplicado de la nueva clave introducida se llama a la función <strong>fill</strong>, la cual nos permite almacenar la nueva clave alamcenada en el registro bl en el vector e inmediatamente incrementamos los registros edi(registro de control de puntero), esi(registro que almacena la direccion del vector) y el registro índice que almacena la posición actual para así poder visualizarlo en pantalla y de esa manera saber por qué posición vamos. Almacenamos tantas veces como indica el tamaño del array. </li>
          </ul>
           </li>
        <li><span style="color:blue">Enter the array Numbers</span>
        <ul>
          <li>Una vez rellenado el array con las distintas claves de traducción, procedemos a introducir valores numéricos en el nuevo array de números gracias al bucle <strong>ciclo_lectura</strong> para luego traducir cada uno de los valores con sus correspondientes claves almacenadas anteriormente en el array</li>
          <li>Después de haber rellenado el array de números a traducir a sus correspondientes claves llamamos a la función <strong>translateKey</strong>, la cual con el bucle <strong>ciclo_impresion</strong> recorre el array de números a traducir, entonces cada elemento iterado del array lo almacenamos en el registro al para tranformarlo en caracter con la instrucción <code>add al, 17</code> de manera que el elemento 0 en ascii sería el número 65 que corresponde a la A y así sucesivamente.<br>
          Por cada elemento iterado y traducido lo mostramos por pantalla en su correspondiente ubicación en fila y columna</li>
       </ul>
       </li>
        <li><span style="color:blue">Continue?</span>
       <ul>
         <li>Preguntamos al usuario si quiere volver a traducir, la respuesta se almacena en una variable "resp": comparamos su respuesta con 'S' || 's' && 'N' y segun haya introducido terminaría el programa o seguiría traduciendo</li><br>
       </ul>
     
       </li>
        </ol>
      </li>
  </ol>
  
  
   <strong><a style="color:green; font-size:25px; margin:0" href="#1">3. Codigo</a></strong>

<p id="Codigo">
  <img src="EjSUi2o2L-clipboard.png"></img>  
  
  
  </p><br>
  
    <strong><a style="color:green; font-size:25px; margin:0" href="#1">4. Datos de Prueba</a></strong><br>

<p id="Prueba">
  
  <img src="s4O6P2c8R-clipboard.png"></img>
  
    <img src="5UE9eB0Dw-clipboard.png"></img>
  
<img src="8UZhCrtwh-clipboard.png"></img>  
  </p><br>
  
   <strong><a style="color:green; font-size:25px; margin:0" href="#1">5. Bibliografía</a></strong>

<p id="Bibliografia">
<strong>Para realizar dicha práctica he hecho un curso de lenguaje ensamblador en este enlace de Youtube</strong><br>
  <em>Haz click</em>
  
  <a href="https://www.youtube.com/watch?v=oLsk9J_mViE&list=PLZw5VfkTcc8Mzz6HS6-XNxfnEyHdyTlmP&ab_channel=NEOMATRIX"><img src="https://img.shields.io/badge/youtube-%23FF0000.svg?&style=for-the-badge&logo=youtube&logoColor=white"></a>

  <br><strong>Y he acudido a la documentación del Campus Virtual</strong> 
  </p><br>
  
  <strong><a style="color:green; font-size:25px; margin:0" href="#1">6. Opinión</a></strong>

<p id="Opinion">
  <strong>En cuanto a mi opinión personal, esta práctica es fácil de entender debido a los antecedentes con CODE2 pero ha sido tedioso el tener que lidiar con el recorrido del vector, el tener que asegurarnos que no haya duplicados en el vector. En varias ocasiones cometía varios errores en cuanto al uso de registros, la asignación inmediata y directa, los bits de cada registro, etc.. Uno de los grandes problemas fue el controlar que no haya duplicados porque en principio solo me funcionaba para las dos primeras claves pero luego me permitía el almacenamiento de duplicados cosa que corregí porque me di cuenta que no hacía bien el salto a la función que incrementaba el registro contador ecx que es el que nos permitía pasar de una clave a otra anterior controlando que dicho registro no supere el tope que el tamaño del array de claves y así poder compararla con la clave actual. Otro problema fue el tener que realizar una correcta traducción ya que no convertía correctamente cada uno de los elementos del nuevo vector de números a traducir a su correspondiente clave debido al mala conversión de dichos elementos.</strong> 
  </p><br>