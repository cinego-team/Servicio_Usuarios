import { Module } from '@nestjs/common';
import { RolesService } from './roles.service';
import { RolesController } from './roles.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { RoleEntity } from '../entities/role.entity';
import { JwtModule } from '../jwt/jwt.module';
import { UsersModule } from '../users/users.module';

@Module({
    imports: [TypeOrmModule.forFeature([RoleEntity]), JwtModule, UsersModule],
    controllers: [RolesController],
    providers: [RolesService],
    exports: [RolesService],
})
export class RolesModule { }
