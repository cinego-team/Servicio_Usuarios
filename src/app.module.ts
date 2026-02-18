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
import { ConfigModule } from '@nestjs/config';


@Module({
    imports: [
        ConfigModule.forRoot({
            isGlobal: true,
        }),
        TypeOrmModule.forRoot({
            type: 'postgres',
            host: 'localhost',
            port: +process.env.PUERTO_BD,
            database: process.env.PG_DATABASE_MS_USUARIOS,
            username: process.env.PG_USERNAME,
            password: process.env.PG_PASSWORD,
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
