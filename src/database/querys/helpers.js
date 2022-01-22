module.exports = {
    getUser: "SELECT id, tipo_usuario FROM usuarios WHERE id = ?"
    ,
    getUserData: "SELECT id, nombres, apellidos, edad, celular, sexo, ocupacion, tipo_usuario, foto FROM usuarios WHERE id = ?"
    ,
    getUserId: "SELECT id_usuario FROM inscripciones WHERE id_evento = ? AND id_usuario = ?"
}