install.packages("BiocManager")  # اگر قبلاً نصب نشده است
BiocManager::install("affy")     # برای خواندن فایل‌های CEL
BiocManager::install("oligo")    # جایگزین پیشرفته‌تر برای affy

library(affy)
library(oligo)

# تنظیم مسیر دایرکتوری حاوی فایل‌های CEL
setwd("D:\\analyze\\GSE42743_RAW")

# خواندن فایل‌های CEL
cel_data <- ReadAffy()

# مشاهده اطلاعات اولیه
cel_data

# تنظیم مسیر دایرکتوری حاوی فایل‌های CEL
#setwd("مسیر/به/فایل‌های/CEL")

# خواندن فایل‌های CEL
#cel_data <- read.celfiles(list.celfiles())

# مشاهده اطلاعات اولیه
#cel_data

# اگر از پکیج affy استفاده می‌کنید
normalized_data <- rma(cel_data)

# اگر از پکیج oligo استفاده می‌کنید
#normalized_data <- rma(cel_data)

exprs_data <- exprs(normalized_data)

write.csv(exprs_data, file = "normalized_expression_data.csv")
