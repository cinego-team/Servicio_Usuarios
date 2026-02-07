import { Module } from '@nestjs/common';
import { TipoClienteService } from './tipo-cliente.service';
import { TipoClienteController } from './tipo-cliente.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UserEntity } from '../entities/user.entity';
import { UsersModule } from '../users/users.module';
import { TipoClienteEntity } from '../entities/tipoCliente.entity';

@Module({
    controllers: [TipoClienteController],
    providers: [TipoClienteService],
    imports: [TypeOrmModule.forFeature([UserEntity, TipoClienteEntity]), UsersModule]
})
export class TipoClienteModule { }
