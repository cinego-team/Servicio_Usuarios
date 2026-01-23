import {
    BadRequestException,
    ForbiddenException,
    Injectable,
    InternalServerErrorException,
    NotFoundException,
    UnauthorizedException,
} from '@nestjs/common';
import { LoginDTO } from 'src/dto/login.dto';
import { RegisterDTO } from 'src/dto/register.dto';
import { RegisterEmpleadoDTO } from 'src/dto/register-empleado.dto';
import { UserI } from 'src/dto/user.interface';
import { UserEntity } from '../entities/user.entity';
import { hashSync, compareSync } from 'bcrypt';
import { JwtService } from '../jwt/jwt.service';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { DatosClienteDTO } from 'src/dto/datos-cliente.dto';
import { DatosEmpleadoDTO } from 'src/dto/datos-empleado.dto';

@Injectable()
export class UsersService {
    constructor(
        @InjectRepository(UserEntity)
        private readonly repository: Repository<UserEntity>,
        private readonly jwtService: JwtService,
    ) {}

    async login(loginBody: LoginDTO) {
        const user = await this.repository.findOne({
            where: { email: loginBody.email },
            relations: {
                role: {
                    permissions: true,
                },
            },
        });

        if (!user) {
            throw new NotFoundException('User not found');
        }

        const compareResult = compareSync(loginBody.password, user.contrasena);
        if (!compareResult) {
            throw new UnauthorizedException('Invalid password');
        }

        const payload = {
            sub: user.id.toString(),
            email: user.email,
            role: user.role.name,
            permissions: user.role.permissions.map((p) => p.code),
        };

        return {
            accessToken: this.jwtService.generateToken(payload, 'auth'),
            refreshToken: this.jwtService.generateToken(payload, 'refresh'),
        };
    }

    async register(registerBody: RegisterDTO) {
        const userExists = await this.repository.findOneBy({
            email: registerBody.email,
        });
        if (userExists) {
            throw new BadRequestException('User already exists');
        }

        const roleCliente = await this.repository.findOne({
            where: { id: 2 },
            relations: ['role', 'role.tipoCliente', 'role.permissions'],
        });

        const user = this.repository.create({
            nombre: registerBody.nombre,
            apellido: registerBody.apellido,
            email: registerBody.email,
            contrasena: registerBody.contrasena,
            fechaNacimiento: new Date(
                registerBody.aaaa,
                registerBody.mm - 1,
                registerBody.dd,
            ),
            nroTelefono: registerBody.nroTelefono,
            role: roleCliente,
        });

        user.contrasena = hashSync(user.contrasena, 10);

        await this.repository.save(user);

        return { status: 'created' };
    }

    async registerEmpleado(datosEmpleado: RegisterEmpleadoDTO) {
        const userExists = await this.repository.findOneBy({
            email: datosEmpleado.email,
        });

        if (userExists.role.tipoCliente != null) {
            throw new BadRequestException('El usuario ya está registrado.');
        }
        const roleEmpleado = await this.repository.findOne({
            where: { id: datosEmpleado.roleId },
            relations: ['tipoCliente', 'permissions'],
        });

        const user = this.repository.create({
            nombre: datosEmpleado.nombre,
            apellido: datosEmpleado.apellido,
            email: datosEmpleado.email,
            contrasena: datosEmpleado.contrasena,
            fechaNacimiento: new Date(
                datosEmpleado.aaaa,
                datosEmpleado.mm - 1,
                datosEmpleado.dd,
            ),
            nroTelefono: datosEmpleado.nroTelefono,
            role: roleEmpleado,
        });

        user.contrasena = hashSync(user.contrasena, 10);
        user.legajo = user.id;

        await this.repository.save(user);

        return { status: 'created' };
    }

