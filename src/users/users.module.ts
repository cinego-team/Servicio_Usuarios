import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UsersController } from './users.controller';
import { UsersService } from './users.service';
import { JwtService } from '../jwt/jwt.service';
import { UserEntity } from '../entities/user.entity';
import { RolesService } from 'src/roles/roles.service';
import { RoleEntity } from 'src/entities/role.entity';

@Module({
    imports: [
        TypeOrmModule.forFeature([UserEntity]),
        TypeOrmModule.forFeature([RoleEntity]),
    ],
    controllers: [UsersController],
    providers: [UsersService, JwtService, RolesService],
    exports: [UsersService],
})
export class UsersModule {}
