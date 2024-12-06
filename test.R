#From our analysis and visualization we can say that
#GPA is not normally distributed - so we will use Spearman

cor.test(df$iq, df$gpa, method="spearman")
