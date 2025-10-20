// import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from "typeorm";
// import { UserEntity } from "./user.entity";

// @Entity("tipoDni")
// export class TipoDniEntity {
//   @PrimaryGeneratedColumn()
//   id: number;

//   @Column({ unique: true })
//   denominacion: string;

//   @OneToMany(() => UserEntity, (user) => user.tipoDni)
//   users: UserEntity[];
// }
