import { Body, Controller, Get, Post, UseGuards } from '@nestjs/common';
import { PermissionsService } from './permissions.service';

@Controller('permissions')
export class PermissionsController {
    constructor(private permissionsService: PermissionsService) {}

    @Post('create')
    createPermission(@Body('code') code: string) {
        return this.permissionsService.createPermission(code);
    }

    @Get()
    getAllPermissions() {
        return this.permissionsService.getAllPermissions();
    }
}
