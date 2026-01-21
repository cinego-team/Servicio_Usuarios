import { IsNotEmpty, IsString, MaxLength } from 'class-validator';

export class TipoClienteInput {
    @IsString()
    @IsNotEmpty()
    @MaxLength(100)
    denominacion: string;

    @IsString()
    @IsNotEmpty()
    @MaxLength(255)
    descripcion: string;
}
export class TipoClienteOutput {
    id: number;
    denominacion: string;
    descripcion: string;
}
