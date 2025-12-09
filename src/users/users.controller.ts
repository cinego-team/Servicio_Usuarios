import { Body, Controller, Get, Head, Headers, Param, Post, Req, UseGuards } from '@nestjs/common';
import { UsersService } from './users.service';
import { LoginDTO } from '../dto/login.dto';
import { RegisterDTO } from '../dto/register.dto';
import { Request } from 'express';
import { RequestWithUser } from 'src/interfaces/request-user.interface';
import { RegisterEmpleadoDTO } from 'src/dto/register-empleado.dto';
import { AuthGuard } from '../middlewares/auth.middleware';

@Controller('usuario')
export class UsersController {
    constructor(private service: UsersService,
    ) { }

    @Post('login')
    login(@Body() loginBody: LoginDTO) {
        return this.service.login(loginBody);
    }

    @Post('register')
    async register(@Body() registerBody: RegisterDTO) {
        return this.service.register(registerBody);
    }

    @Post('register/empleado')
    registerEmpleado(@Body() datosEmpleado: RegisterEmpleadoDTO) {
        return this.service.registerEmpleado(datosEmpleado);
    }

    @Get('can-do/:permission')
    @UseGuards(AuthGuard)
    canDo(
        @Req() request: RequestWithUser,
        @Param('permission') permission: string,
    ) {
        return this.service.canDo(request.user, permission);
    }

    @Get('refresh-token')
    refreshToken(@Req() request: Request) {
        return this.service.refreshToken(
            request.headers['refresh-token'] as string,
        );
    }

    @Get('datos-cliente/:id')
    getDatosClienteById(@Param('id') id: number) {
        return this.service.getDatosClienteById(id);
    }

    @Get('datos-empleado/:id')
    getDatosEmpleadoById(@Param('id') id: number) {
        return this.service.getDatosEmpleadoById(id);
    }
}
