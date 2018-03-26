/*:
 ## Training
 Now we move onto what is often considered the bulk of machine learning — the training. In this step, we will use our data to incrementally improve our model’s ability to predict.
 
 The training process involves initializing some random values and attempting to predict the output with those values. As you might imagine, it does pretty poorly. But we can compare our model’s predictions with the output that it should produced, and adjust the values such that we will have more correct predictions.
 
 This process then repeats. Each iteration or cycle of updating the values is called one training “step”.
 */

//#-code-completion(everything,hide)
//#-code-completion(identifier, show, trainModel())

let mlRobot = MLRobot()
mlRobot/*#-editable-code*/.trainModel()/*#-end-editable-code*/
