import { Controller, Get, Param } from '@nestjs/common';
import { TipoClienteService } from './tipo-cliente.service';

@Controller('tipo-cliente')
export class TipoClienteController {
    constructor(private readonly tipoClienteService: TipoClienteService) {}

    @Get('validar-existencia/:id')
    verificarExistenciaById(@Param('id') id: number) {
        return this.tipoClienteService.verificarExistenciaById(id);
    }
}
