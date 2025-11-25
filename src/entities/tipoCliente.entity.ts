import { Column, Entity, OneToOne, PrimaryGeneratedColumn } from 'typeorm';
import { RoleEntity } from './role.entity';

@Entity('tipo_cliente')
export class TipoClienteEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ type: 'varchar', length: 100 })
    denominacion: string;

    @Column({ type: 'varchar', length: 255 })
    descripcion: string;

    @OneToOne(() => RoleEntity, (role) => role.tipoCliente)
    role: RoleEntity;
}
