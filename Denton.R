#Instalando e ativando pacote necessário
#install.packages("tempdisagg")
library("tempdisagg")

#Definindo diretório
getwd()
setwd("C:\\Users\\e270780232\\Desktop\\Arquivos\\R\\Denton ")

#Importando séries

#Série trimestral sem ajuste
baseT = read.csv2("Serie trimestral.csv", header=T)
tstri<-ts(baseT, start = c(1995, 1), end = c(2008, 4), frequency = 4)

#Série anual
baseA = read.csv2("Serie anual.csv", header=T)
tsanu<-ts(baseA, start = 1995, end = 2008, frequency = 1)

#Aplicando Denton
Denton <- td(tsanu ~ 0 + tstri, conversion="average", to = "quarterly", method = "denton", h="2")
baseD = ts(Denton$values, start = c(1995, 1), end = c(2008, 4), frequency = 4)
#Exportando arquivo
write.csv2(baseD, "Serie trimestral ajustada por Denton.csv")