const db = require("../../database");
const query = require("../../database/querys/request");

module.exports = {
  getMyRequests: async (req, res) => {
    const { id } = req.user;

    const rows = await db.query(query.getMyRequests, [id]);

    return res.status(200).json({ data: rows, message: "My requests" });
  },
  getMyRequestsDetails: async (req, res) => {
    const { id } = req.params;
    const rows = await db.query(query.getMyRequestsDetails, [id]);
    if (rows.length > 0) {
      res.status(200).json({ data: rows, message: "My requests details" });
    } else {
      res.status(400).json({ data: null, message: "Not found requests" });
    }
  },
  getRequestAdmin: async (req, res) => {
    const rows = await db.query(query.getRequestAdmin);

    res.status(200).json({ data: rows, message: "Requests admin" });
  },
  getRequestsDetailsAdmin: async (req, res) => {
    const { id } = req.params;

    const rows = await db.query(query.getRequestsDetailsAdmin, [id]);

    if (rows.length > 0) {
      res.status(200).json({ data: rows, message: "Requests details admin" });
    } else {
      res.status(400).json({ data: null, message: "Not found requests" });
    }
  },
  executeApprovedRequest: async (req, res) => {
    const { id } = req.params;

    const { observaciones } = req.body;

    await db.query(query.approvedRequest, [observaciones, id]);

    res.status(200).json({ data: null, message: "Request Updated" });
  },
  executeRejectedRequest: async (req, res) => {
    const { id } = req.params;

    const { observaciones } = req.body;

    await db.query(query.rejectedRequest, [observaciones, id]);

    res.status(200).json({ data: null, message: "Request Updated" });
  },
  changeStatusToSlope: async (req, res) => {
    const { id } = req.params;

    await db.query(query.updateStatusRequest, [id]);

    res.status(200).json({ data: null, message: "Updated requet's status" });
  },
};
