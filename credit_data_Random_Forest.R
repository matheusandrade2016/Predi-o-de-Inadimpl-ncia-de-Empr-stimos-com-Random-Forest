# Carregando nossa Bibliotecas para o teste

# Divisão Treinamento e teste
# install.packeages(caTools)
library(caTools)

# Instalando nosso Pacote de Random Forest
# install.packages('randomForest')

# Chamando o Pacote Random Forest - Algoritmo
library(randomForest)

# install.packages(caret)
library(caret)

# Curva Roc
library(pROC)

# Carregando a base de dados credito
base <-  read.csv('credit_data.csv')

# Apagando minha coluna ClientID, pois ela nao ira fazer diferença na hora de 
# ultilizarmos nossos algoritimos
base$clientid <-  NULL


# Atualizando meu valores onnde s????o negativos para a media

base$age <-  ifelse(base$age < 0, 40.92, base$age)

# Atualizando meus valores NA com nossas Medias da coluna AGE

base$age <-  ifelse(is.na(base$age), mean(base$age, na.rm = TRUE), base$age)

# Fazendo o enconder para a classe
base$default <-  factor(base$default, levels = c(0,1))


# 18 --> Escalonamento de atributos 

# Ultilizando a funçãoo do Proprio R 

base[, 1:3] <-  scale(base[, 1:3])


############################################################################

# Separando minha base entre treinamento e teste

# Ultilzando nossa Semente Aleatoria
set.seed(1)

# 1500 --> para treinar
# 500 --> teste 

# Podemos verificar os valores TRUE E FALSE
# TRUE --> irão compor os 75% da base de dados
# FALSE --> não irar compor os 75% da base de dados

divisao <-  sample.split(base$default, SplitRatio = 0.75)
divisao

# Criando minha base de treinamento

# subset --> irar criar um subconjunto
# base, divisao == TRUE --> onde for os valores TRUE ira jogar na base de dados

base_treinamento <-  subset(base, divisao == TRUE) 

# Criando minha base de dados de teste
base_teste <-  subset(base, divisao == FALSE)


# Criando nosso classificador

# x --> nossos atributos previsoes
# y --> nossa classe
# ntree --> numero de arvore que iremos colocar

classificador <-  randomForest(x = base_treinamento[-4], y = base_treinamento$default, ntree =  10)

print(classificador)


# Criando minha variavel de Previsoes
previsoes <-  predict(classificador, newdata = base_teste[-4])

# Criando miha variavel de matriz de confus??o
matriz_confusao <-  table(base_teste[, 4], previsoes)

print(matriz_confusao)


# Verificando minha acuracia com a matriz de confusão
confusionMatrix(matriz_confusao)

# Fazendo nossa Cross validation para nosso Modelo

# Nosso Hiperparametros 

grid <- expand.grid(.mtry = c(2,3,4))

str(grid)

# Nosso Criado
controle <- trainControl(method = "cv", number = 5)

# Nosso modelo

modelo_cross <- train(default ~ ., data = base_treinamento,
                      method = 'rf', tuneGrid = grid, trControl = controle)

# Vizualizando meu Modelo
modelo_cross

# Importância das variáveis
varImp(modelo_cross)

# Criando minahs previsoes
previsoes_cross <- predict(modelo_cross, newdata = base_teste[-4])
previsoes_cross

# Criando minha matriz de confusão
matriz_de_confusao_cross <- table(base_teste[,4], previsoes_cross)
matriz_de_confusao_cross

# Vizuaalizando minha matriz de confusão com a Biblioteca caret
confusionMatrix(matriz_de_confusao_cross)

# Vizualizando meu modelo
plot(modelo_cross)

# Criando nosso Objeto para nossa curva ROC " para avaliar o desempenho do modelo 
# em diferentes pontos de corte."

roc_obj <- roc(base_teste$default, predict(modelo_cross, newdata = base_teste, type = "prob")[,2])

# Vizualizando minha Curva ROC
plot(roc_obj)



