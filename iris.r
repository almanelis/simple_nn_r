# Подгружаем необходимую для обучения библиотеку
library(neuralnet)
# Загружаем датасет с ирисами
data(iris)

set.seed(245)

# Разделяем набор данных на обучающий и тестовый в соотношении 80:20
data_rows <- floor(0.80 * nrow(iris))
train_indices <- sample(c(1:nrow(iris)), data_rows)
train_data <- iris[train_indices,]
test_data <- iris[-train_indices,]

# Обучаем модель и создаем два скрытых слоя, первый слой с 
# четырьмя нейронами и второй с двумя нейронами
model = neuralnet(
  Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width,
  data=train_data,
  hidden=c(4,2),
  linear.output = FALSE
)

# Визуализирование архитекрутры модели
plot(model,rep = "best")

# Вывод точности модели
check = as.numeric(test_data$Species) == max.col(pred)
accuracy = (sum(check)/nrow(test_data))*100
print(accuracy)