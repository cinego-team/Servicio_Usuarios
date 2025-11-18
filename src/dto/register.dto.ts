import { IsString, Matches } from 'class-validator';

export class RegisterDTO {
    nombre: string;
    apellido: string;
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
    nroTelefono: string;
}
