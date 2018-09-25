train<- read.csv("C:/Users/Hannan Qazi/Desktop/trainwithoutna.csv")
test<- read.csv("C:/Users/Hannan Qazi/Desktop/tstage2.csv")

h2o.init(nthreads= -1, max_mem_size="16G")
h2o.removeAll()
train.hex=as.h2o(train)
test.hex=as.h2o(test)
dlmodel=h2o.randomForest(x=3:37,y=38,training_frame = train.hex,
                         nfolds=5)
predictdl=predict(dlmodel, test.hex)

h2o.exportFile(predictdl$predict,'C:/Users/Hannan Qazi/Desktop/dl_sample.csv')
p

#submissiondl$cancer = as.integer(submissiondl$cancer)
#submissiondl$cancer=submissiondl$cancer-1
d = aggregate(submissiondl[,2],list(submissiondl$id),mean)
d = data.frame(id=d$Group.1, cancer=d$x)
write.csv(d, file = "C:/Users/Ishaan/Desktop/Submissiondl.csv", row.names=FALSE)