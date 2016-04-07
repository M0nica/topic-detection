library(ggplot2)


df <- data.frame(x = c(1:100))
df$y <- 2 + 3 * df$x + rnorm(100, sd = 40)
#data has a x and y, aes define x and y variable - layers added to plot w/ pluses
#smoothing geometry - 
p <- ggplot(data = df, aes(x = x, y = y)) + geom_smooth(method = "lm", se=TRUE, color="black", formula = y ~ x) + geom_point()
p