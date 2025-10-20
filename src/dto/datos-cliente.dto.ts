export class DatosClienteDTO {
    id: number;
    nombre: string;
    apellido: string;
    email: string;
    fechaNacimiento: Date;
    nroTelefono: string;
    tipoCliente: {
        denominacion: string;
        descripcion: string;
    };
}
