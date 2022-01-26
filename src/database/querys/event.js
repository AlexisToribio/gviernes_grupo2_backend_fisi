module.exports = {
  getEvents:
    "SELECT e.id,e.logo, e.titulo, DATE_FORMAT(e.fecha_inicio, '%W, %d de %b del %Y') AS " +
    "fecha_inicio, DATE_FORMAT(e.hora_inicio, '%h:%i %p') AS hora_inicio, e.precio_inscripcion " +
    "FROM eventos AS e JOIN solicitudes AS s ON e.id = s.id_evento WHERE fecha_inicio > NOW() " +
    "AND s.estado = 2",
  getEventDetails:
    "SELECT e.logo AS logo, e.titulo, tco.descripcion AS tipo_coordinador, e.nombre_coordinador, " +
    "DATE_FORMAT(e.fecha_inicio, '%d/%m/%Y') AS fecha_inicio, DATE_FORMAT(e.hora_inicio, '%h:%i %p') " +
    "AS hora_inicio, e.participantes, ti.descripcion AS tipo_inscripcion,ta.descripcion AS tipo_ambiente, " +
    "e.precio_inscripcion, tc.descripcion AS tipo_certificado, e.precio_certificado, e.descripcion AS " +
    "descripcion_evento, u.foto AS foto_coordinador, e.nombre_coordinador FROM eventos AS e JOIN usuarios " +
    "AS u ON e.id_coordinador = u.id JOIN tipos_coordinador AS tco ON tco.id = e.tipo_coordinador JOIN " +
    "tipos_inscripcion AS ti  ON ti.id = e.tipo_inscripcion JOIN tipos_certificado AS tc ON tc.id = e.tipo_certificado " +
    "JOIN tipos_ambiente AS ta ON ta.id = e.tipo_ambiente JOIN solicitudes AS s ON s.id_evento = e.id WHERE e.id = ? AND s.estado = 2",
  insertInscription: "INSERT INTO inscripciones SET ?",
  getMyEvents:
    "SELECT e.id, e.titulo,e.logo as logo, DATE_FORMAT(e.fecha_inicio, '%W, %d de %M del %m') " +
    "AS fecha_inicio, DATE_FORMAT(e.hora_inicio, '%h:%i %p') AS hora_inicio, e.precio_inscripcion " +
    "FROM eventos AS e JOIN inscripciones AS i ON i.id_evento = e.id JOIN usuarios AS u ON i.id_usuario = u.id " +
    "WHERE e.fecha_inicio > NOW() AND u.id = ?",
  insertEvent: "INSERT INTO eventos SET ?",
  insertRequest: "INSERT INTO solicitudes SET ?",
  getEventsByPrices:
    "SELECT e.id,e.logo, e.titulo, DATE_FORMAT(e.fecha_inicio, '%W, %d de %b del %Y') AS " +
    "fecha_inicio, DATE_FORMAT(e.hora_inicio, '%h:%i %p') AS hora_inicio, e.precio_inscripcion " +
    "FROM eventos AS e JOIN solicitudes AS s ON e.id = s.id_evento WHERE fecha_inicio > NOW() AND " +
    "s.estado = 2 AND precio_inscripcion BETWEEN ? AND ?",
  getEventsByCategory:
    "SELECT e.id,e.logo, e.titulo, DATE_FORMAT(e.fecha_inicio, '%W, %d de %b del %Y') AS " +
    "fecha_inicio, DATE_FORMAT(e.hora_inicio, '%h:%i %p') AS hora_inicio, e.precio_inscripcion " +
    "FROM eventos AS e JOIN solicitudes AS s ON e.id = s.id_evento JOIN tipos_evento AS te ON " +
    "e.tipo_evento = te.id WHERE fecha_inicio > NOW() AND s.estado = 2 AND te.descripcion = ?",
  getInscribed:
    "SELECT COUNT(id) AS Inscritos FROM inscripciones WHERE id_evento = ?",
  getParticipants: "SELECT Participantes FROM eventos WHERE id = ?",
  updateStatusToComplete:
    "UPDATE solicitudes SET Estado = 4 WHERE id_evento = ?",
};
