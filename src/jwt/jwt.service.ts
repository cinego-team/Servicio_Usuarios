import {
    HttpException,
    Injectable,
    UnauthorizedException,
} from '@nestjs/common';
import { sign, verify } from 'jsonwebtoken';
import dayjs from 'dayjs';
import { Payload } from '../interfaces/payload.interface';

@Injectable()
export class JwtService {
    // config.ts
    // [
    config = {
        auth: {
            secret: 'authSecret',
            expiresIn: '15m',
        },
        refresh: {
            secret: 'refreshSecret',
            expiresIn: '1d',
        },
    };
    // ]

    // genera el token de acceso o de refresh
    // [
    generateToken(payload: Payload, type: 'refresh' | 'auth' = 'auth'): string {
        return sign(payload, this.config[type].secret, {
            expiresIn: this.config[type].expiresIn,
        });
    }
    // ]

    // re-genera un token de acceso (y un token de refresh de ser necesario)
    // [
    refreshToken(refreshToken: string): {
        accessToken: string;
        refreshToken: string;
    } {
        try {
            const payload = this.getPayload(refreshToken, 'refresh');

            const timeToExpire = dayjs
                .unix(payload.exp)
                .diff(dayjs(), 'minute');

            // sacamos exp / iat del payload
            const { exp, iat, ...cleanPayload } = payload;

            return {
                accessToken: this.generateToken(cleanPayload as Payload),
                refreshToken:
                    timeToExpire < 15
                        ? this.generateToken(cleanPayload as Payload, 'refresh')
                        : refreshToken,
            };
        } catch {
            throw new UnauthorizedException();
        }
    }

    // ]

    // verifica el token y obtiene el payload desencriptado
    // [
    getPayload(token: string, type: 'refresh' | 'auth' = 'auth'): Payload {
        const decoded = verify(token, this.config[type].secret);

        if (typeof decoded === 'string') {
            throw new UnauthorizedException('Invalid token');
        }

        return {
            sub: decoded.sub,
            role: decoded.role,
            id: Number(decoded.sub),
            rol: decoded.role,
            email: decoded.email,
            permissions: decoded.permissions,
        } as Payload;
    }
    // ]
}
