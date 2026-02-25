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
import { RequestWithUser } from '../interfaces/request-user.interface';
import { RegisterEmpleadoDTO } from '../dto/register-empleado.dto';
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
        return this.service.getDatosClienteById(request.user.id);
    }
    @UseGuards(AuthGuard)
    @Get('datos-empleado')
    getDatosEmpleado(@Req() req: RequestWithUser) {
        return this.service.getDatosEmpleadoById(req.user.id);
    }

    @Get('find-by-email/:email')
    findByEmail(@Param('email') email: string) {
        return this.service.findByEmail(email);
    }
    @Get('admin/datos-cliente/:id')
    getDatosClienteByIdForVenta(@Param('id') id: number) {
        return this.service.getDatosClienteByIdForVenta(id);
    }

    @Get('admin/datos-empleado/:id')
    getDatosEmpleadoByIdAdmin(@Param('id') id: number) {
        return this.service.getDatosEmpleadoById(+id);
    }
}
