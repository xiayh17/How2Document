#' Batch DESeq Difference.
#'
#' Useful to compute a batch of DEG matrix
#' @param exprSet exp data
#' @param group group info of samples
#' @param num Number of repetitions per group
#' @param save_dir A path to save the results
#'
#' @return Difference expression files corresponding to different groupings
#' @export
#' @family Batch DESeq
#' @importFrom stats relevel
#' @importFrom utils write.csv
#' @importFrom DESeq2 DESeqDataSetFromMatrix DESeq resultsNames results counts
#' @importFrom BiocGenerics rowSums
#' @examples
#' \dontrun{
#' Batch_Deseq_difference(exprSet=exp_data,group,3,save_dir = tempdir())
#' }
Batch_Deseq_difference<-function(exprSet,group,num,save_dir="Alldiffenece"){
  ##create a folder
  save_dir<-paste0(save_dir,"/")
  dir.create(save_dir)
  ## creat a group
  group_list= factor(rep(group,each=num))
  colData=data.frame(row.names = colnames(exprSet),
                     group=group_list)

  dat<-data.frame()
  ## use the Deseq2 to have Diffence analyse
  for (i in 1:length(group)){
    name=unique(group)[i]
    message(name)
    colData$group<-relevel(colData$group,ref=name)
    dds=DESeq2::DESeqDataSetFromMatrix(countData = exprSet,
                                       colData = colData,
                                       design = ~group)
    dds <- dds[ rowSums(DESeq2::counts(dds)) > 10, ]
    dds <- DESeq2::DESeq(dds, betaPrior = FALSE)
    for (j in 2:length(DESeq2::resultsNames(dds))){

      resname=DESeq2::resultsNames(dds)[j]

      res=DESeq2::results(dds, contrast=list( c(resname)))
      write.csv(res,paste0(save_dir,resname,".csv"))

    }

  }

}
