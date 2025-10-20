import { Module } from "@nestjs/common";
import { AppController } from "./app.controller";
import { TypeOrmModule } from "@nestjs/typeorm";
import { AuthGuard } from "./middlewares/auth.middleware";
import { JwtService } from "./jwt/jwt.service";
import { UsersController } from "./users/users.controller";
import { UsersService } from "./users/users.service";
import { UsersModule } from "./users/users.module";
import { PermissionsModule } from "./permissions/permissions.module";
import { RolesModule } from "./roles/roles.module";
import { JwtModule } from "./jwt/jwt.module";
import { PermissionEntity } from "./entities/permissions.entity";
import { RoleEntity } from "./entities/role.entity";
import { UserEntity } from "./entities/user.entity";
import { TipoDniEntity } from "./entities/tipoDni.entity";
import { VentasModule } from './ventas/ventas.module';
import { TipoDniModule } from './tipo-dni/tipo-dni.module';
import { TipoClienteModule } from './tipo-cliente/tipo-cliente.module';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: "postgres",
      host: "localhost",
      port: 5432,
      database: "tp_jwt",
      username: "postgres",
      password: "mipassword",
      synchronize: true,
      entities: [PermissionEntity, RoleEntity, UserEntity, TipoDniEntity],
    }),
    UsersModule,
    PermissionsModule,
    RolesModule,
    JwtModule,
    VentasModule,
    TipoDniModule,
    TipoClienteModule,
  ],
  controllers: [AppController, UsersController],
  providers: [AuthGuard, JwtService, UsersService],
})
export class AppModule {}
