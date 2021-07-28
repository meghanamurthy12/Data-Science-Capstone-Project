data <- read.csv('daily_aggregate_data.csv')

# Standardize the data
data$mean_cloud_s <- (data$mean_cloud - mean(data$mean_cloud)) / sqrt(var(data$mean_cloud))
data$mean_temp_s <- (data$mean_temp - mean(data$mean_temp)) / sqrt(var(data$mean_temp))
data$mean_radiation_s <- (data$mean_radiation - mean(data$mean_radiation)) / sqrt(var(data$mean_radiation))
data$mean_power_s <- (data$mean_power - mean(data$mean_power)) / sqrt(var(data$mean_power))

fit1 <- lm(mean_power_s ~ mean_cloud_s, data)
fit2 <- lm(mean_power_s ~ mean_temp_s, data)
fit3 <- lm(mean_power_s ~ mean_cloud_s + mean_temp_s, data)
fit4 <- lm(mean_power_s ~ mean_cloud_s + mean_temp_s + mean_radiation_s, data)

summary(fit1)
summary(fit2)
summary(fit3)
summary(fit4)

confint(fit1, level=0.95)
confint(fit2, level=0.95)
confint(fit3, level=0.95)
confint(fit4, level=0.95)

# 5-Fold cross validation for fit4 (MLR) model
folds <- floor(runif(nrow(data), min=0, max=5)) + 1
rmse_vec <- c()
for (i in 1:5){
        train <- folds != i
        test <- !train
        fit <- lm(mean_power_s ~ mean_cloud_s + mean_temp_s + mean_radiation_s, data=data[train,])
        rmse <- sqrt(mean((data$mean_power[test] - (predict(fit, newdata=data[test,]) * sqrt(var(data$mean_power)) + mean(data$mean_power)))^2))
        rmse_vec[i] <- rmse
}
mean(rmse_vec)