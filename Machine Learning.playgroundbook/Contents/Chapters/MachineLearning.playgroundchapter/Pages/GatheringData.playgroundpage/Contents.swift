/*:
 ## Gathering Data
 Once we have our equipment, it’s time for our first real step of machine learning: gathering data. This step is very important because the quality and quantity of data that you gather will directly determine how good your predictive model can be.
 
 ## Data Preparation
 Now it’s time for the next step of machine learning: Data preparation, where we load our data into a suitable place and prepare it for use in our machine learning training.
 
 We’ll first put all our data together, and then randomize the ordering. We don’t want the order of our data to affect what we learn.
 
 We’ll also need to split the data in two parts. The first part, used in training our model, will be the majority of the dataset. The second part will be used for evaluating our trained model’s performance.
 
 Lets start with the data gathering and preparing process by calling the gatherData function.
 Pass the gatheringDataArray to gatherData function

 Hint: MachineLearning().gatherData(gatheringDataArray)
 
 Hint: Values in array should be between 1 and 10 and the length of array should not exceed 6
 */

let gatheringDataArray = [3,10,8,7,4,5]
MachineLearning().gatherData(gatheringDataArray)


