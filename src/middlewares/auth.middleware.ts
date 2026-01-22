import {
    CanActivate,
    ExecutionContext,
    HttpException,
    Injectable,
    UnauthorizedException,
} from '@nestjs/common';
import { JwtService } from '../jwt/jwt.service'; // cambio import { JwtService } from 'src/jwt/jwt.service';

@Injectable()
export class AuthGuard implements CanActivate {
    constructor(private jwtService: JwtService) { }

    canActivate(context: ExecutionContext): boolean {
        const request = context.switchToHttp().getRequest();
        const authHeader = request.headers.authorization;

        if (!authHeader) {
            throw new UnauthorizedException('Missing token');
        }

        console.log(authHeader);
        const token = authHeader.replace('Bearer ', '');
        const payload = this.jwtService.getPayload(token);
        console.log(payload);
        request.user = payload;

        return true;
    }
}
