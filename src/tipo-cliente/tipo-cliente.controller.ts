import {
    Controller,
    Get,
    Param,
    Put,
    Post,
    Delete,
    Body,
    ParseIntPipe,
} from '@nestjs/common';
import { TipoClienteService } from './tipo-cliente.service';
import { TipoClienteInput } from '../dto/tipo-cliente.dto';

@Controller('tipo-cliente')
export class TipoClienteController {
    constructor(private readonly tipoClienteService: TipoClienteService) {}

    @Get('validar-existencia/:id')
    verificarExistenciaById(@Param('id', ParseIntPipe) id: number) {
        return this.tipoClienteService.verificarExistenciaById(id);
    }

    @Get('admin/all')
    getAllTipoClientes() {
        return this.tipoClienteService.getAllTipoClientes();
    }

    @Get('admin/:id')
    getTipoClienteById(@Param('id', ParseIntPipe) id: number) {
        return this.tipoClienteService.getTipoClienteById(id);
    }

    @Delete('admin/:id')
    deleteTipoCliente(@Param('id', ParseIntPipe) id: number) {
        return this.tipoClienteService.deleteTipoCliente(id);
    }

    @Post('admin/new')
    createTipoCliente(@Body() createTipoClienteDto: TipoClienteInput) {
        return this.tipoClienteService.createTipoCliente(createTipoClienteDto);
    }

    @Put('admin/:id')
    updateTipoCliente(
        @Param('id', ParseIntPipe) id: number,
        @Body() updateTipoClienteDto: TipoClienteInput,
    ) {
        return this.tipoClienteService.updateTipoCliente(
            id,
            updateTipoClienteDto,
        );
    }
}
