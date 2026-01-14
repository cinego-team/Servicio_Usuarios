import {
    Body,
    Controller,
    Get,
    Head,
    Headers,
    Param,
    Post,
    Req,
    UseGuards,
} from '@nestjs/common';
import { UsersService } from './users.service';
import { LoginDTO } from '../dto/login.dto';
import { RegisterDTO } from '../dto/register.dto';
import { Request } from 'express';
import { RequestWithUser } from 'src/interfaces/request-user.interface';
import { RegisterEmpleadoDTO } from 'src/dto/register-empleado.dto';
import { AuthGuard } from '../middlewares/auth.middleware';

@Controller('usuario')
export class UsersController {
    constructor(private service: UsersService) {}

    @Get('api/:id')
    getUserById(@Param('id') id: number) {
        return this.service.getUserById(id);
    }

    @Post('login')
    login(@Body() loginBody: LoginDTO) {
        return this.service.login(loginBody);
    }

    @Post('register')
    async register(@Body() registerBody: RegisterDTO) {
        return this.service.register(registerBody);
    }

    @Post('admin/register/empleado')
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
    @UseGuards(AuthGuard)
    @Get('datos-cliente')
    getDatosClienteById(@Req() request: RequestWithUser) {
        console.log('USER DESDE TOKEN:', request.user);

        return this.service.getDatosClienteById(request.user.id);
    }

    @Get('datos-empleado/:id')
    getDatosEmpleadoById(@Param('id') id: number) {
        return this.service.getDatosEmpleadoById(id);
    }

    @Get('find-by-email/:email')
    findByEmail(@Param('email') email: string) {
        return this.service.findByEmail(email);
    }
}
