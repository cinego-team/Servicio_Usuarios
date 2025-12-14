import {
    Controller,
    Get,
    Param,
    Put,
    Post,
    Delete,
    Body,
} from '@nestjs/common';
import { TipoClienteService } from './tipo-cliente.service';
import { TipoClienteInput, TipoClienteOutput } from 'src/dto/tipo-cliente.dto';

@Controller('tipo-cliente')
export class TipoClienteController {
    constructor(private readonly tipoClienteService: TipoClienteService) {}

    @Get('validar-existencia/:id')
    verificarExistenciaById(@Param('id') id: number) {
        return this.tipoClienteService.verificarExistenciaById(id);
    }
    @Get(':id/admin')
    getTipoClienteById(@Param('id') id: number) {
        return this.tipoClienteService.getTipoClienteById(id);
    }
    @Get('admin/all')
    getAllTipoClientes() {
        return this.tipoClienteService.getAllTipoClientes();
    }
    @Delete('admin/:id')
    deleteTipoCliente(@Param('id') id: number) {
        return this.tipoClienteService.deleteTipoCliente(id);
    }
    @Post('admin/create')
    createTipoCliente(@Body() createTipoClienteDto: TipoClienteInput) {
        return this.tipoClienteService.createTipoCliente(createTipoClienteDto);
    }
    @Put('admin/update/:id')
    updateTipoCliente(
        @Param('id') id: number,
        @Body() updateTipoClienteDto: TipoClienteInput,
    ) {
        return this.tipoClienteService.updateTipoCliente(
            id,
            updateTipoClienteDto,
        );
    }
}
