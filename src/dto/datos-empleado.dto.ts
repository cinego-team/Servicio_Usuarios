export class DatosEmpleadoDTO {
    id: number;
    nombre: string;
    apellido: string;
    email: string;
    fechaNacimiento: Date;
    nroTelefono: string;
    legajo: number;
    role: {
        id: number;
        name: string;
    };
    permissions: {
        id: number;
        code: string;
    }[];
}
