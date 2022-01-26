module.exports = {
  getMyRequests:
    "SELECT s.id, s.codigo, e.titulo, DATE_FORMAT(s.fecha_envio, '%d/%m/%Y') AS fecha_envio," +
    "s.estado,e.logo FROM solicitudes AS s JOIN eventos AS e ON s.id_evento = e.id JOIN usuarios " +
    "AS u ON e.id_coordinador = u.id WHERE u.id = ?",
  getMyRequestsDetails:
    "SELECT s.codigo, DATE_FORMAT(s.fecha_envio,'%d/%m/%y') AS fecha_envio, e.titulo, " +
    "tco.descripcion AS tipo_coordinador, e.nombre_coordinador, DATE_FORMAT(e.hora_inicio, '%h:%m %p') " +
    "AS hora_inicio, DATE_FORMAT(e.fecha_inicio,'%d/%m/%y') AS fecha_inicio, DATE_FORMAT(e.fecha_fin,'%d/%m/%y') " +
    "AS fecha_fin, te.descripcion AS tipo_evento, e.descripcion, ti.descripcion AS tipo_inscripcion, " +
    "tc.descripcion AS tipo_certificado, ta.descripcion AS tipo_ambiente, e.participantes, e.duracion , " +
    "e.logo, s.observaciones FROM eventos AS e JOIN solicitudes AS s ON e.id = s.id_evento JOIN " +
    "tipos_coordinador AS tco ON tco.id = e.tipo_coordinador JOIN tipos_evento AS te ON " +
    "te.id = e.tipo_evento JOIN tipos_inscripcion AS ti ON ti.id = e.tipo_inscripcion JOIN " +
    "tipos_certificado AS tc ON tc.id = e.tipo_certificado JOIN tipos_ambiente AS ta ON " +
    "ta.id = e.tipo_ambiente WHERE s.id = ?",
  getRequestAdmin:
    "SELECT s.id, s.codigo, e.titulo, DATE_FORMAT(s.fecha_envio, '%d/%m/%Y') AS fecha_envio " +
    "FROM solicitudes AS s JOIN eventos AS e ON s.id_evento = e.id WHERE s.estado = 3 GROUP BY " +
    "s.fecha_envio",
  getRequestsDetailsAdmin:
    "SELECT s.codigo, DATE_FORMAT(s.fecha_envio,'%d/%m/%y') AS fecha_envio, e.titulo, " +
    "tco.descripcion AS tipo_coordinador, e.nombre_coordinador, DATE_FORMAT(e.hora_inicio,'%h:%i %p') " +
    "AS hora_inicio, DATE_FORMAT(e.fecha_inicio,'%d/%m/%y') AS fecha_inicio, DATE_FORMAT(e.fecha_fin,'%d/%m/%y') " +
    "AS fecha_fin, te.descripcion AS tipo_evento, e.descripcion, ti.descripcion AS tipo_inscripcion, tc.descripcion " +
    "AS tipo_certificado, ta.descripcion AS tipo_ambiente, e.participantes, e.duracion, e.logo FROM eventos AS e " +
    "JOIN solicitudes AS s ON e.id = s.id_evento JOIN tipos_coordinador AS tco ON tco.id = e.tipo_coordinador " +
    "JOIN tipos_evento AS te ON te.id = e.tipo_evento JOIN tipos_inscripcion AS ti ON ti.id = e.tipo_inscripcion " +
    "JOIN tipos_certificado AS tc ON tc.id = e.tipo_certificado JOIN tipos_ambiente AS ta ON ta.id = e.tipo_ambiente " +
    "WHERE s.id = ? AND s.estado = 3",
  approvedRequest:
    "UPDATE solicitudes SET estado = 2, observaciones = ? WHERE id = ?",
  rejectedRequest:
    "UPDATE solicitudes SET estado = 1, observaciones = ? WHERE id = ?",
  updateStatusRequest: "UPDATE solicitudes SET estado = 3 WHERE id_evento = ?",
};
