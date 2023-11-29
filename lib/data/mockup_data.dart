import '../models/models.dart';

List<Publication> allPublicationsMockup = [
  Publication(
    name: 'Miguel Aladrén Castillo',
    collection: 'Star Wars',
    price: '24.50',
    editorial: 'Altaya',
    tome: '2',
    date: 'Diciembre',
    owned: false,
  ),
  Publication(
    name: 'Es un niño bonito',
    collection: 'Titanes sensuales',
    price: '19.75',
    editorial: 'Salvat',
    tome: '1',
    owned: true,
  ),
];


//R- Libro / Comic
//R- Nombre de libro / comic / guía
//R- Universo (ej. Star Wars, Warhammer, LotR...) -- información de las ya creadas
// Colección / Serie (ej. Las aventuras de Darth Vader, Orus era el bueno, Sam es racista universo 3) -- información de las ya creadas
// Tomo en la colección (I, II, III...)
// Editorial
// Encuadernación - Tapa dura / blanda
// Fecha de compra
// Fecha de lanzamiento
// Cronología dentro de la historia del universo (incluso diferentes colecciones)
// Precio
// Lo tengo? 

// -----------------------
// Historico:
// Universo X
//  - Colección Y
//  - - Tomo I. Nombre de libro
//  - - Tomo II. Nombre de libro
//  - - Tomo III. Nombre de libro
//  - - Tomo IV. Nombre de libro
// -----------------------

// Otra pantalla (detalles de Universo X)
// Universo X:
// Ordenar por cronología:
//  - - Tomo III. Nombre de libro
//  - - Tomo I. Nombre de libro
//  - - Tomo II. Nombre de libro
//  - - Tomo IV. Nombre de libro


// Ejemplo:

// Libro
// Convergencia
// Star Wars 
// The High Republic
// (Tomo automáticamente en base al anterior)
// Planeta libros
// Tapa dura
// 02 Diciembre 2023
// Noviembre 2023
// 22 €
// Lo tengo / no lo tengo