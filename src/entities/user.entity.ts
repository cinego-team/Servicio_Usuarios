import {
    Column,
    Entity,
    JoinColumn,
    ManyToOne,
    OneToMany,
    PrimaryGeneratedColumn,
} from 'typeorm';
import { RoleEntity } from './role.entity';

@Entity('users')
export class UserEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ type: 'varchar', length: 50 })
    nombre: string;

    @Column({ type: 'varchar', length: 50 })
    apellido: string;

    @Column({ type: 'varchar', length: 100 })
    email: string;

    @Column({ type: 'varchar', length: 255 })
    contrasena: string;

    @Column({ type: 'date' })
    fechaNacimiento: Date;

    // @Column({ type: 'varchar', length: 15, unique: true })
    // nroDni: string;

    @Column({ type: 'varchar', length: 20 })
    nroTelefono: string;

    @Column({ nullable: true })
    legajo: number;

    @ManyToOne(() => RoleEntity, (role) => role.users, { eager: true })
    @JoinColumn({ name: 'roleId' })
    role: RoleEntity;

    // @ManyToOne(() => TipoDniEntity, (tipoDni) => tipoDni.users, { eager: true })
    // @JoinColumn({ name: 'tipoDniId' })
    // tipoDni: TipoDniEntity;
}
