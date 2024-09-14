# Predição de Inadimplência de Empréstimos com Random Forest

**Introdução:**

Este projeto tem como objetivo desenvolver um modelo de predição para identificar o risco de inadimplência de clientes de crédito, utilizando a técnica de Random Forest. A predição precisa de inadimplência é fundamental para instituições financeiras, pois permite reduzir perdas e otimizar a tomada de decisão.

**Metodologia:**

1. **Coleta de Dados:** Os dados foram pré-processados para lidar com valores ausentes (imputação pela média) e padronizados. Foi realizada uma seleção de features utilizando a importância das variáveis fornecida pelo modelo Random Forest.

2. **Pré-processamento:** Os dados foram pré-processados para lidar com valores ausentes Média, Valoes Nulos e Padronização ultilziando a função scale

3. **Modelagem:** Um modelo de Random Forest foi treinado utilizando o algoritmo Random Forest

4. **Avaliação:** O modelo foi avaliado utilizando a técnica de cross-validation  de 5 folds. As métricas de acurácia, precisão, recall e F1-score Curva Roc calculadas.

**Modelagem**

Um modelo de Random Forest foi treinado com os seguintes hiperparâmetros: 'mtry = c(2,3,4), `ntree = 10`. A cross-validation de 5 folds foi utilizada para avaliar o desempenho do modelo.

**Hiperparâmetros:** Utilizou-se o método de grid search para encontrar os melhores valores para `mtry` e `ntree`. O valor de `mtry = 3` foi escolhido, pois resultou na maior acurácia na validação cruzada.

**Resultados:**

O modelo apresentou uma acurácia de 99% na previsão de inadimplência. As variáveis mais importantes para a classificação foram renda, idade e histórico de crédito. A figura abaixo mostra a matriz de confusão e Curva ROC do modelo:

![image](https://github.com/user-attachments/assets/1414ecbb-6a85-407f-b071-50abf167e9b8)

![image](https://github.com/user-attachments/assets/21f772e5-d52f-4006-8aef-66631fcf33b3)


**Limitações:**

**Desbalanceamento de classes:** A taxa de inadimplência geralmente é baixa, o que pode levar a um viés em favor da classe majoritária.

**Generalização:** O modelo pode não generalizar bem para novos conjuntos de dados com características diferentes.

**Tecnologias Utilizadas:**

* Linguagem: R
* Bibliotecas: randomForest, pROC, catools, caret
* Ambiente: RStudio

  # Uso:
  
- Carregar a base de dados com informações dos clientes e seus empréstimos.
- Dividir a base em conjuntos de treino e teste.
- Treinar o modelo randomForest "RandomForest "Floresta Aleatória"
- Fazer previsões para novos clientes.
- Avaliar o desempenho do modelo com as métricas e a matriz de confusão.

**Autor:**
Matheus Andrade Moreira
