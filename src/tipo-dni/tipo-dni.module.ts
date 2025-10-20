import { Module } from '@nestjs/common';
import { TipoDniService } from './tipo-dni.service';
import { TipoDniController } from './tipo-dni.controller';

@Module({
  controllers: [TipoDniController],
  providers: [TipoDniService],
})
export class TipoDniModule {}
