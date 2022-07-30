CREATE DATABASE "shop_database";

CREATE TABLE "customers" (
	"id" SERIAL PRIMARY KEY,
	"fullName" TEXT NOT NULL,
	"cpf" BIGINT UNIQUE NOT NULL,
    "email" TEXT UNIQUE NOT NULL,
    "password" TEXT NOT NULL
);

CREATE TABLE "customerAddresses" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER UNIQUE NOT NULL REFERENCES "customers"("id"),
    "street" VARCHAR(100) NOT NULL,
    "number" INTEGER,
    "complement" VARCHAR(100),
    "neighborhood" VARCHAR(50) NOT NULL,
    "city" VARCHAR(50) NOT NULL,
    "state" VARCHAR(2) NOT NULL,
    "zipCode" BIGINT NOT NULL
);

CREATE TABLE "customerPhones" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "number" TEXT,
    "type" TEXT
);

CREATE TABLE "cities" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT,
    "stateId" INTEGER NOT NULL REFERENCES "states"("id")
);

CREATE TABLE "states" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT
);

CREATE TABLE "bankAccount" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "accountNumber" TEXT,
    "agency" TEXT,
    "openDate" TIMESTAMP WITHOUT TIMEZONE NOT NULL DEFAULT NOW(),
    "closeDate" DATE
);

CREATE TABLE "transactions" (
    "id" SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    "amount" bigint,
    "type" TEXT,
    "time" TIMESTAMP WITHOUT TIMEZONE NOT NULL DEFAULT NOW(),
    "description" TEXT,
    "canceled" BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE "creditCards" (
    "id" SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    "name" TEXT,
    "number" BIGINT,
    "securityCode" INTEGER,
    "expirationMonth" INTEGER NOT NULL,
    "expirationYear" INTEGER NOT NULL,
    "password" TEXT,
    "limit" BIGINT
);

