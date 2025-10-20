import { Column, Entity, ManyToOne } from 'typeorm';
import { UserEntity } from './user.entity';

@Entity('venta')
export class VentaEntity {
    @Column()
    id: number;
    @ManyToOne(() => UserEntity, (user) => user.ventas)
    cliente: UserEntity;
}
