import { Module } from '@nestjs/common';
import { TipoClienteService } from './tipo-cliente.service';
import { TipoClienteController } from './tipo-cliente.controller';

@Module({
  controllers: [TipoClienteController],
  providers: [TipoClienteService],
})
export class TipoClienteModule {}
