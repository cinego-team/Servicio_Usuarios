import { RoleEntity } from 'src/entities/role.entity';

export interface UserI {
    id: number;
    nombre: string;
    apellido: string;
    fechaNacimiento: Date;
    nroTelefono: string;
    email: string;
    role: RoleEntity;
}
