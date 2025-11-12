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

@Entity('roles')
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
    @JoinColumn({ name: 'tipo_cliente' })
    tipoCliente: TipoClienteEntity | null;

    @ManyToMany(() => PermissionEntity)
    @JoinTable({
        name: 'roles_permissions',
        joinColumn: { name: 'role_id', referencedColumnName: 'id' },
        inverseJoinColumn: { name: 'permission_id', referencedColumnName: 'id' },
    })
    permissions: PermissionEntity[];

    getPermissionCodes(): string[] {
        return this.permissions?.map((p) => p.code) || [];
    }
}
