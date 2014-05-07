# Strip Charts
    #vPlots data in order along a line

stripchart(w1$vals)
stripchart(w1$vals,method="stack") #Repeated points stacked
stripchart(w1$vals,method="jitter") #More separation between boxes
stripchart(w1$vals,vertical=TRUE) #Vertical vs. horizontal plot
stripchart(w1$vals,vertical=TRUE,method="jitter")

# Add titles and labels
# Directly in stripchart code
stripchart(w1$vals,method="stack",
           main='Leaf BioMass in High CO2 Environment',
           xlab='BioMass of Leaves')
# After the fact
title('Leaf BioMass in High CO2 Environment', xlab='BioMass of Leaves')


# Histograms
hist(w1$vals)
hist(w1$vals,main="Distribution of w1",xlab="w1")

# Specify number of breaks
hist(w1$vals,breaks=2)
hist(w1$vals,breaks=8)

# Vary domain size
hist(w1$vals,breaks=12,xlim=c(0,10))
hist(w1$vals,breaks=12,xlim=c(0,10))
hist(w1$vals,breaks=12,xlim=c(-1,2))
hist(w1$vals,breaks=12,xlim=c(0,2))
hist(w1$vals,breaks=12,xlim=c(1,1.3))
hist(w1$vals,breaks=12,xlim=c(0.9,1.3))

# Add titles
hist(w1$vals,
     main='Leaf BioMass in High CO2 Environment',
     xlab='BioMass of Leaves')

title('Leaf BioMass in High CO2 Environment',xlab='BioMass of Leaves')


# Add other charts to histograms
hist(w1$vals,main='Leaf BioMass in High CO2 Environment',xlab='BioMass of Leaves',ylim=c(0,16))
stripchart(w1$vals,add=TRUE,at=15.5)


# Boxplots
boxplot(w1$vals)
boxplot(w1$vals,
        main='Leaf BioMass in High CO2 Environment',
        ylab='BioMass of Leaves')
# Can be horizontal -- good option to display with a histogram
boxplot(w1$vals,
        main='Leaf BioMass in High CO2 Environment',
        xlab='BioMass of Leaves',
        horizontal=TRUE)

# Add puts boxplot on histogram, at specifies where to put it, and addition of axes can be turned on or off using the axes command
hist(w1$vals,main='Leaf BioMass in High CO2 Environment',xlab='BioMass of Leaves',ylim=c(0,16))
boxplot(w1$vals,horizontal=TRUE,at=15.5,add=TRUE,axes=FALSE)

# Can add stripchart too
hist(w1$vals,main='Leaf BioMass in High CO2 Environment',xlab='BioMass of Leaves',ylim=c(0,16))
boxplot(w1$vals,horizontal=TRUE,at=16,add=TRUE,axes=FALSE)
stripchart(w1$vals,add=TRUE,at=15)

# Specifying which columns are factors is important
tree <- read.csv(file="/Users/Ali/Desktop/R Tutorial/trees91.csv", head=TRUE, sep=",")
tree$C <- factor(tree$C)
tree$N <- factor(tree$N)

# Boxplot for stem biomass
boxplot(tree$STBM,
        main="Stem BioMass in Different CO2 Environments",
        ylab="BiomMass of Stems")
# Make a separate box plot for each "level"
boxplot(tree$STBM~tree$C)


# Scatter Plots
plot(tree$STBM,tree$LFBM)
cor(tree$STBM,tree$LFBM) #Find correlation
plot(tree$STBM,tree$LFBM,
      main="Relationship Between Stem and Leaf Biomass",
      xlab="Stem Biomass",
      ylab="Leaf Biomass")



# Normal QQ Plots
qqnorm(w1$vals)
qqnorm(w1$vals,
       main="Normal Q-Q PLot of the Leaf Biomass",
       xlab="Theoretical Quantiles of the Leaf Biomass",
       ylab="Sample Quantiles of the Leaf Biomass")
qqline(w1$vals) #Plots line on which they would fall if they were normally disributed
     




