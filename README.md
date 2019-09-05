# unla-bd1
Terminal Automotriz

//CONSIGNA//
Trabajo práctico integrador: Terminal automotriz 
Una empresa terminal automotriz (fábrica de automóviles) nos contrató para informatizar su negocio. Las operaciones de la misma se desarrollan de la siguiente manera: La terminal se dedica a ensamblar automóviles, es decir, compra las distintas autopartes (motor, llantas, neumàticos, puertas, etc) a distintos proveedores y con las mismas procede al pintado, armado y prueba del vehìculo. 
En una línea de montaje se fabrica un sólo modelo de vehículo, la fábrica tiene tantas líneas de montaje como modelos de vehículos se fabrican; también se conoce la capacidad productiva promedio de cada línea de montaje (en vehículos por mes). 
Cada una de las líneas de montaje se compone de varias estaciones de trabajo según requiera cada modelo. En cada estación se realiza una única tarea determinada, como por ejemplo: pintura, ensamblado de chapa, mecànica motor, mecànica rodaje, electricidad y prueba, donde en estas tareas se consume una serie de insumos, los que son provistos por distintas empresas. Se sabe qué cantidad de estos insumos se necesita para cada modelo de vehículo (litros de pintura, metros de cable, cubiertas, lámparas, etc) Una empresa proveedora puede fabricar más de un insumo y para más de una estación. Ademàs, un mismo insumo puede ser provisto por más de una empresa. 
En el momento en que se inicia la producción se asigna a cada automòvil un nùmero de chasis que lo identifica. Se registra la fecha y hora en que el vehículo ingresa y egresa de cada estación, a fin de conocer el tiempo que tardó en producirse un vehìculo completo y poder llevar estadísticas de productividad de cada estación y cada lìnea de montaje. 
La empresa trabaja del modo determinado “Justo a tiempo” (just in time). Esto implica que no mantiene grandes stocks de las partes necesarias para fabricar un vehìculo, sino que realiza los pedidos sus proveedores con una frecuencia semanal. 
La terminal cuenta con una serie de empresas concesionarias, que son las que se dedican a vender los vehìculos fabricados. Estas concesionarias reportan a la terminal las ventas realizadas y la terminal les informa la fecha de entrega esperada. Esta fecha de entrega dependerá de la cantidad de pedidos que la empresa tenga a la fecha y de la capacidad de producciòn de cada lìnea de montaje más una semana por cualquier imprevisto. 
Cada insumo de producción tiene un código que lo identifica, una descripción y un precio. El precio lo fija cada uno de los proveedores, con lo cual de acuerdo al proveedor el mismo insumo puede tener diferente precio. 
Licenciatura en Sistemas - Bases de Datos 1 - 2019 
Titular: Ing. Federico Ribeiro fribeirounla@gmail.com 
Primera etapa 

1) Diagrama Entidad Relación (DER) del modelo de datos que representa formalmente 
lo expuesto en el punto (1) 
2) Script SQL de creación de la base de datos en MySQL. 
3) Construcción Stored Procedures para el Alta, la Baja y la Modificación de las 
entidades principales. 
4) Construccion de Stored Proedurs con logica de negocio relacionada con algunas de 
las entidades (segun se desprenda del analisis del enunciado) 
