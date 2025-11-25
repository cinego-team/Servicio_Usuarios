import { Module } from "@nestjs/common";
import { TypeOrmModule } from "@nestjs/typeorm";
import { UsersController } from "./users.controller";
import { UsersService } from "./users.service";
import { JwtService } from "../jwt/jwt.service";
import { UserEntity } from "../entities/user.entity";
import { CaptchaService } from "src/services/captcha-service";

@Module({
    imports: [TypeOrmModule.forFeature([UserEntity])],
    controllers: [UsersController],
    providers: [UsersService, JwtService, CaptchaService],
    exports: [UsersService],
})
export class UsersModule { }
