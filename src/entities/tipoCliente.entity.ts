import { Column, Entity, OneToOne, PrimaryGeneratedColumn } from 'typeorm';
import { RoleEntity } from './role.entity';

@Entity('tipoCliente')
export class TipoClienteEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ unique: true })
    denominacion: string;

    @Column()
    descripcion: string;

    @OneToOne(() => RoleEntity, (role) => role.tipoCliente)
    role: RoleEntity;
}
