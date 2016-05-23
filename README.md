# Plataforma base para MC723 #

## O que é uma plataforma? ##

Uma *plataforma* é um software capaz de emular/simular um hardware com características reais. No nosso caso, temos um processador MIPS, como já utilizado no projeto anterior, um módulo de memória e um barramento, além do software que executará sobre esta plataforma.

## Como utilizar a plataforma base? ##

No caso geral, dois comandos são necessários para compilar e executar a plataforma:

{
make
make run
}

ou, de forma simplificada

{
make all run
}

O primeiro comando (_make all_) compila toda a plataforma, incluindo as pastas com cada um dos componentes. O segundo comando (_make run_) executa a plataforma com os parâmetros corretos para executar o software simulado. No nosso exemplo, este é um Hello World.

## O que configurar? ##

Se copiar esta pasta inteira para dentro de um computador do IC-3, ela deve continuar funcionando. Caso queira ter uma versão no seu notebook, você deve configurar as primeiras linhas do _Makefile_ principal do pacote. Não deve ser necessário copiar nada além deste arquivo. No entanto, é necessário ter SystemC, ArchC e os cross-compilers já instalados nesta outra máquina. Veja as instruções para instalação na página da disciplina.


## ENGLISH

# Platform basis for MC723 #

## What is a platform? ##

A platform is a software able to emulate / simulate a real hardware features. In our case, we have a MIPS processor, as used in the previous project, a memory module and a bus, in addition to the software that will run on this platform.

## How to use the base platform? ##

In the general case, two commands are needed to build and run the platform:

{
make
make run
}

or, in simplified form

{
make all run
}

The first command (_make ALL_) compiles the whole platform, including folders each component. The second command (_make run_) performs the platform with the correct parameters to run the simulation software. In our example, this is a Hello World.

## What set? ##

If you copy this entire folder into an IC-3 computer, it should continue working. If you want to have a version on your notebook, you must set up the first lines of the main package _Makefile_. It should not be necessary to copy anything beyond this file. However, you need SystemC, ArchC and cross-compilers already installed on this other machine. See the installation instructions on the course page.