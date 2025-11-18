import { IsEmail, IsNotEmpty } from 'class-validator';
export class LoginDTO {
    @IsEmail({}, { message: 'Email inválido.' })
    email: string;

    @IsNotEmpty({ message: 'La contraseña es obligatoria.' })
    password: string;
}
