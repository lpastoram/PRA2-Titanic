# PRA2-Titanic

Laura y Yosry

En esta práctica se elabora un caso práctico orientado a aprender a identificar los datos relevantes para un proyecto analítico y usar las herramientas de integración, limpieza, validación y análisis de las mismas.

# Descripción del dataset

Trabajaremos con el juego de datos de entrenamiento del reto inicial de Kaggle "Titanic: Machine Learning from Disaster". La idea principal es entrenar un modelo predictivo que nos pueda indicar según las características de un pasajero si ha sobrevivido o no al incidente, lo cual es un conjunto interesante para así entrenar diferentes modelos supervisados y seleccionar el más adecuado sobre estos datos.
El conjunto de entrenamiento se compone de los siguientes campos:

 * **passengerId:** Valor numérico que especifica la clave primaria de cada pasajero.
 * **name:** String con el nombre del pasajero.
 * **sex:** Factor con niveles de hombre y mujer (male and female).
 * **age:** Valor numérico con la edad de la persona el día del hundimiento. La edad de los bebés (menores de 12 meses) se da como una fracción de un año (1/mes).
 * **pclass:** Factor que especifica la clase para los pasajeros o el tipo de servicio a bordo para los miembros de la tripulación.
 * **embarked:** Factor con el lugar de embarque de la persona.
 * **cabin:** Factor con el número de cabina de cada persona, si tiene.
 * **ticket:** Valor numérico que especifica el número de billete de la persona (NA para miembros de la tripulación).
 * **fare:** Valor numérico con el precio del billete (NA para tripulantes, músicos y empleados de la empresa astillero)
 * **sibsp:** Factor ordenado especificando el número de hermanos/cónyuges a bordo; adoptado del conjunto de datos de Vanderbild.
 * **parch:** Factor ordenado que especifica el número de padres/hijos a bordo; adoptado del conjunto de datos de Vanderbild.
 * **survived:** Factor con dos niveles (no y sí) que especifica si la persona ha sobrevivido al hundimiento.

Las carpetas contienen lo siguiente:

 * pdf: Contiene un informe donde se explica el desarrollo del trabajo realizado.
 * dataset: Contiene los archivos que contienen los datos prelimpieza y postlimpieza.
 * code: Contiene código creado en R y RMarkdown que limpia y analiza de los datos en cuestión.

