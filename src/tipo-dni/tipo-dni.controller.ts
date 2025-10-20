import { Controller } from '@nestjs/common';
import { TipoDniService } from './tipo-dni.service';

@Controller('tipo-dni')
export class TipoDniController {
  constructor(private readonly tipoDniService: TipoDniService) {}
}
