import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TipoClienteEntity } from '../entities/tipoCliente.entity';
import { Repository } from 'typeorm';
import { TipoClienteInput, TipoClienteOutput } from '../dto/tipo-cliente.dto';
import { NotFoundException } from '@nestjs/common/exceptions/not-found.exception';

@Injectable()
export class TipoClienteService {
    constructor(
        @InjectRepository(TipoClienteEntity)
        private readonly repository: Repository<TipoClienteEntity>,
    ) { }
    async verificarExistenciaById(id: number): Promise<boolean> {
        const tipoCliente = await this.repository.findOne({
            where: { id },
        });
        if (!tipoCliente) {
            return false;
        }
        return true;
    }
    async getTipoClienteById(id: number): Promise<TipoClienteOutput> {
        const tipoCliente = await this.repository.findOne({
            where: { id },
        });

        if (!tipoCliente) {
            throw new NotFoundException('Tipo de cliente no encontrado');
        }

        return {
            id: tipoCliente.id,
            denominacion: tipoCliente.denominacion,
            descripcion: tipoCliente.descripcion,
        };
    }
    async getAllTipoClientes(): Promise<TipoClienteOutput[]> {
        const tipos = await this.repository.find();
        return tipos.map((tc) => ({
            id: tc.id,
            denominacion: tc.denominacion,
            descripcion: tc.descripcion,
        }));
    }
    async createTipoCliente(
        datos: TipoClienteInput,
    ): Promise<TipoClienteOutput> {
        console.log('DATOS RECIBIDOS:', datos);

        const nuevoTipo = this.repository.create({
            denominacion: datos.denominacion,
            descripcion: datos.descripcion,
        });

        const guardado = await this.repository.save(nuevoTipo);

        return {
            id: guardado.id,
            denominacion: guardado.denominacion,
            descripcion: guardado.descripcion,
        };
    }
    async updateTipoCliente(
        id: number,
        datos: TipoClienteInput,
    ): Promise<TipoClienteOutput> {
        const tipoCliente = await this.repository.findOne({
            where: { id },
        });

        if (!tipoCliente) {
            throw new NotFoundException('Tipo de cliente no encontrado');
        }

        tipoCliente.denominacion = datos.denominacion;
        tipoCliente.descripcion = datos.descripcion;

        const actualizado = await this.repository.save(tipoCliente);

        return {
            id: actualizado.id,
            denominacion: actualizado.denominacion,
            descripcion: actualizado.descripcion,
        };
    }
    async deleteTipoCliente(id: number): Promise<void> {
        const result = await this.repository.delete(id);

        if (result.affected === 0) {
            throw new NotFoundException('Tipo de cliente no encontrado');
        }
    }
}
