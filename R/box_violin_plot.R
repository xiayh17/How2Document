#' box_violin_plot.
#'
#' 绘制小提琴+箱型图.
#' @param name a title text for your plot
#'
#' @return a box and violin plot
#' @export
#' @import ggplot2
#' @importFrom ggpubr stat_compare_means
#' @family box_violin_plot
#' @examples
#' name='Folate biosynthesis'
#' png(filename = paste0(tempdir(),'/Folate biosynthesis.png'),width = 1080,height = 1440,res = 300)
#' box_violin_plot(name)
#' dev.off()
box_violin_plot<-function(name){
  # 选择一个特征，重新构建一个数据框
  df<-data.frame(pathway=t(Pathway[name,]),group=group2)
  colnames(df)<-c('pathway','group')
  # 组别名称排序
  df$group<-factor(df$group,levels = c('Control','AB','AA'))
  # 构建两两比较的组合
  comparision<-list(c('Control','AB'),c('Control','AA'),c('AB','AA'))
  # ggplot画图
  ggplot(data=df,aes(x=group,y=pathway,fill=group))+
    geom_violin(alpha=0.6,trim=F)+
    # 手动选择颜色
    scale_fill_manual(values = c('#646464','#A00000','#099963'))+
    # 设置箱型图的误差棒
    stat_boxplot(geom='errorbar',width=0.2)+
    geom_boxplot(width=0.3,alpha=1,outlier.color = 'black',outlier.shape=3)+
    geom_jitter(width = 0.2)+
    stat_summary(fun= mean,geom = 'point',shape=23,fill='yellow')+
    labs(title = name,x='',y='Predicted relative abundance (%)')+
    theme_set(theme_bw())+
    theme(plot.title=element_text(hjust = 0.5,face = 'bold'),
          axis.title.y = element_text(color = 'black',face = 'bold'),
          axis.text = element_text(size = 9,face = 'bold',color = 'black'),
          legend.position='none',
          axis.ticks.x = element_blank(),
          panel.grid = element_blank())+
    stat_compare_means(method = 'wilcox.test',comparisons = comparision,label='p.signif')+
    expand_limits(y=1.2*max(Pathway[name,]))
}
