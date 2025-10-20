import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { UserEntity } from 'src/entities/user.entity';
import { Repository } from 'typeorm';

@Injectable()
export class TipoClienteService {
    constructor(
        @InjectRepository(UserEntity)
        private readonly repository: Repository<UserEntity>,
    ) {}
    async verificarExistenciaById(id: number): Promise<boolean> {
        const tipoCliente = await this.repository.findOne({
            where: { id },
        });
        if (!tipoCliente) {
            return false;
        }
        return true;
    }
}
