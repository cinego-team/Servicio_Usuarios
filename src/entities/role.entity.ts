import {
    Column,
    Entity,
    JoinColumn,
    JoinTable,
    ManyToMany,
    OneToMany,
    OneToOne,
    PrimaryGeneratedColumn,
} from 'typeorm';
import { PermissionEntity } from './permissions.entity';
import { UserEntity } from './user.entity';
import { TipoClienteEntity } from './tipoCliente.entity';

@Entity('role')
export class RoleEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ unique: true })
    name: string;

    @OneToMany(() => UserEntity, (user) => user.role)
    users: UserEntity[];

    @OneToOne(() => TipoClienteEntity, (tipoCliente) => tipoCliente.role, {
        nullable: true,
    })
    @JoinColumn()
    tipoCliente: TipoClienteEntity | null;

    @ManyToMany(() => PermissionEntity)
    @JoinTable()
    permissions: PermissionEntity[];

    getPermissionCodes(): string[] {
        return this.permissions?.map((p) => p.code) || [];
    }
}
