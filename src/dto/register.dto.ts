import {
    IsString,
    Matches,
    IsEmail,
    IsNotEmpty,
    MinLength,
} from 'class-validator';

export class RegisterDTO {
    @IsNotEmpty({ message: 'El nombre es obligatorio.' })
    @MinLength(2, { message: 'El nombre debe tener al menos 2 caracteres.' })
    nombre: string;
    @IsNotEmpty({ message: 'El apellido es obligatorio.' })
    @MinLength(3, { message: 'El apellido debe tener al menos 3 caracteres.' })
    apellido: string;
    @IsNotEmpty({ message: 'El email es obligatorio.' })
    @IsEmail({}, { message: 'Email inválido.' })
    email: string;
    @IsString()
    // 1) Sin espacios al inicio ni al final (equivale a password !== password.trim())
    @Matches(/^\S.*\S$/, {
        message: 'La contraseña no puede tener espacios al inicio ni al final',
    })
    // 2) Mismo regex que tu función: mayúscula, número, especial, mínimo 8
    @Matches(/^(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9]).{8,}$/, {
        message:
            'La contraseña debe tener al menos 8 caracteres, una mayúscula, un número y un carácter especial',
    })
    contrasena: string;
    dd: number;
    mm: number;
    aaaa: number;
    @IsNotEmpty({ message: 'El teléfono es obligatorio.' })
    nroTelefono: string;
}
