module.exports = {
    updateUser: "UPDATE usuarios SET ? WHERE id = ?"
    ,
    getUser: "SELECT id, nombres, apellidos, password, foto, tipo_usuario FROM usuarios WHERE email = ?"
    ,
    insertUser: "INSERT INTO usuarios SET ?"
}