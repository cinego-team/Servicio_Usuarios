import { Body, Controller, Get, Post, UseGuards } from '@nestjs/common';
import { RolesService } from './roles.service';

@Controller('roles')
export class RolesController {
    constructor(private rolesService: RolesService) {}

    @Post('create')
    createRole(@Body('name') name: string) {
        return this.rolesService.createRole(name);
    }

    @Get('admin/all')
    getAllRoles() {
        return this.rolesService.getAllRoles();
    }
}
