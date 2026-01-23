import { Body, Controller, Get, Post, UseGuards, Param } from '@nestjs/common';
import { RolesService } from './roles.service';

@Controller('roles')
export class RolesController {
    constructor(private rolesService: RolesService) {}

    @Post('admin/create')
    createRole(@Body('name') name: string) {
        return this.rolesService.createRole(name);
    }

    @Get('admin/all')
    getAllRoles() {
        return this.rolesService.getAllRoles();
    }
    @Get('admin/role/:id')
    getRoleById(@Param('id') id: number) {
        return this.rolesService.getRoleById(id);
    }
}