    async getDatosClienteById(id: number): Promise<DatosClienteDTO> {
        const user = await this.repository.findOne({
            where: { id },
            select: [
                'id',
                'nombre',
                'apellido',
                'email',
                'fechaNacimiento',
                'nroTelefono',
            ],
            relations: ['role', 'role.tipoCliente'],
        });
        if (!user) {
            throw new NotFoundException('No se encontró ningún usuario.');
        }
        if (user.role.tipoCliente == null) {
            throw new BadRequestException('El usuario no es un cliente.');
        }
        try {
            const respuesta: DatosClienteDTO = {
                id: user.id,
                nombre: user.nombre,
                apellido: user.apellido,
                email: user.email,
                fechaNacimiento: user.fechaNacimiento,
                nroTelefono: user.nroTelefono,
                tipoCliente: {
                    denominacion: user.role.tipoCliente.denominacion,
                    descripcion: user.role.tipoCliente.descripcion,
                },
            };
            return respuesta;
        } catch (error) {
            throw new InternalServerErrorException(
                'Error interno del servidor',
            );
        }
    }
    async getDatosEmpleadoById(id: number) {
        const user = await this.repository.findOne({
            where: { id },
            relations: ['role', 'role.permissions', 'role.tipoCliente'],
        });

        if (!user) {
            throw new NotFoundException('No se encontró ningún usuario.');
        }

        if (user.role.tipoCliente != null) {
            throw new BadRequestException('El usuario no es un empleado.');
        }

        return {
            id: user.id,
            nombre: user.nombre,
            apellido: user.apellido,
            email: user.email,
            fechaNacimiento: user.fechaNacimiento,
            nroTelefono: user.nroTelefono,
            legajo: user.legajo,
            role: {
                id: user.role.id,
                name: user.role.name,
            },
            permissions: user.role.permissions.map((p) => ({
                id: p.id,
                code: p.code,
            })),
        };
    }

    async findByEmail(email: string): Promise<UserEntity> {
        return await this.repository.findOne({
            where: { email },
            select: [
                'id',
                'nombre',
                'apellido',
                'email',
                'nroTelefono',
                'fechaNacimiento',
            ],
            relations: ['role', 'role.permissions', 'role.tipoCliente'],
        });
    }

    async refreshToken(refreshToken: string) {
        return this.jwtService.refreshToken(refreshToken);
    }

    canDo(user: UserI, permission: string): boolean {
        const result = user.role.getPermissionCodes().includes(permission);
        if (!result) {
            throw new ForbiddenException(
                'User does not have permission to do this action',
            );
        }
        return true;
    }

    async getUserById(id: number) {
        try {
            const result: UserEntity = await this.repository.findOne({
                where: { id },
                relations: ['role', 'role.tipoCliente', 'role.permissions'],
            });
            const response = {
                id: result.id,
                email: result.email,
                role: result.role,
            };
            return response;
        } catch (error) {
            throw new InternalServerErrorException(
                'Error interno del servidor',
            );
        }
    }
    async getDatosClienteByIdForVenta(id: number): Promise<DatosClienteDTO> {
        const user = await this.repository.findOne({
            where: { id },
            select: [
                'id',
                'nombre',
                'apellido',
                'email',
                'fechaNacimiento',
                'nroTelefono',
            ],
            relations: ['role', 'role.tipoCliente'],
        });
        if (!user) {
            throw new NotFoundException('No se encontró ningún usuario.');
        }
        if (user.role.tipoCliente == null) {
            throw new BadRequestException('El usuario no es un cliente.');
        }
        try {
            const respuesta: DatosClienteDTO = {
                id: user.id,
                nombre: user.nombre,
                apellido: user.apellido,
                email: user.email,
                fechaNacimiento: user.fechaNacimiento,
                nroTelefono: user.nroTelefono,
                tipoCliente: {
                    denominacion: user.role.tipoCliente.denominacion,
                    descripcion: user.role.tipoCliente.descripcion,
                },
            };
            return respuesta;
        } catch (error) {
            throw new InternalServerErrorException(
                'Error interno del servidor',
            );
        }
    }
}
