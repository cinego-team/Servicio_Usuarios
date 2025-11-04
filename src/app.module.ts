import { Module } from "@nestjs/common";
import { AppController } from "./app.controller";
import { TypeOrmModule } from "@nestjs/typeorm";
import { UsersModule } from "./users/users.module";
import { PermissionsModule } from "./permissions/permissions.module";
import { RolesModule } from "./roles/roles.module";
import { JwtModule } from "./jwt/jwt.module";
import { PermissionEntity } from "./entities/permissions.entity";
import { RoleEntity } from "./entities/role.entity";
import { UserEntity } from "./entities/user.entity";
import { TipoClienteModule } from './tipo-cliente/tipo-cliente.module';
import { TipoClienteEntity } from "./entities/tipoCliente.entity";

@Module({
    imports: [
        TypeOrmModule.forRoot({
            type: "postgres",
            host: "localhost",
            port: 5432,
            database: "msusuarios",
            username: "postgres",
            password: "grupou",
            synchronize: true,
            entities: [PermissionEntity, RoleEntity, UserEntity, TipoClienteEntity],
        }),
        UsersModule,
        PermissionsModule,
        RolesModule,
        JwtModule,
        TipoClienteModule,
    ],
    controllers: [AppController]
})
export class AppModule { }
