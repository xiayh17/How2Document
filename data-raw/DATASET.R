## code to prepare `DATASET` dataset goes here

# batch_deseq -------------------------------------------------------------
data<-read.csv("data-raw/data2.csv")

rownames(data)<-data[,1]
data<-data[,-1]
head(data)
exp_data <- data[1:1000,1:12]
colnames(exp_data)
head(exp_data)
group=c("A","B","C","D")

usethis::use_data(exp_data, overwrite = TRUE)
usethis::use_data(group, overwrite = TRUE)


# box_violin_plot ---------------------------------------------------------
rm(list = ls())
## 拒绝把字符转化为因子
options(stringsAsFactors = F)
## 读取元数据，第一列为样品名，设置样品名为行名
metadata<-read.table('data-raw/metadata.txt',sep = '\t',header = T,quote = '',
                     row.names = 1, check.names = F)
## 设置分组信息
group2<-metadata$group
## 读取PICRUST预测的KEGG pathway，设置通路名为行名，样品名为列名
Pathway<-read.table('data-raw/pathway.txt',sep = '\t',header = T,quote = '',
                    row.names = 1, check.names = F)
## 样品名与元数据保持一致
Pathway<-Pathway[,rownames(metadata)]

usethis::use_data(group2,Pathway,internal = TRUE,overwrite = TRUE)

# col_to_rownames.R -------------------------------------------------------
rm(list = ls())
## set data height
dims <- 10
set.seed(20210718)
num <- sample(1:dims,replace = TRUE)
set.seed(20210718)
sample1 <- runif(dims)
sample2 <- runif(dims)
sample3 <- runif(dims)
sample4 <- runif(dims)

dup_data <- data.frame(
  genes = paste0(rep("gene",10),num),
  sample1 = sample1,
  sample2 = sample2,
  sample3 = sample3,
  sample4 = sample4
)

usethis::use_data(dup_data, overwrite = TRUE)


# get_genes ---------------------------------------------------------------

download.file("https://cdn.jsdelivr.net/gh/xiayh17/Figs@main/uPic/fgseaRes.Rda",destfile = "data-raw/fgseaRes.Rda")
load('data-raw/fgseaRes.Rda')

sea_data <- as.data.frame(fgseaRes)

usethis::use_data(sea_data, overwrite = TRUE)
