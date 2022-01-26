const db = require("../../database/index");
const query = require("../../database/querys/event");

module.exports = {
  getEvents: async (req, res) => {
    const events = await db.query(query.getEvents);

    res.status(200).json({ data: events, message: "Event list" });
  },
  getEventDetails: async (req, res) => {
    const { id } = req.params;

    const rows = await db.query(query.getEventDetails, [id]);

    if (rows.length > 0) {
      res.status(200).json({ event: rows, message: "Event details" });
    } else {
      res.status(400).json({ data: null, message: "Not found events" });
    }
  },
  executeInscription: async (req, res) => {
    const { id } = req.params;

    const { certificado, voucher } = req.body;

    let row = await db.query(query.getInscribed, [id]);

    const inscribed = row[0].Inscritos;

    row = await db.query(query.getParticipants, [id]);

    const participants = row[0].Participantes;

    if (inscribed + 1 == participants) {
      await db.query(query.updateStatusToComplete, [id]);
    }

    const inscription = {
      id_evento: id,
      id_usuario: req.user.id,
      certificado,
      voucher,
    };

    await db.query(query.insertInscription, [inscription]);

    res
      .status(200)
      .json({ data: null, message: "Inscription Registered to this event" });
  },
  getMyEvents: async (req, res) => {
    const { id } = req.user;

    const closeOnes = await db.query(query.getMyEvents, [id]);

    res.status(200).json({ data: closeOnes, message: "My events" });
  },
  executeEventRegister: async (req, res) => {
    const id_coordinador = req.user.id;

    const {
      titulo,
      tipo_coordinador,
      nombre_coordinador,
      tipo_evento,
      fecha_inicio,
      fecha_fin,
      hora_inicio,
      duracion,
      tipo_inscripcion,
      precio_inscripcion,
      descripcion,
      tipo_certificado,
      precio_certificado,
      tipo_ambiente,
      participantes,
      logo,
    } = req.body;

    const newEvent = {
      titulo,
      tipo_coordinador,
      nombre_coordinador,
      id_coordinador,
      tipo_evento,
      fecha_inicio,
      fecha_fin,
      hora_inicio,
      duracion,
      tipo_inscripcion,
      precio_inscripcion,
      descripcion,
      tipo_certificado,
      precio_certificado,
      tipo_ambiente,
      participantes,
      logo,
    };

    const result = await db.query(query.insertEvent, [newEvent]);

    const codigoRequest = "FISI2022-" + result.insertId;

    const newRequest = {
      id: null,
      codigo: codigoRequest,
      estado: 3,
      id_evento: result.insertId,
    };

    await db.query(query.insertRequest, [newRequest]);

    res
      .status(200)
      .json({ data: null, message: "Event Registered and Request Created" });
  },
  getEventsByPrices: async (req, res) => {
    const { p1, p2 } = req.params;

    const rows = await db.query(query.getEventsByPrices, [p1, p2]);

    return res.status(200).json({ data: rows, message: "Events by prices" });
  },
  getEventsByCategory: async (req, res) => {
    const { category } = req.params;

    const rows = await db.query(query.getEventsByCategory, [category]);

    res.status(200).json({ data: rows, message: "Events by category" });
  },
};
