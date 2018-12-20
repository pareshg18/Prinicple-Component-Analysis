library(ggplot2)

data("iris")
str(iris)
summary(iris)

#Normalizing dataset(mean = 0)

iris$Sepal.Length <- iris$Sepal.Length - mean(iris$Sepal.Length)
iris$Sepal.Width <- iris$Sepal.Width - mean(iris$Sepal.Width)
iris$Petal.Length <- iris$Petal.Length - mean(iris$Petal.Length)
iris$Petal.Width <- iris$Petal.Width - mean(iris$Petal.Width)

#Calculating covariance matrix
covariance_matrix <- cov(iris[,1:4])
dim(covariance_matrix)

#Calculating eigen vector with eigen values
Eigen_vector <- eigen(covariance_matrix)

#Reducing dataset to 2 dimensions
reduced_vector <- Eigen_vector$vectors[,1:2]

#Deriving final data in 2 dimensions
transposed_vector <- t(reduced_vector)
dim(transposed_vector)

transposed_data <- t(iris[-5])
dim(transposed_data)

#final data
final_data <- t(transposed_vector %*% transposed_data)
names <- c('PC1','PC2')
colnames(final_data)<- names

final_data <- as.data.frame(final_data)

#Visualizing reduced dataset
ggplot(data = final_data, aes(x = PC1, y = PC2)) + geom_point(aes(color = iris$Species)) + ggtitle("Dimensionality reduced Iris dataset")
